create table board
(
	seq  number,         -- 게시물 식별값 
	userid varchar2(40), -- 사용자아이디
	title varchar2(600), -- 제목
	contents clob,  -- 내용(varchar2는 4000이최고, clob - 2g)
	filename1  varchar2(300), -- 첨부파일 
	filename2  varchar2(300), -- 첨부파일 
	filename3  varchar2(300), -- 첨부파일 
	regdate  date,  -- 등록일
	moddate  date,  -- 수정일
	delyn    char(1), -- 삭제여부, Y-삭제, 기본-N
	group_id number,  -- 그룹아이디 
	depth    number,  -- 글의 깊이 
	g_level    number,   -- 그룹내에서의 내 순서 
	hit number	
);
alter table board add constraint PK_BOARD primary key (seq);    -- seq에 pk 부여

-- 부모글 넣기
insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 1,'test1', '제목1', '내용1', sysdate, 1, 0, 1, 0);
insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 2,'test2', '제목2', '내용2', sysdate, 2, 0, 1, 0);
insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 3,'test3', '제목3', '내용3', sysdate, 3, 0, 1, 0);
insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 4,'test4', '제목4', '내용4', sysdate, 4, 0, 1, 0);
insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 5,'test5', '제목5', '내용5', sysdate, 5, 0, 1, 1);

commit;

select * from board;

-- 자식글 넣기 : group_id=1(부모글과 같음), depth=1(부모글 depth 0+1), g_level=2(부모글 level 1+1)
insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 6,'test2', '여기는 댓글1', '댓글1임', sysdate, 1, 0, 2, 0);

select * from board order by group_id desc, g_level asc;

insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 7,'test2', '여기는 댓글1', '자식글임', sysdate, 5, 1, 2, 0);

commit;

update board set g_level=g_level+1 where group_id=5 and g_level>1;
insert into board(seq, userid, title, contents, regdate, group_id, depth, g_level, hit)
values( 8, 'test2', '답글1', '자식글임', sysdate, 5, 1, 2, 0);

-- 8번 글에 자식글이 붙을 때 그룹아이디는 원글의 아이디, 레벨은 부모글(8)+1
update board set g_level=g_level+1 where group_id=5 and g_level>2;
insert into board(seq, userid, title, contents, regdate, group_id, depth, g_level, hit)
values( 9, 'test2', '답글1', '자식글임', sysdate, 5, 2, 3, 0);
update board set depth=2 where seq=9;
commit;

select * from board order by group_id desc, g_level asc;

desc board;

select
    A.seq
    , A.title
    , A.userid
    , nvl(filename1,'') filename1
    , nvl(filename2,'') filename2
    , nvl(filename3,'') filename3
    , to_char(regdate, 'yyyy-MM-dd') regdate
    , to_char(moddate, 'yyyy-MM-dd') moddate
    , rnum as num
    , nvl(hit, 0) hit
from (
    select
        A.seq
        , A.title
        , A.userid
        , A.contents
        , A.filename1
        , A.filename2
        , A.filename3
        , A.regdate
        , A.moddate
        , A.hit
        , row_number() over(order by group_id desc, g_level asc) rnum
        , ceil(row_number() over(order by group_id desc, g_level asc)/10)-1 pg
    from board A) A where pg=0;
    commit;
    
    
insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 10,'test1', '제목1', '내용1', sysdate, 6, 0, 1, 0);
insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 11,'test1', '제목1', '내용1', sysdate, 7, 0, 1, 0);
insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 12,'test1', '제목1', '내용1', sysdate, 8, 0, 1, 0);
insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 13,'test1', '제목1', '내용1', sysdate, 9, 0, 1, 0);
insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 14,'test1', '제목1', '내용1', sysdate, 10, 0, 1, 0);
commit;



select
			A.seq
			, A.title
			, A.userid
			, nvl(filename1,'') filename1
			, nvl(filename2,'') filename2
			, nvl(filename3,'') filename3
			, to_char(regdate, 'yyyy-MM-dd') regdate
			, to_char(moddate, 'yyyy-MM-dd') moddate
			, rnum as num
			, nvl(hit, 0) hit
			, A.group_id
			, A.depth
			, A.g_level
		from (
			select
				A.seq
				, A.title
				, A.userid
				, A.contents
				, A.filename1
				, A.filename2
				, A.filename3
				, A.regdate
				, A.moddate
				, A.hit
				, A.group_id
				, A.depth
				, A.g_level
				, row_number() over(order by group_id desc, g_level asc) rnum
				, ceil(row_number() over(order by group_id desc, g_level asc)/10)-1 pg
			from board A
		) A where pg=0
        
        
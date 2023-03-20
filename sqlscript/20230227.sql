create table board
(
	seq  number,         -- �Խù� �ĺ��� 
	userid varchar2(40), -- ����ھ��̵�
	title varchar2(600), -- ����
	contents clob,  -- ����(varchar2�� 4000���ְ�, clob - 2g)
	filename1  varchar2(300), -- ÷������ 
	filename2  varchar2(300), -- ÷������ 
	filename3  varchar2(300), -- ÷������ 
	regdate  date,  -- �����
	moddate  date,  -- ������
	delyn    char(1), -- ��������, Y-����, �⺻-N
	group_id number,  -- �׷���̵� 
	depth    number,  -- ���� ���� 
	g_level    number,   -- �׷쳻������ �� ���� 
	hit number	
);
alter table board add constraint PK_BOARD primary key (seq);    -- seq�� pk �ο�

-- �θ�� �ֱ�
insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 1,'test1', '����1', '����1', sysdate, 1, 0, 1, 0);
insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 2,'test2', '����2', '����2', sysdate, 2, 0, 1, 0);
insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 3,'test3', '����3', '����3', sysdate, 3, 0, 1, 0);
insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 4,'test4', '����4', '����4', sysdate, 4, 0, 1, 0);
insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 5,'test5', '����5', '����5', sysdate, 5, 0, 1, 1);

commit;

select * from board;

-- �ڽı� �ֱ� : group_id=1(�θ�۰� ����), depth=1(�θ�� depth 0+1), g_level=2(�θ�� level 1+1)
insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 6,'test2', '����� ���1', '���1��', sysdate, 1, 0, 2, 0);

select * from board order by group_id desc, g_level asc;

insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 7,'test2', '����� ���1', '�ڽı���', sysdate, 5, 1, 2, 0);

commit;

update board set g_level=g_level+1 where group_id=5 and g_level>1;
insert into board(seq, userid, title, contents, regdate, group_id, depth, g_level, hit)
values( 8, 'test2', '���1', '�ڽı���', sysdate, 5, 1, 2, 0);

-- 8�� �ۿ� �ڽı��� ���� �� �׷���̵�� ������ ���̵�, ������ �θ��(8)+1
update board set g_level=g_level+1 where group_id=5 and g_level>2;
insert into board(seq, userid, title, contents, regdate, group_id, depth, g_level, hit)
values( 9, 'test2', '���1', '�ڽı���', sysdate, 5, 2, 3, 0);
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
values( 10,'test1', '����1', '����1', sysdate, 6, 0, 1, 0);
insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 11,'test1', '����1', '����1', sysdate, 7, 0, 1, 0);
insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 12,'test1', '����1', '����1', sysdate, 8, 0, 1, 0);
insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 13,'test1', '����1', '����1', sysdate, 9, 0, 1, 0);
insert into board(seq, userid, title, contents,regdate, group_id, depth, g_level, hit)
values( 14,'test1', '����1', '����1', sysdate, 10, 0, 1, 0);
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
        
        
-- DB에서 외래키 부여
-- tb_guestbook이 tb_member 테이블을 참조하려고 할 때
-- 현재는 이미 입력된 데이터가 foreign key 조건을 만족하지 못하기 때문에 foreign key 설정을 못한다
alter table tb_guestbook
add constraint FK_member_guestbook
foreign key (writer)
references tb_member(m_id);
-- tb_guestbook 테이블의 writer 필드가 tb_member 테이블의 m_id를 참조하게 되는 구조
-- 위 실행문에서는 에러가 발생한다
-- foreign key를 설정하려면 두 필드의 데이터 타입이 서로 일치해야 함
-- tb_guestbook의 m_userid 필드의 값이 tb_member테이블에 들어가 있어야 한다

insert into tb_member (m_id, m_userid, m_password, m_name, m_email, m_phone) 
values(sq_member.nextval, 'test3','3333','테스트','test@gmail.com', '010-3333-3333');

update tb_guestbook set writer='test3';
commit;


alter table tb_guestbook
add constraint FK_member_guestbook
foreign key (writer)
references tb_member(m_userid);

insert into tb_member (m_id, m_userid, m_password, m_name, m_email, m_phone) 
values(sq_member.nextval, 'test4','4444','테스트2','test4@gmail.com', '010-4444-4444');

update tb_guestbook set writer='test4'
where seq>10;

update tb_guestbook set writer='test3'
where seq<=10;
commit;

select * from tb_guestbook;
select a.seq, a.title, a.writer, b.m_userid, a.wdate, a.contents
from tb_guestbook a
left outer join tb_member b
on a.writer = b.m_userid
order by a.seq desc;

-- order by는 rownum 부여 이후 적용되기 때문에 먼저 정렬을 한 다음 rownum를 줌
-- rownum을 이용한 페이징 쿼리: rownum는 DB로부터 데이터를 가져올 때 임시로 붙이는 이름이며 order by보다 먼저 적용됨
select rownum rnum, a.seq, a.title, a.m_name, a.wdate, a.contents, a.hit
from (select a.seq, a.title, a.writer, b.m_name, a.wdate, a.contents, a.hit
from tb_guestbook a
left outer join tb_member b
on a.writer = b.m_userid
order by a.seq desc) a;
-- 이런 식으로 from절에서 걸러줌

-- 한 페이지당 5개씩 글을 가져오기(6~10번째 글은 거르기)
-- rownum 필드는 데이터를 가져오는 시점에 번호를 생성함
-- 가져오기 전에 조건체크부터 먼저 하면 데이터가 하나도 체크되지 않는다
-- ->rownum >=6 and rownum<=10이라고 쓰면 데이터가 한 건도 안 들어오는 이유
select rownum rnum, a.seq, a.title, a.m_name, a.wdate, a.contents, a.hit
from (select a.seq, a.title, a.writer, b.m_name, a.wdate, a.contents, a.hit
from tb_guestbook a
left outer join tb_member b
on a.writer = b.m_userid
order by a.seq desc) a
where rownum>=6 and rownum<=10;

-- 제대로 된 쿼리문은 다음과 같다(from절에 서브쿼리를 한번 더 쓴다)
select a.rnum, a.seq, a.title, a.m_name, to_char(a.wdate, 'yyyy-mm-dd') wdate, a.contents, a.hit
from (
    select rownum rnum, a.seq, a.title, a.m_name, a.wdate, a.contents, a.hit
    from (select a.seq, a.title, a.writer, b.m_name, a.wdate, a.contents, a.hit
          from tb_guestbook a  
          left outer join tb_member b
          on a.writer = b.m_userid
          order by a.seq desc) a where rownum<=10
)a where rnum>=6;

-- 쿼리에 함수를 사용하면 쿼리 처리 속도가 무지 느려진다
-- 다중 서브쿼리로 되어 있는 위와 같은 실행문(3중)의 경우, 함수를 맨 바깥 루프에서 실행하면
-- 최종적으로 가져오는 데이터 건수에만 함수가 실행되기 때문에 속도가 빨라진다
-- 내부 쿼리 루프에서 함수를 수행하면 전체 데이터 건수에 적용하여 가져오기 때문에 속도가 느려짐
-- 위 쿼리에서는 to_char 동작을 맨 바깥 쿼리에만 걸어줬다

-- 윈도우함수(분석 함수)
select writer, count(*)
from tb_guestbook
group by writer;

-- 아이디, 이름, 전화번호, 이메일, 게시글 갯수
select main.m_userid, main.m_name, main.m_phone, main.m_email, count(*)
from (select b.m_userid, b.m_name, b.m_phone, b.m_email from tb_guestbook a
left outer join tb_member b on a.writer = b.m_userid) main
group by main.m_userid, main.m_name, main.m_phone, main.m_email;

select m_userid, m_name, m_phone, m_email, (select count(*) from tb_guestbook b where a.m_userid=b.writer) cnt
from tb_member a;

select a.m_userid, a.m_name, a.m_email, a.m_phone, nvl(b.cnt, 0) as cnt
from tb_member a
left outer join(
    select writer, count(*) cnt
    from tb_guestbook
    group by writer) b
    on a.m_userid = b.writer;
    
-- 분석함수 over(partition by) 사용
-- 분석함수는 함수에 over() 인자가 있음. 분석하기 쉽게 만들어 놓음
-- 그룹함수는 각 그룹당 하나의 데이터만 출력되는데, 분석함수는 각 행마다 결과를 반환하므로 처리속도가 빠르고 사용이 편리하다
select a.m_userid, a.m_name, a.m_email, a.m_phone, count(*) over(partition by b.writer)
from tb_member a
left outer join tb_guestbook b on a.m_userid=b.writer;

select seq, title, writer, contents, wdate, hit, row_number() over(order by seq desc) as rnum
from tb_guestbook;
-- row_number는 분석함수
-- over() 안에 order by 절을 넣으면 정렬한 뒤 차례로 번호를 부여하는 기능을 함

select * from(
select seq, title, writer, contents, wdate, hit, row_number() over(order by seq desc) as rnum
from tb_guestbook
) where rnum>=6;

-- ceil 함수 : 올림함수, 자신보다 큰 정수를 반환
-- ceil(2.8) : 3
-- ceil(2.1) : 3
-- ceil(2.0) : 3
-- 가장 자주 쓰이는 페이징 쿼리
select a.seq, a.title, a.writer, a.m_name, to_char(a.wdate, 'yyyy-mm-dd') wdate, a.hit, a.pg
from(
select seq, title, writer, contents, wdate, hit, b.m_name,
row_number() over(order by seq desc) as rnum,
ceil(row_number() over(order by seq desc)/5)-1 pg
from tb_guestbook a
left outer join tb_member b
on a.writer = b.m_userid
)a;
--where pg=1;

select a.seq, a.title, a.writer, a.m_name, to_char(a.wdate, 'yyyy-mm-dd') wdate, a.hit, a.pg from(select seq, title, writer, contents, wdate, hit, b.m_name, row_number() over(order by seq desc) as rnum, ceil(row_number() over(order by seq desc)/5)-1 pg from tb_guestbook a left outer join tb_member b on a.writer = b.m_userid) a where pg=0;
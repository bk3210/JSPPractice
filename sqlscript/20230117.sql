select count(*) from myemp;

-- 페이징 쿼리 만들기
-- rownum 필드
desc myemp;

select empno, ename, deptno from myemp;

--rownum 컬럼은 데이터를 테이블로부터 하나씩 가져올 때 순차대로 번호를 붙여 생성됨
-- 아래는 5에 도달하는 순간 멈춘다
select empno, ename, deptno
from myemp
where rownum<=5
order by empno desc;

-- rownum이 order by보다 먼저 적용됨
-- 데이터 다섯개를 추출해서 그 데이터끼리 정렬한다
select * from
(select empno, ename, deptno
from myemp
where rownum<=5) a
order by empno desc;

select * from
(select empno, ename, deptno
from myemp
order by empno desc
)where rownum<=5;

-- rownum에는 >= 부등호 사용 불가
-- 한페이지에 6,7,8,9,10
-- rownum >= 6 : 데이터를 가져오고 나서 번호를 붙이기 때문에 사용 불가
-- 데이터를 못 읽어오면 증가가 되지 않기 때문에 6에 도달하지 못해 아무 데이터도 못 가져온다

-- 최종적으로 rownum을 이용한 페이징 쿼리는 이렇게 된다
select rnum, empno, ename, DEPTNO from(
select rownum rnum, empno, ename, deptno from(
    -- join, 검색 쿼리는 이 안에 추가됨
    select empno, ename, DEPTNO
    from myemp
    order by empno desc
) where rownum<=10
) where rnum>=6;

select rnum, empno, ename, DEPTNO from(
select rownum rnum, a.empno, a.ename, a.deptno from(
    -- join, 검색 쿼리는 이 안에 추가됨
    select a.empno, a.ename, a.DEPTNO, b.dname
    from myemp a
    left outer join dept b on a.DEPTNO=b.DEPTNO
    where a.deptno in (10, 20, 30)  -- 부서 번호가 10이나 20일 경우만 가져오기
    order by a.empno desc
)a where rownum<=10
)a where rnum>=6;


-- 그룹함수: select에 group by에 나온 필드 외에는 사용할 수 없음
-- group by를 하면 각 부서별로 인원수 카운트
-- 각 부서 갯수랑 카운트 갯수가 같음

select deptno, count(*) -- 100, 100
from myemp
group by deptno;

select ename, deptno, count(*)      -- 374, 100, 100 : 출력 건수가 달라서 group by를 할 수 없음-에러 발생
from myemp
group by deptno;

-- 이 문제를 해결하려면 서브쿼리나 join을 사용해야만 한다
select a.ename, a.deptno, b.cnt
from myemp a
left outer join (
    select deptno, count(*) cnt
    from myemp
    group by deptno
)b on a.deptno=b.deptno;

-- 분석함수 사용하기 : 분석함수는 over 구문이 있다
-- 위랑 같은 결과 나옴!(partition by가 group by와 같은 역할을 함)
select ename, deptno, count(*) over(partition by deptno)
from myemp;

-- row_number over(order by-정렬기능, partition by-카테고리별 분류) 둘 다 가능
-- empno를 기준으로 order by한 결과에 row_number 함수가 임의의 일련번호를 생성해줌
select row_number() over(order by empno desc) rnum, empno, ename, deptno
from myemp;

select a.* from (       -- 페이지를 부여하기 위해 서브쿼리로 한번 더 감싸준다
    select row_number() over(order by empno desc) rnum, 
           ceil(row_number() over(order by empno desc)/10)-1 pg, empno, ename, deptno
    from myemp
) a where pg=1; -- 임시 테이블을 만들 때는 항상 이렇게 a처럼 테이블명을 주는 게 좋다


-- proceduere 만들기
-- for문으로 더미 데이터 입력하는 명령문
create or replace procedure makeData
is
begin
    delete from tb_guestbook;
    for i in 1..327 loop
        insert into tb_guestbook(seq, title, writer, contents, wdate, hit)
        values(sq_guest.nextval, '제목'||i, 'test1', '내용'||i, sysdate, 10);
    end loop;
    commit;
end;
/

exec makeData;  -- procedure 실행하기

select count(*) from tb_guestbook;
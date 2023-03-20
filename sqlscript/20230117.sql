select count(*) from myemp;

-- ����¡ ���� �����
-- rownum �ʵ�
desc myemp;

select empno, ename, deptno from myemp;

--rownum �÷��� �����͸� ���̺�κ��� �ϳ��� ������ �� ������� ��ȣ�� �ٿ� ������
-- �Ʒ��� 5�� �����ϴ� ���� �����
select empno, ename, deptno
from myemp
where rownum<=5
order by empno desc;

-- rownum�� order by���� ���� �����
-- ������ �ټ����� �����ؼ� �� �����ͳ��� �����Ѵ�
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

-- rownum���� >= �ε�ȣ ��� �Ұ�
-- ���������� 6,7,8,9,10
-- rownum >= 6 : �����͸� �������� ���� ��ȣ�� ���̱� ������ ��� �Ұ�
-- �����͸� �� �о���� ������ ���� �ʱ� ������ 6�� �������� ���� �ƹ� �����͵� �� �����´�

-- ���������� rownum�� �̿��� ����¡ ������ �̷��� �ȴ�
select rnum, empno, ename, DEPTNO from(
select rownum rnum, empno, ename, deptno from(
    -- join, �˻� ������ �� �ȿ� �߰���
    select empno, ename, DEPTNO
    from myemp
    order by empno desc
) where rownum<=10
) where rnum>=6;

select rnum, empno, ename, DEPTNO from(
select rownum rnum, a.empno, a.ename, a.deptno from(
    -- join, �˻� ������ �� �ȿ� �߰���
    select a.empno, a.ename, a.DEPTNO, b.dname
    from myemp a
    left outer join dept b on a.DEPTNO=b.DEPTNO
    where a.deptno in (10, 20, 30)  -- �μ� ��ȣ�� 10�̳� 20�� ��츸 ��������
    order by a.empno desc
)a where rownum<=10
)a where rnum>=6;


-- �׷��Լ�: select�� group by�� ���� �ʵ� �ܿ��� ����� �� ����
-- group by�� �ϸ� �� �μ����� �ο��� ī��Ʈ
-- �� �μ� ������ ī��Ʈ ������ ����

select deptno, count(*) -- 100, 100
from myemp
group by deptno;

select ename, deptno, count(*)      -- 374, 100, 100 : ��� �Ǽ��� �޶� group by�� �� �� ����-���� �߻�
from myemp
group by deptno;

-- �� ������ �ذ��Ϸ��� ���������� join�� ����ؾ߸� �Ѵ�
select a.ename, a.deptno, b.cnt
from myemp a
left outer join (
    select deptno, count(*) cnt
    from myemp
    group by deptno
)b on a.deptno=b.deptno;

-- �м��Լ� ����ϱ� : �м��Լ��� over ������ �ִ�
-- ���� ���� ��� ����!(partition by�� group by�� ���� ������ ��)
select ename, deptno, count(*) over(partition by deptno)
from myemp;

-- row_number over(order by-���ı��, partition by-ī�װ��� �з�) �� �� ����
-- empno�� �������� order by�� ����� row_number �Լ��� ������ �Ϸù�ȣ�� ��������
select row_number() over(order by empno desc) rnum, empno, ename, deptno
from myemp;

select a.* from (       -- �������� �ο��ϱ� ���� ���������� �ѹ� �� �����ش�
    select row_number() over(order by empno desc) rnum, 
           ceil(row_number() over(order by empno desc)/10)-1 pg, empno, ename, deptno
    from myemp
) a where pg=1; -- �ӽ� ���̺��� ���� ���� �׻� �̷��� aó�� ���̺���� �ִ� �� ����


-- proceduere �����
-- for������ ���� ������ �Է��ϴ� ��ɹ�
create or replace procedure makeData
is
begin
    delete from tb_guestbook;
    for i in 1..327 loop
        insert into tb_guestbook(seq, title, writer, contents, wdate, hit)
        values(sq_guest.nextval, '����'||i, 'test1', '����'||i, sysdate, 10);
    end loop;
    commit;
end;
/

exec makeData;  -- procedure �����ϱ�

select count(*) from tb_guestbook;
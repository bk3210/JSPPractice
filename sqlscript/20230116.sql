-- DB���� �ܷ�Ű �ο�
-- tb_guestbook�� tb_member ���̺��� �����Ϸ��� �� ��
-- ����� �̹� �Էµ� �����Ͱ� foreign key ������ �������� ���ϱ� ������ foreign key ������ ���Ѵ�
alter table tb_guestbook
add constraint FK_member_guestbook
foreign key (writer)
references tb_member(m_id);
-- tb_guestbook ���̺��� writer �ʵ尡 tb_member ���̺��� m_id�� �����ϰ� �Ǵ� ����
-- �� ���๮������ ������ �߻��Ѵ�
-- foreign key�� �����Ϸ��� �� �ʵ��� ������ Ÿ���� ���� ��ġ�ؾ� ��
-- tb_guestbook�� m_userid �ʵ��� ���� tb_member���̺� �� �־�� �Ѵ�

insert into tb_member (m_id, m_userid, m_password, m_name, m_email, m_phone) 
values(sq_member.nextval, 'test3','3333','�׽�Ʈ','test@gmail.com', '010-3333-3333');

update tb_guestbook set writer='test3';
commit;


alter table tb_guestbook
add constraint FK_member_guestbook
foreign key (writer)
references tb_member(m_userid);

insert into tb_member (m_id, m_userid, m_password, m_name, m_email, m_phone) 
values(sq_member.nextval, 'test4','4444','�׽�Ʈ2','test4@gmail.com', '010-4444-4444');

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

-- order by�� rownum �ο� ���� ����Ǳ� ������ ���� ������ �� ���� rownum�� ��
-- rownum�� �̿��� ����¡ ����: rownum�� DB�κ��� �����͸� ������ �� �ӽ÷� ���̴� �̸��̸� order by���� ���� �����
select rownum rnum, a.seq, a.title, a.m_name, a.wdate, a.contents, a.hit
from (select a.seq, a.title, a.writer, b.m_name, a.wdate, a.contents, a.hit
from tb_guestbook a
left outer join tb_member b
on a.writer = b.m_userid
order by a.seq desc) a;
-- �̷� ������ from������ �ɷ���

-- �� �������� 5���� ���� ��������(6~10��° ���� �Ÿ���)
-- rownum �ʵ�� �����͸� �������� ������ ��ȣ�� ������
-- �������� ���� ����üũ���� ���� �ϸ� �����Ͱ� �ϳ��� üũ���� �ʴ´�
-- ->rownum >=6 and rownum<=10�̶�� ���� �����Ͱ� �� �ǵ� �� ������ ����
select rownum rnum, a.seq, a.title, a.m_name, a.wdate, a.contents, a.hit
from (select a.seq, a.title, a.writer, b.m_name, a.wdate, a.contents, a.hit
from tb_guestbook a
left outer join tb_member b
on a.writer = b.m_userid
order by a.seq desc) a
where rownum>=6 and rownum<=10;

-- ����� �� �������� ������ ����(from���� ���������� �ѹ� �� ����)
select a.rnum, a.seq, a.title, a.m_name, to_char(a.wdate, 'yyyy-mm-dd') wdate, a.contents, a.hit
from (
    select rownum rnum, a.seq, a.title, a.m_name, a.wdate, a.contents, a.hit
    from (select a.seq, a.title, a.writer, b.m_name, a.wdate, a.contents, a.hit
          from tb_guestbook a  
          left outer join tb_member b
          on a.writer = b.m_userid
          order by a.seq desc) a where rownum<=10
)a where rnum>=6;

-- ������ �Լ��� ����ϸ� ���� ó�� �ӵ��� ���� ��������
-- ���� ���������� �Ǿ� �ִ� ���� ���� ���๮(3��)�� ���, �Լ��� �� �ٱ� �������� �����ϸ�
-- ���������� �������� ������ �Ǽ����� �Լ��� ����Ǳ� ������ �ӵ��� ��������
-- ���� ���� �������� �Լ��� �����ϸ� ��ü ������ �Ǽ��� �����Ͽ� �������� ������ �ӵ��� ������
-- �� ���������� to_char ������ �� �ٱ� �������� �ɾ����

-- �������Լ�(�м� �Լ�)
select writer, count(*)
from tb_guestbook
group by writer;

-- ���̵�, �̸�, ��ȭ��ȣ, �̸���, �Խñ� ����
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
    
-- �м��Լ� over(partition by) ���
-- �м��Լ��� �Լ��� over() ���ڰ� ����. �м��ϱ� ���� ����� ����
-- �׷��Լ��� �� �׷�� �ϳ��� �����͸� ��µǴµ�, �м��Լ��� �� �ึ�� ����� ��ȯ�ϹǷ� ó���ӵ��� ������ ����� ���ϴ�
select a.m_userid, a.m_name, a.m_email, a.m_phone, count(*) over(partition by b.writer)
from tb_member a
left outer join tb_guestbook b on a.m_userid=b.writer;

select seq, title, writer, contents, wdate, hit, row_number() over(order by seq desc) as rnum
from tb_guestbook;
-- row_number�� �м��Լ�
-- over() �ȿ� order by ���� ������ ������ �� ���ʷ� ��ȣ�� �ο��ϴ� ����� ��

select * from(
select seq, title, writer, contents, wdate, hit, row_number() over(order by seq desc) as rnum
from tb_guestbook
) where rnum>=6;

-- ceil �Լ� : �ø��Լ�, �ڽź��� ū ������ ��ȯ
-- ceil(2.8) : 3
-- ceil(2.1) : 3
-- ceil(2.0) : 3
-- ���� ���� ���̴� ����¡ ����
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
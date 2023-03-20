drop table tb_member;

-- pk ������ �� ���̺�� �ϳ����ۿ� ���� �� ����
-- �� �ʵ庰�� �ߺ��� ���� ���� �ȵǴ� ��� unique ���
create table tb_member(
    m_id number primary key,    -- �ĺ���(�ڵ� ��ȣ ����)
    m_userid varchar2(20 char) unique not null,  -- unique ��������
    m_password varchar2(20 char) not null,
    m_name varchar2(50 char) not null,
    m_email varchar2(50 char) unique not null,
    m_phone varchar2(40 char) not null
);
desc tb_member;


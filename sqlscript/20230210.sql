-- �ʵ� �߰�
alter table board add delyn2 char(1);
update board set delyn='N';
commit;

select * from board;

create table comments(
    board_seq number,       -- board ���̺��� �����ϱ� ���� fk
    seq number primary key,
    userid varchar2(40),
    comments varchar2(1000),
    regdate date,
    hit number default 0,
    delyn char(1) default 'N'
);
alter table comments add constraint foreign key references board(seq);


create table tb_board2(
    seq number primary key,
    writer varchar2(40),
    title varchar2(1000),
    contents clob,
    wdate date,
    hit number default 0
);

insert into tb_board2(seq, writer, title, contents, wdate, hit) values(1, 'test1', '力格1', '郴侩1', sysdate, 3);
insert into tb_board2(seq, writer, title, contents, wdate, hit) values(2, 'test2', '力格2', '郴侩2', sysdate, 3);
insert into tb_board2(seq, writer, title, contents, wdate, hit) values(3, 'test3', '力格3', '郴侩3', sysdate, 3);

alter table tb_board2 add filename varchar2(100);
alter table tb_board2 add image_url varchar2(100);

commit;
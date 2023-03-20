drop table tb_member;

-- pk 조건은 한 테이블당 하나씩밖에 만들 수 없음
-- 각 필드별로 중복된 값이 들어가면 안되는 경우 unique 사용
create table tb_member(
    m_id number primary key,    -- 식별자(자동 번호 붙임)
    m_userid varchar2(20 char) unique not null,  -- unique 제약조건
    m_password varchar2(20 char) not null,
    m_name varchar2(50 char) not null,
    m_email varchar2(50 char) unique not null,
    m_phone varchar2(40 char) not null
);
desc tb_member;


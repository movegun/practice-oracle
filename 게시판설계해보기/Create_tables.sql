drop table INFO;
drop table INFOCOMMENT;
drop table UP;
purge recyclebin;

create table INFO(
INFO_NUM number(4) constraint INFO_PK primary key, --게시글번호
NICK varchar2(30), --작성자
TITLE varchar2(100), --글제목
CONTENT varchar2(1000), --글내용
SAVEDATE date default sysdate, --작성일
READ_NUM number(4) default 0, --조회수
TAG varchar2(20) --태그
);

--create sequence INFO_SEQ;

-- 정보 게시판 댓글 Table
create table INFOCOMMENT(
COMMENT_NUM number(4) constraint INFOCOMMENT_PK  primary key, --댓글고유번호
INFO_NUM number(4) not null, --게시글번호							  포린키 있어야할듯 ??
COMMNET_ORDER_NUM number(4) not null, --댓글번호 (대댓글이 몇번댓글에 달렸는지 확인할 때 사용)
NICK varchar2(30) not null, --작성자
CONTENT varchar2(1000) not null, --댓글내용
SAVEDATE date default sysdate not null, --작성일
STEP number(4) not null --댓글은 0, 대댓글은 0 이상
);

--create sequence INFOCOMMENT;
-- 정보 게시판 추천 Table

create table UP(
UPNUM number, --게시글번호
NICK varchar2(30), --추천인
CONSTRAINT UP_PK primary key (UPNUM,NICK) --중복추전X
);
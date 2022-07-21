drop table TR_MYHOME;
drop table TR_LOGIN;
drop table TR_MEMBER;
drop sequence TR_MYHOME_SEQ;
purge recyclebin;

-- ȸ�� 
create table TR_MEMBER(
    ID varchar2(10) constraint TR_MEMBER_PK primary key, 
    PWD varchar2(10) constraint TR_MEMBER_PWD_NN not null, 
    NAME varchar2(20) constraint TR_MEMBER_NAME_NN not null, 
    EMAIL varchar2(20) constraint TR_MEMBER_UQ unique, 
    RDATE date
);
-- �α��� 
create table TR_LOGIN(
    ID varchar2(10), 
    PWD varchar2(10), 
    constraint TR_LOGIN_PK primary key(ID), 
    constraint TR_LOGIN_FK foreign key(ID) references TR_MEMBER(ID) on delete cascade
);
-- Ȩ������ 
create table TR_MYHOME(
    SEQ number constraint TR_MYHOME_PK primary key, 
    ID varchar2(10) constraint TR_MYHOME_ID_NN not null, 
    HNAME varchar2(20) constraint TR_MYHOME_HNAME_NN not null, 
    TOTCOUNT number default 0, 
    HMSG varchar2(15), 
    CDATE date, 
    constraint TR_MYHOME_FK foreign key(ID) references TR_MEMBER(ID) on delete cascade
);
create sequence TR_MYHOME_SEQ start with 1 increment by 1 nocache;


select TNAME from tab;
select SEQUENCE_NAME from seq;
--select TR_MYHOME_SEQ.nextval from DUAL;

------------------------------------------------------------------------------------------------------------------------------------
--Q1) trigger1:ȸ�������� �ϸ� 
 -- '�α��� ���̺�'�� ID/PWD�Է�,     
create or replace trigger TRI_MtoL
after   insert on TR_MEMBER
	for each row
begin   insert into TR_LOGIN values(:new.ID,:new.PWD);
end;
/
insert into TR_MEMBER values ('movegun007','1234','�̵���','movegun007@naver.com',SYSDATE);


 -- 'Ȩ������ ���̺�'�� �������� ID/HNAME�� �ԷµǴ� Ʈ����
 create or replace trigger TRI_MtoH
after    insert on TR_MEMBER
	 for each row
begin   insert into TR_MYHOME(SEQ,ID,HNAME) values(TR_MYHOME_SEQ.nextval,:new.ID,:new.NAME);
end;
/
insert into TR_MEMBER values ('movegun007','1234','�̵���','movegun007@naver.com',SYSDATE);

-- ���ļ�
DROP TRIGGER TRI_MtoL;
drop trigger TRI_MtoH;
drop trigger TRI_MEMBER;

delete from TR_MEMBER;
delete from TR_LOGIN;
delete from TR_MYHOME;
purge recyclebin;

create or replace trigger TRI_MEMBER
after   insert on TR_MEMBER for each row
begin   insert into TR_LOGIN values(:new.ID,:new.PWD);
	insert into TR_MYHOME(SEQ,ID,HNAME) values(TR_MYHOME_SEQ.nextval,:new.ID,:new.NAME||'�� Ȩ');
end;
/

insert into TR_MEMBER values ('movegun007','1234','�̵���','movegun007@naver.com',SYSDATE);

select * from TR_MEMBER;
select * from TR_LOGIN;
select * from TR_MYHOME;
------------------------------------------------------------------------------------------------------------------------------------
--Q2) trigger2:ȸ�����������.. �α� ���̺��� PWD�� �����Ǵ� Ʈ���� 
drop trigger TRI_CHANGE;
purge recyclebin;

create or replace trigger TRI_CHANGE
after update on TR_MEMBER for each row
begin update TR_LOGIN set PWD=:new.PWD;
end;
/
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
--Q3)ȸ�� ��� ���� ���ν����� ������ (��й�ȣ�� ���� ����)
create or replace procedure CHANGE_PWD( b in TR_MEMBER.PWD%TYPE, a in TR_MEMBER.PWD%TYPE )
is newPWD TR_MEMBER.PWD%TYPE;
begin select PWD into newPWD from TR_MEMBER where PWD=b;
      newPWD := a;
      update TR_MEMBER set PWD=newPWD where PWD=b;
      commit;
end;
/

call CHANGE_PWD('1234','5678');

select * from TR_MEMBER;
select * from TR_LOGIN;
select * from TR_MYHOME;
------------------------------------------------------------------------------------------------------------------------------------
--Q3)ȸ�� ��� ���� ���ν����� ������ (id�� ���ؼ� ��й�ȣ ����)
create or replace procedure CHANGE_PWD( idid in TR_MEMBER.ID%TYPE, a TR_MEMBER.PWD%TYPE )
is newPWD TR_MEMBER.PWD%TYPE;
begin select PWD into newPWD from TR_MEMBER where ID=idid;
      newPWD := a;
      update TR_MEMBER set PWD=newPWD where ID=idid;
      commit;
end;
/

call CHANGE_PWD('movegun007','1234');

select * from TR_MEMBER;
select * from TR_LOGIN;
select * from TR_MYHOME;
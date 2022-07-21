drop table INFO;
drop table INFOCOMMENT;
drop table UP;
purge recyclebin;

create table INFO(
INFO_NUM number(4) constraint INFO_PK primary key, --�Խñ۹�ȣ
NICK varchar2(30), --�ۼ���
TITLE varchar2(100), --������
CONTENT varchar2(1000), --�۳���
SAVEDATE date default sysdate, --�ۼ���
READ_NUM number(4) default 0, --��ȸ��
TAG varchar2(20) --�±�
);

--create sequence INFO_SEQ;

-- ���� �Խ��� ��� Table
create table INFOCOMMENT(
COMMENT_NUM number(4) constraint INFOCOMMENT_PK  primary key, --��۰�����ȣ
INFO_NUM number(4) not null, --�Խñ۹�ȣ							  ����Ű �־���ҵ� ??
COMMNET_ORDER_NUM number(4) not null, --��۹�ȣ (������ �����ۿ� �޷ȴ��� Ȯ���� �� ���)
NICK varchar2(30) not null, --�ۼ���
CONTENT varchar2(1000) not null, --��۳���
SAVEDATE date default sysdate not null, --�ۼ���
STEP number(4) not null --����� 0, ������ 0 �̻�
);

--create sequence INFOCOMMENT;
-- ���� �Խ��� ��õ Table

create table UP(
UPNUM number, --�Խñ۹�ȣ
NICK varchar2(30), --��õ��
CONSTRAINT UP_PK primary key (UPNUM,NICK) --�ߺ�����X
);
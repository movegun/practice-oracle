< ���� (FUNCTION) >

(1) EMP Table���� �̸�, �޿�, Ŀ�̼� �ݾ�, �Ѿ�(sal+comm)�� ���Ͽ� �Ѿ��� 
    ���� ������ ����϶�. ��, Ŀ�̼��� NULL�� ����� �����Ѵ�.

    select ENAME, SAL, COMM, SAL+COMM "�Ѿ�" from EMP where COMM is not null order by 4 desc;

 
(2) 10�� �μ��� ��� ����鿡�� �޿��� 13%�� ���ʽ��� �����ϱ�� �Ͽ���.
    �̸�, �޿�, ���ʽ� �ݾ�, �μ� ��ȣ�� ����϶�.

    select ENAME, SAL, SAL*1.13 "���ʽ�", DEPTNO from EMP where DEPTNO=10;


(3) 30�� �μ��� ������ ����Ͽ� �̸�, �μ���ȣ, �޿�, ������ ����϶�.
    ��, ������ �޿��� 150%�� ���ʽ��� �����Ѵ�.

    select ENAME, DEPTNO, SAL, SAL*12+SAL*1.5 "����" from EMP where DEPTNO=30;

   
(4) �μ� ��ȣ�� 20�� �μ��� �ð��� �ӱ��� ����Ͽ� ����϶�.
    ��, 1���� �ٹ��ϼ��� 12���̰�, 1�� �ٹ��ð��� 5�ð��̴�.
    ��¾���� �̸�, �޿�, �ð��� �ӱ�(�Ҽ����� 1��° �ڸ����� �ݿø�)
    �� ����϶�.

    select ENAME, SAL, round(SAL/12*5) "�ð��� �ӱ�" from EMP where DEPTNO=20;


(5) �޿��� $1,500 ���� $3,000 ������ ����� �޿��� 15%�� ȸ��� �����ϱ�� �Ͽ���.
    �̸� �̸�, �޿�, ȸ��(-2�ڸ����� �ݿø�)�� ����϶�.

    select ENAME, SAL, round(SAL*0.15,-2) "ȸ��" from EMP where SAL>=1500 and SAL<3000;
    select ENAME, SAL, round(SAL*0.15,-2) "ȸ��" from EMP where SAL between 1500 and 3000;

	   
(6) �޿��� $2,000 �̻��� ��� ����� �޿��� 15%�� ������� ����� �Ͽ���. 
    �̸�, �޿�, ������(�Ҽ��� ���� ����)�� ����϶�.

    select ENAME, SAL, trunc(SAL*0.15) "������" from EMP where SAL>=2000;


(7) �Ի��Ϻ��� ���ݱ����� ��¥���� ����϶�.
    �μ� ��ȣ, �̸�, �Ի���, ������, �ٹ��ϼ�(�Ҽ��� ���� ����),
    �ٹ����(�ݿø�),�ٹ�����(30�� ����,�ݿø�), �ٹ��ּ�(�ݿø�)�� ����϶�.

    select DEPTNO, ENAME, HIREDATE, SYSDATE,		--�ݿø��ϰ� ���� / �����ϰ� �ݿø� ��1
    trunc(SYSDATE-HIREDATE) "�ٹ��ϼ�",
    round((SYSDATE-HIREDATE)/365) "�ٹ����",
    round((SYSDATE-HIREDATE)/30) "�ٹ�����",
    round((SYSDATE-HIREDATE)/7) "�ٹ��ּ�" from EMP;



(8) ��� ����� �Ǽ��ɾ��� ����Ͽ� ����϶�.
    ��, �޿��� ���� ������ �̸�, �޿�, �Ǽ��ɾ��� ����϶�
    (�Ǽ��ɾ��� �޿��� ���� 10%�� ������ �� �ݾ�)

    select ENAME, SAL, SAL*0.9 "�Ǽ��ɾ�" from EMP order by 2 desc;


(9) �Ի��Ϸκ��� 90���� ���� ���� ��� �̸�, �Ի���, 90�� ���� ��, �޿��� ����϶�.

    select ENAME, HIREDATE, HIREDATE+90 "90�����ǳ�", SAL from EMP;


(10) �Ի��Ϸκ��� 6������ ���� ���� �Ի���, 6���� ���� ��¥, �޿��� ����϶�.

    select ENAME, HIREDATE, add_months(HIREDATE,6) "6���ڳ�¥", SAL from EMP;


(11) �Ի��� ���� �ٹ��ϼ��� ����Ͽ� �μ���ȣ, �̸�, �Ի���, �ٹ��ϼ��� ����϶�.

    select DEPTNO, ENAME, HIREDATE, (last_day(HIREDATE)-HIREDATE) "�Ի�ޱٹ��ϼ�" from EMP;


(12) ��� ����� 60���� ���� ���� 'MONDAY'�� �� ��, �� ��, �� �� �ΰ��� ���Ͽ�
     �̸�, �Ի���, 'MONDAY'�� ����϶�.

     select ENAME, HIREDATE, next_day(HIREDATE+60,2) "�յ���" from EMP;


(13) �Ի��Ϸκ��� ���ñ����� �ϼ��� ���Ͽ� �̸�, �Ի���, �ٹ��ϼ�(�ݿø�)�� 
     ����϶�.

     select ENAME, HIREDATE, round(SYSDATE-HIREDATE) "�ٹ��ϼ�(�ݿø�)" from EMP;


(14) �Ի����� '1996�� 5�� 14��'�� ���·� �̸�, �Ի����� ����϶�.

	select ENAME, to_char(HIREDATE, 'YYYY-MM-DD' ) "�Ի���" from EMP;


(15) �̸��� ���ڼ��� 6�� �̻��� ����� �̸��� �տ��� 3�ڸ� ���Ͽ� 
     �ҹ��ڷ� �̸����� ����϶�.
sub(ENAME,1,3)

     select lower(substr(ENAME,1,3)) "�ҹ����̸�" from EMP where length(ENAME)>=6;


(16) 10�� �μ� ������ ���, �ְ�, ����, �ο����� ���Ͽ� ����϶�. -- ��� ���� �ݿø���

	select DEPTNO, round(avg(SAL)) "���", max(SAL) "�ְ�", min(SAL) "����", count(*) "�ο���" from EMP 
	group by DEPTNO having DEPTNO=10;

 

(17) �� �μ��� �޿��� ���, �ְ�, ����, �ο����� ���Ͽ� ����϶�.
     (�μ���ȣ�� ���)

     select DEPTNO, round(avg(SAL)) "���", max(SAL) "�ְ�", min(SAL) "����", count(*) "�ο���" from EMP
     group by DEPTNO;


(18) �� �μ��� ���� ������ �ϴ� ����� �ο����� ���Ͽ� �μ���ȣ, ������, �ο����� ����϶�.

	select DEPTNO, JOB, count(*) from EMP
	group by DEPTNO,JOB;


(19) ���� ������ �ϴ� ����� ���� 4�� �̻��� ������ �ο����� ����϶�.


	select JOB, count(*) "�ο���" from EMP
	group by JOB
	having count(*)>=4;
   

(20) �� �μ��� ��� ����, ��ü ����, �ְ� ����, ���� ������ ���Ͽ� ��� ������          -- ��� ���� ������ �ݿø���
     ���� ������ ����϶�. (�μ���ȣ�� ���)

     select DEPTNO, round(avg(SAL)) "���", sum(SAL) "��ü", max(SAL) "�ְ�", min(SAL) "����" from EMP
     group by DEPTNO order by 2 desc;
< ���� (JOIN & SUB-QUERY) >

(1) EMP�� DEPT TABLE�� JOIN�Ͽ� �μ���ȣ, �μ���, �̸�, �޿��� ����϶�.

select e.DEPTNO, d.DNAME, e.ENAME, e.SAL from EMP e join DEPT d on e.DEPTNO=d.DEPTNO;

(2) �̸��� 'ALLEN'�� ����� �μ����� ����϶�.

select ENAME, DNAME from EMP natural join DEPT where ENAME='ALLEN';
  
(3) EMP Table�� �ִ� DATA�� JOIN�Ͽ� ��� ����� �̸�, �μ���ȣ, �μ���, �޿��� ����϶�.

select ENAME, DEPTNO, DNAME, SAL from EMP natural join DEPT;
  
(4) EMP Table�� �ִ� EMPNO�� MGR�� �̿��Ͽ� ������ ���踦 ������ ���� ����϶�.
    --> SMITH�� �Ŵ����� FORD�̴�.

select e1.ENAME||'�� �Ŵ�����', e2.ENAME||'�̴�' from EMP e1 join EMP e2 on e1.MGR=e2.EMPNO;

(5) 'ALLEN'�� ������ ���� ����� �̸�, �μ���, �޿�, ������ ����϶�.

select ENAME, DNAME, SAL, JOB from EMP e, DEPT d where e.DEPTNO=d.DEPTNO and e.JOB=(select JOB from EMP where ENAME='ALLEN');

(6) 'JONES'�� �����ִ� �μ��� ��� ����� �μ���ȣ, �����ȣ, �̸�, �Ի���, 
   �޿��� ����϶�.

select e.DEPTNO, EMPNO, ENAME, HIREDATE, SAL from EMP e join DEPT d on e.DEPTNO=d.DEPTNO and d.DEPTNO=( select DEPTNO from EMP where ENAME='JONES' )

select DEPTNO, EMPNO, ENAME, HIREDATE, SAL from EMP natural join DEPT where DEPTNO=(select DEPTNO from EMP where ENAME='JONES');



(7) ��ü ����� ����ӱݺ��� ���� ����� �����ȣ, �̸�, �μ���, �Ի���, ����, 
    �޿��� ����϶�. 

select EMPNO, ENAME, DNAME, HIREDATE, LOC, SAL from EMP natural join DEPT where SAL>(select avg(SAL) from EMP);

(8) 10�� �μ� ����� �߿� 20�� �μ��� ����� ���� ������ �ϴ� ����� �����ȣ, 
    ����, �̸�, �μ���, �Ի���, ������ ����϶�. 

select EMPNO, JOB, ENAME, DEPTNO, DNAME, HIREDATE, LOC from EMP natural join DEPT where DEPTNO=10 and JOB in (select JOB from EMP where DEPTNO=20);

(9) 10�� �μ��߿��� 30�� �μ����� ���� ������ �ϴ� ����� �����ȣ, ����, 
    �̸�, �μ���, �Ի���, ������ ����϶�.

select EMPNO, JOB, ENAME, DNAME, HIREDATE, LOC from EMP natural join DEPT where DEPTNO=10 and JOB not in (select JOB from EMP where DEPTNO=30);

(10) 10�� �μ��� ���� ���� �ϴ� ����� �����ȣ, ����, �̸�, �μ���ȣ, �μ���, 
   ����, �޿��� �޿��� ���� ������ ����϶�.

select EMPNO, JOB, ENAME, DEPTNO, DNAME, LOC, SAL from EMP natural join DEPT where JOB in(select JOB from EMP where DEPTNO=10) order by 7 desc;
  
(11) 'MARTIN'�̳� 'SCOTT'�� �޿��� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.

select EMPNO, ENAME, SAL from EMP where SAL in(select SAL from EMP where ENAME='MARTIN' or ENAME='SCOTT');
select EMPNO, ENAME, SAL from EMP where SAL = any(select SAL from EMP where ENAME='MARTIN' or ENAME='SCOTT');
  
(12) �޿��� 30�� �μ��� �ְ� �޿����� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.

select EMPNO, ENAME, SAL from EMP natural join DEPT where SAL>(select max(SAL) from EMP where DEPTNO=30);
  
(13) �޿��� 30�� �μ��� ���� �޿����� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.

select EMPNO, ENAME, SAL from EMP natural join DEPT where SAL<(select min(SAL) from EMP where DEPTNO=30);
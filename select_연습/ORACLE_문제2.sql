< 문제 (FUNCTION) >

(1) EMP Table에서 이름, 급여, 커미션 금액, 총액(sal+comm)을 구하여 총액이 
    많은 순서로 출력하라. 단, 커미션이 NULL인 사람은 제외한다.

    select ENAME, SAL, COMM, SAL+COMM "총액" from EMP where COMM is not null order by 4 desc;

 
(2) 10번 부서의 모든 사람들에게 급여의 13%를 보너스로 지불하기로 하였다.
    이름, 급여, 보너스 금액, 부서 번호를 출력하라.

    select ENAME, SAL, SAL*1.13 "보너스", DEPTNO from EMP where DEPTNO=10;


(3) 30번 부서의 연봉을 계산하여 이름, 부서번호, 급여, 연봉을 출력하라.
    단, 연말에 급여의 150%를 보너스로 지급한다.

    select ENAME, DEPTNO, SAL, SAL*12+SAL*1.5 "연봉" from EMP where DEPTNO=30;

   
(4) 부서 번호가 20인 부서의 시간당 임금을 계산하여 출력하라.
    단, 1달의 근무일수는 12일이고, 1일 근무시간은 5시간이다.
    출력양식은 이름, 급여, 시간당 임금(소수이하 1번째 자리에서 반올림)
    을 출력하라.

    select ENAME, SAL, round(SAL/12*5) "시간당 임금" from EMP where DEPTNO=20;


(5) 급여가 $1,500 부터 $3,000 사이의 사람은 급여의 15%를 회비로 지불하기로 하였다.
    이를 이름, 급여, 회비(-2자리에서 반올림)를 출력하라.

    select ENAME, SAL, round(SAL*0.15,-2) "회비" from EMP where SAL>=1500 and SAL<3000;
    select ENAME, SAL, round(SAL*0.15,-2) "회비" from EMP where SAL between 1500 and 3000;

	   
(6) 급여가 $2,000 이상인 모든 사람은 급여의 15%를 경조비로 내기로 하였다. 
    이름, 급여, 경조비(소수점 이하 절삭)를 출력하라.

    select ENAME, SAL, trunc(SAL*0.15) "경조비" from EMP where SAL>=2000;


(7) 입사일부터 지금까지의 날짜수를 출력하라.
    부서 번호, 이름, 입사일, 현재일, 근무일수(소수점 이하 절삭),
    근무년수(반올림),근무월수(30일 기준,반올림), 근무주수(반올림)를 출력하라.

    select DEPTNO, ENAME, HIREDATE, SYSDATE,		--반올림하고 연산 / 연산하고 반올림 택1
    trunc(SYSDATE-HIREDATE) "근무일수",
    round((SYSDATE-HIREDATE)/365) "근무년수",
    round((SYSDATE-HIREDATE)/30) "근무월수",
    round((SYSDATE-HIREDATE)/7) "근무주수" from EMP;



(8) 모든 사원의 실수령액을 계산하여 출력하라.
    단, 급여가 많은 순으로 이름, 급여, 실수령액을 출력하라
    (실수령액은 급여에 대해 10%의 세금을 뺀 금액)

    select ENAME, SAL, SAL*0.9 "실수령액" from EMP order by 2 desc;


(9) 입사일로부터 90일이 지난 후의 사원 이름, 입사일, 90일 후의 날, 급여를 출력하라.

    select ENAME, HIREDATE, HIREDATE+90 "90일후의날", SAL from EMP;


(10) 입사일로부터 6개월이 지난 후의 입사일, 6개월 후의 날짜, 급여를 출력하라.

    select ENAME, HIREDATE, add_months(HIREDATE,6) "6갤뒤날짜", SAL from EMP;


(11) 입사한 달의 근무일수를 계산하여 부서번호, 이름, 입사일, 근무일수를 출력하라.

    select DEPTNO, ENAME, HIREDATE, (last_day(HIREDATE)-HIREDATE) "입사달근무일수" from EMP;


(12) 모든 사원의 60일이 지난 후의 'MONDAY'는 몇 년, 몇 월, 몇 일 인가를 구하여
     이름, 입사일, 'MONDAY'를 출력하라.

     select ENAME, HIREDATE, next_day(HIREDATE+60,2) "먼데이" from EMP;


(13) 입사일로부터 오늘까지의 일수를 구하여 이름, 입사일, 근무일수(반올림)를 
     출력하라.

     select ENAME, HIREDATE, round(SYSDATE-HIREDATE) "근무일수(반올림)" from EMP;


(14) 입사일을 '1996년 5월 14일'의 형태로 이름, 입사일을 출력하라.

	select ENAME, to_char(HIREDATE, 'YYYY-MM-DD' ) "입사일" from EMP;


(15) 이름의 글자수가 6자 이상인 사람의 이름을 앞에서 3자만 구하여 
     소문자로 이름만을 출력하라.
sub(ENAME,1,3)

     select lower(substr(ENAME,1,3)) "소문자이름" from EMP where length(ENAME)>=6;


(16) 10번 부서 월급의 평균, 최고, 최저, 인원수를 구하여 출력하라. -- 평균 내가 반올림함

	select DEPTNO, round(avg(SAL)) "평균", max(SAL) "최고", min(SAL) "최저", count(*) "인원수" from EMP 
	group by DEPTNO having DEPTNO=10;

 

(17) 각 부서별 급여의 평균, 최고, 최저, 인원수를 구하여 출력하라.
     (부서번호도 출력)

     select DEPTNO, round(avg(SAL)) "평균", max(SAL) "최고", min(SAL) "최저", count(*) "인원수" from EMP
     group by DEPTNO;


(18) 각 부서별 같은 업무를 하는 사람의 인원수를 구하여 부서번호, 업무명, 인원수를 출력하라.

	select DEPTNO, JOB, count(*) from EMP
	group by DEPTNO,JOB;


(19) 같은 업무를 하는 사람의 수가 4명 이상인 업무와 인원수를 출력하라.


	select JOB, count(*) "인원수" from EMP
	group by JOB
	having count(*)>=4;
   

(20) 각 부서별 평균 월급, 전체 월급, 최고 월급, 최저 월급을 구하여 평균 월급이          -- 평균 숫자 지저분 반올림함
     많은 순으로 출력하라. (부서번호도 출력)

     select DEPTNO, round(avg(SAL)) "평균", sum(SAL) "전체", max(SAL) "최고", min(SAL) "최저" from EMP
     group by DEPTNO order by 2 desc;
-- pro1.sql

create or replace procedure INCRE(n in EMP.EMPNO%TYPE, r in NUMBER)
is 
    newPay number;
begin
    select SAL into newPay from EMP where EMPNO=n;
    newPay :=  newPay + newPay*r;
    update EMP set SAL=newPay where EMPNO=n;
    commit;
end;
/

--call INCRE(7369, 0.1);
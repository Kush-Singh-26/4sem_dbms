--  Write a PL/SQL program to input hours and rate. Find gross pay and net pay. The tax rate is 28%.

DECLARE
    hours NUMBER(5,2);      
    rate NUMBER(7,2);        
    gross_pay NUMBER(10,2); 
    net_pay NUMBER(10,2);   
    tax_rate CONSTANT NUMBER := 0.28;
BEGIN
    hours := &hours;
    rate := &rate;

    gross_pay := hours * rate;

    net_pay := gross_pay * (1 - tax_rate);

    DBMS_OUTPUT.PUT_LINE('Gross Pay: ' || gross_pay);
    DBMS_OUTPUT.PUT_LINE('Net Pay (after 28% tax): ' || net_pay);
END;
/


/*
SQL> @ f5.sql
Enter value for hours: 10
old   8:     hours := &hours;
new   8:     hours := 10;
Enter value for rate: 40
old   9:     rate := &rate;
new   9:     rate := 40;
Gross Pay: 400
Net Pay (after 28% tax): 288

PL/SQL procedure successfully completed.
*/
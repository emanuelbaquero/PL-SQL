DECLARE
	
	type arrDepartamentos is table of hr.departments.department_name%type index by pls_integer;
	v_arrDepartamentos arrDepartamentos;
	cursor c1 is SELECT * FROM DEPARTMENTS;
	claveArrDepartamentos pls_integer := 1;
	
BEGIN

	for x in c1 loop
		v_arrDepartamentos(claveArrDepartamentos) := x.department_name;
		claveArrDepartamentos := claveArrDepartamentos+1;
	end loop;

	for i in 1..claveArrDepartamentos-1 loop
		dbms_output.put_line(v_arrDepartamentos(i));
	end loop;
END;



SET SERVEROUTPUT ON
DECLARE
	
	type arrEmpleados is table of hr.employees%rowtype index by pls_integer;
	v_empleados arrEmpleados;
	cursor c1 is SELECT * FROM hr.employees;
	claveArrEmpleados pls_integer := 1;
	
BEGIN

	for v_c1 in c1 loop
		--
		v_empleados(claveArrEmpleados).EMPLOYEE_ID := v_c1.EMPLOYEE_ID;
		v_empleados(claveArrEmpleados).FIRST_NAME := v_c1.FIRST_NAME;
		v_empleados(claveArrEmpleados).LAST_NAME := v_c1.LAST_NAME;
		v_empleados(claveArrEmpleados).EMAIL := v_c1.EMAIL;
		v_empleados(claveArrEmpleados).PHONE_NUMBER := v_c1.PHONE_NUMBER;
		v_empleados(claveArrEmpleados).HIRE_DATE := v_c1.HIRE_DATE;
		v_empleados(claveArrEmpleados).JOB_ID := v_c1.JOB_ID;
		v_empleados(claveArrEmpleados).SALARY := v_c1.SALARY;
		v_empleados(claveArrEmpleados).COMMISSION_PCT := v_c1.COMMISSION_PCT;
		v_empleados(claveArrEmpleados).MANAGER_ID := v_c1.MANAGER_ID;
		v_empleados(claveArrEmpleados).DEPARTMENT_ID := v_c1.DEPARTMENT_ID;
		--
		claveArrEmpleados := claveArrEmpleados+1;
	end loop;

	for i in 1..claveArrEmpleados-1 loop
		dbms_output.put_line(v_empleados(i).EMPLOYEE_ID||' | '||
							 v_empleados(i).FIRST_NAME||' | '||
							 v_empleados(i).LAST_NAME||' | '||
							 v_empleados(i).EMAIL||' | '||
							 v_empleados(i).PHONE_NUMBER||' | '||
							 v_empleados(i).HIRE_DATE||' | '||
							 v_empleados(i).JOB_ID||' | '||
							 v_empleados(i).SALARY||' | '||
							 v_empleados(i).COMMISSION_PCT||' | '||
							 v_empleados(i).MANAGER_ID||' | '||
							 v_empleados(i).DEPARTMENT_ID||' | '
							 );
	end loop;
END;

select * from hr.employees




SET SERVEROUTPUT ON
DECLARE
	
	type arrEmpleados is table of hr.employees%rowtype index by pls_integer;
	v_empleados arrEmpleados;
	cursor c1 is SELECT * FROM hr.employees where salary>10000;
	claveArrEmpleados pls_integer := 1;
	
BEGIN

	for v_c1 in c1 loop
		--
        v_empleados(claveArrEmpleados) := v_c1;
        claveArrEmpleados := claveArrEmpleados+1;
		--
	end loop;

	for i in 1..claveArrEmpleados-1 loop
		dbms_output.put_line(i||'--> '||v_empleados(i).EMPLOYEE_ID||' | '||
							 i||'--> '||v_empleados(i).FIRST_NAME||' | '||
							 i||'--> '||v_empleados(i).LAST_NAME||' | '||
							 i||'--> '||v_empleados(i).EMAIL||' | '||
							 i||'--> '||v_empleados(i).PHONE_NUMBER||' | '||
							 i||'--> '||v_empleados(i).HIRE_DATE||' | '||
							 i||'--> '||v_empleados(i).JOB_ID||' | '||
							 i||'--> '||v_empleados(i).SALARY||' | '||
							 i||'--> '||v_empleados(i).COMMISSION_PCT||' | '||
							 i||'--> '||v_empleados(i).MANAGER_ID||' | '||
							 i||'--> '||v_empleados(i).DEPARTMENT_ID||' | '
							 );
	end loop;
END;


SET SERVEROUTPUT ON

DECLARE

	type EMPLEADOS is table of hr.employees%rowtype index by pls_integer;
	v_empleados EMPLEADOS;


BEGIN

		SELECT * BULK COLLECT INTO v_empleados
		  FROM hr.employees
		 WHERE salary > 10000;


	for i in 1..v_empleados.COUNT() loop
		dbms_output.put_line(v_empleados(i).first_name||' '||v_empleados(i).salary);
	end loop;
END;

select first_name, salary from hr.employees where salary >10000
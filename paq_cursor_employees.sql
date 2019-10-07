

create or replace package paq_cursor_employees is
	function obtener(c1 in out sys_refcursor) return number;
end;
/
create or replace package body paq_cursor_employees 
 is 
	function obtener(c1 in out sys_refcursor) return number 
	is 
		salarios number := 0;
		num_empleados integer := 0;
		empleado hr.employees%rowtype;
        media number;
	begin
		loop
			fetch c1 into empleado;
			exit when c1%notfound;
				--
				salarios := salarios + empleado.salary;
				num_empleados := num_empleados + 1;		
				--
		end loop;
		--
		media := (salarios/num_empleados);
		return media;
	end obtener; 
end;
/
DECLARE
	empleados sys_refcursor;
	media number;
begin
	open empleados for select * from hr.employees where department_id = 100;
	media := paq_cursor_employees.obtener(empleados);
	dbms_output.put_line('La media de los empleados para el department_id=100 es -> '||trunc(media));
end;

select salary from hr.employees where department_id = 100
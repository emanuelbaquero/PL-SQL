set serveroutput on
declare
	type DEPT_EMPLE is record
    (
		NOM_DEPARTAMENTO VARCHAR2(50),
		NUM_EMPLEADOS NUMBER
	);   

	type departamento is varray(100) of DEPT_EMPLE;
	departamentos departamento := departamento();
begin
	begin
		select department_name, count(*) bulk collect into departamentos
			from hr.employees join(departments) using (department_id)
		  group by department_name;
	end;

	for i in 1..departamentos.count() loop
		dbms_output.put_line('Departamento: ' || departamentos(i).NOM_DEPARTAMENTO||' tiene '||departamentos(i).NUM_EMPLEADOS|| ' empleados');
    end loop;
end;
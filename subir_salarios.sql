CREATE OR REPLACE FUNCTION SUBIR_SALARIOS(V_DEPARTAMENTO NUMBER, V_PORCENTAJE NUMBER) RETURN NUMBER 
authid current_user IS
	COMANDO VARCHAR2(100);
	NUM_FILAS NUMBER;
BEGIN
	
	COMANDO := 'UPDATE hr.copy_employees set salary = salary - (salary * '||V_PORCENTAJE||' / 100) where department_id = '||V_DEPARTAMENTO;
	EXECUTE IMMEDIATE COMANDO;
    NUM_FILAS := SQL%ROWCOUNT;
    return NUM_FILAS;

EXCEPTION WHEN OTHERS THEN RAISE_APPLICATION_ERROR(-20000,'FALLO DE QUERY DML '||SQLERRM);
END;
/
SELECT * FROM hr.copy_employees
/
set serveroutput on
declare
begin
dbms_output.put_line('Se han actualizado '||SUBIR_SALARIOS(60,50)||' filas');
end;

/
UPDATE hr.copy_employees set salary = salary - (salary * 100 / 100) where department_id = 90;

CREATE OR REPLACE PACKAGE PAQ_SALARIOS IS
	FUNCTION SUMAR_SALARIOS RETURN NUMBER;
	FUNCTION SUMAR_SALARIOS(VAR1 NUMBER) RETURN NUMBER;
	FUNCTION SUMAR_SALARIOS(VAR1 VARCHAR2) RETURN NUMBER;
	FUNCTION SUMAR_SALARIOS(VAR1 NUMBER, VAR2 NUMBER) RETURN NUMBER;
END PAQ_SALARIOS;
/
CREATE OR REPLACE PACKAGE BODY PAQ_SALARIOS IS 
	
		--------------------------------------------------

	FUNCTION SUMAR_SALARIOS RETURN NUMBER IS 
		VAR_CURSOR sys_refcursor;
		VAR_SUMA_SALARIOS NUMBER;
		BEGIN
			OPEN VAR_CURSOR FOR SELECT SUM(SALARY) FROM HR.EMPLOYEES;
			FETCH VAR_CURSOR INTO VAR_SUMA_SALARIOS;
			RETURN VAR_SUMA_SALARIOS;
		END;
	
			--------------------------------------------------

	FUNCTION SUMAR_SALARIOS(VAR1 NUMBER) RETURN NUMBER IS 
		VAR_CURSOR sys_refcursor;
		VAR_SUMA_SALARIOS NUMBER;
		BEGIN
			OPEN VAR_CURSOR FOR SELECT SUM(SALARY) 
								  FROM HR.EMPLOYEES 
								 WHERE DEPARTMENT_ID = VAR1;
			FETCH VAR_CURSOR INTO VAR_SUMA_SALARIOS;
			RETURN VAR_SUMA_SALARIOS;
		END;

			--------------------------------------------------

	FUNCTION SUMAR_SALARIOS(VAR1 VARCHAR2) RETURN NUMBER IS 
		VAR_CURSOR sys_refcursor;
		VAR_SUMA_SALARIOS NUMBER;
		BEGIN
			OPEN VAR_CURSOR FOR SELECT SUM(SALARY)
								  FROM HR.EMPLOYEES 
							 	 WHERE job_id = VAR1;
			FETCH VAR_CURSOR INTO VAR_SUMA_SALARIOS;
			RETURN VAR_SUMA_SALARIOS;
		END;
	
			--------------------------------------------------

	FUNCTION SUMAR_SALARIOS(VAR1 NUMBER, VAR2 NUMBER) RETURN NUMBER IS 
		VAR_CURSOR sys_refcursor;
		VAR_SUMA_SALARIOS NUMBER;
		BEGIN
			OPEN VAR_CURSOR FOR SELECT SUM(SALARY) 
								  FROM HR.EMPLOYEES 
							 	 WHERE department_id = VAR1 and salary > VAR2;
			FETCH VAR_CURSOR INTO VAR_SUMA_SALARIOS;
			RETURN VAR_SUMA_SALARIOS;
		END;

		--------------------------------------------------
END PAQ_SALARIOS;
/
DECLARE 	
	--
PROCEDURE CREAR_TABLA_AUX IS 
		TABLA_AUX VARCHAR2(200);
	BEGIN
		TABLA_AUX := 	'create table recolectorDos_aux as (select a.id id, a.apellido apellido, a.direccion direccion, b.fecha fecha
                             from recolectorDos a 
                            inner join (recolectorUno b) 
                               on (a.id = b.id));';
		EXECUTE IMMEDIATE TABLA_AUX;
	END;
	--
PROCEDURE MERGE_TABLA IS 

	BEGIN
		MERGE INTO recolectorDos REC
			USING recolectorDos_aux AUX
			   ON(REC.ID = AUX.ID)
		WHEN MATCHED THEN 
			UPDATE SET REC.FECHA = AUX.FECHA
		WHEN NOT MATCHED THE  
			INSERT (REC.ID, REC.FECHA) VALUES (AUX.ID,NULL);
	END;
	--
PROCEDURE LIMPIAR_TABLAS_AUX IS 
		COMANDO_DROP_AUX VARCHAR2(200);
	BEGIN
		COMANDO_DROP_AUX := 'DROP TABLE recolectorDos_aux;';
		EXECUTE IMMEDIATE COMANDO_DROP_AUX;
	END;

BEGIN	
	CREAR_TABLA_AUX;
	MERGE_TABLA;
	LIMPIAR_TABLAS_AUX;
END;
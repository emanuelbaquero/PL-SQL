create or replace package package_sobrecarga as
		function concatenar(var1 varchar2, var2 varchar2) return varchar2;
		function concatenar(var1 number, var2 number) return number;
		function concatenar(var1 date, var2 number) return date;
end package_sobrecarga;
/
desc package_sobrecarga
/
create or replace package body package_sobrecarga as
	function concatenar(var1 varchar2, var2 varchar2) return varchar2 
	is 
	begin
		return var1||' '||var2;
	end;
	function concatenar(var1 number, var2 number) return number 
	is 
	begin
		return var1 + var2;
	end;
	function concatenar(var1 date, var2 number) return date 
	is 
	begin
		return var1+var2;
	end;		
end package_sobrecarga;
/
set serveroutput on
execute dbms_output.put_line(package_sobrecarga.concatenar('Jose','Argento'));
/
set serveroutput on
execute dbms_output.put_line(package_sobrecarga.concatenar(10,30));
/
set serveroutput on
execute dbms_output.put_line(package_sobrecarga.concatenar(sysdate,10));
/

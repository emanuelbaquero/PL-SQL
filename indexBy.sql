set serveroutput on
declare
    type empleado is table of hr.employees%rowtype index by pls_integer;
    v_empleado empleado;
    
    type departamento is table of hr.departments.department_name%type index by varchar2(2);
    v_departamento departamento;
    
begin
    
    v_empleado(0).first_name := 'Ruben';
    v_empleado(0).last_name := 'Prada';
    v_departamento('A1') := 'Flores Dto';
   
    dbms_output.put_line('Empleado: '||v_empleado(0).first_name||' '||v_empleado(0).last_name);
    dbms_output.put_line('Departamento: '||v_departamento('A1'));
end;
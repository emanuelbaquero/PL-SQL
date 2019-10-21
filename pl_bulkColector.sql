create table recolectorUno (
id      number,
nombre  varchar2(50),
mail    varchar2(50),
fecha   date
)
/
create table recolectorDos (
id      number,
apellido  varchar2(50),
direccion    varchar2(50),
fecha   date
)
/
select * from recolectorUno
/
update recolectorUno set id = 7 where nombre ='pepe'
/
insert into recolectorUno(id, nombre,mail,fecha)
    values(10,'manolo','manolo@gmail.com',to_date('01/12/19','DD/MM/YY'));
/
select * from recolectorDos
/
update recolectorDos set id = 7 where apellido = 'esteche'
/
insert into recolectorDos(id, apellido,direccion)
    values(10,'santamaria','leto 242');
/
COMMIT
/
select * from recolectorUno
/
select * from recolectorDos
/ 
update recolectorDos set id = 19 where apellido = 'navarro'
/
set serveroutput on
DECLARE
	TYPE LISTA_PERSONAS IS TABLE OF recolectorUno%rowtype;
    personas LISTA_PERSONAS;
    cursor c1 is select * from recolectorDos;
    pr1 c1%rowtype;
BEGIN
	BEGIN
		SELECT * BULK COLLECT INTO personas FROM recolectorUno;
	EXCEPTION WHEN OTHERS THEN personas := NULL;
	END;
    open c1;
    loop
        fetch c1 into pr1;
        exit when c1%notfound;
        --
            forall i in personas.first .. personas.last
            update recolectorDos 
               set fecha= personas(i).fecha 
             where id = personas(i).id;
        --
    end loop;
    close c1;
END;
/
select * from recolectorUno where id = 388
/
select * from recolectorDos
/
insert into recolectorDos (id,apellido,direccion,fecha)
values(388,'Heikle','pedernera 123',null);
/
BEGIN
    for i in 121..10000 loop
        insert into recolectorUno(id,nombre,mail,fecha)
        values(i, 'nombre:'||i, 'mail:'||i, sysdate+i);
    end loop;
END;
/
DECLARE
BEGIN
    IF MOD()
END;
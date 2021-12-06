show databases;
use negocioweb;
show tables;
select * from articulos;


drop table if exists tabla_Control;
create table tabla_Control(
id int auto_increment primary key,
    tabla varchar(30) not null,
    accion enum('insert','update','delete') not null,
    fecha date not null,
    hora time not null,
    usuario varchar(20),
    terminal varchar(100),
    idRegistro int not null
);
drop trigger if exists TR_Articulos_Insert;
delimiter //
create trigger TR_Articulos_Insert
	after insert
    on articulos for each row
    begin
		insert into tabla_Control (tabla,accion,fecha,hora,usuario,terminal,idRegistro) 
        values 
        ('articulos','insert',current_date(),current_time(),current_user(), 
			(select user()),new.id);
    end;
// delimiter ;

drop trigger if exists TR_Articulos_Update;
delimiter //
create trigger TR_Articulos_Update
	after update
    on articulos for each row
    begin
		insert into tabla_Control (tabla,accion,fecha,hora,usuario,terminal,idRegistro) 
        values 
        ('articulos','update',current_date(),current_time(),current_user(), 
			(select user()),new.id);
    end;
// delimiter ;

drop table if exists TR_Articulos_Delete;
delimiter //
create trigger TR_Articulos_Delete
	after delete
    on articulos for each row
    begin
		insert into tabla_Control (tabla,accion,fecha,hora,usuario,terminal,idRegistro) 
        values 
        ('articulos','delete',current_date(),current_time(),current_user(), 
			(select user()),old.id);
    end;
// delimiter ;
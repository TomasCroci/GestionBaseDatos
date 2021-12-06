drop database if exists negocioweb;
create database negocioweb;
use negocioweb;
show tables;

select * from articulos;

drop procedure if exists SP_Articulos_Insert;
delimiter //
create procedure SP_Articulos_Insert(in 
		p_nombre varchar(20), 
        p_descripcion varchar(50),
		p_tipo enum('PRENDA','JUGUETE','ALIMENTO','SNACK','ACCESORIO','CORREAS','MEDICAMENTO'),
		p_especieRecomendada enum('CANINO','FELINO','AVE','PEZ','ROEDOR'),
        p_costo double,
        p_precio double,
        p_stock int,
        p_stockMinimo int,
        p_stockMaximo int,
        p_comentarios varchar(50),
        p_activo boolean
)
begin
		insert into articulos (nombre,descripcion,tipo,especieRecomendada,costo,precio,stock,stockMinimo,stockMaximo,comentarios,activo) 
		 	values (p_nombre,p_descripcion,p_tipo,p_especieRecomendada,p_costo,p_precio,p_stock,p_stockMinimo,p_stockMaximo,p_comentarios,p_activo);
    end;
// delimiter ;

call SP_Articulos_Insert("Pedigree","Carne",'ALIMENTO','CANINO',900,1400,7,2,20,null,true);


drop procedure if exists SP_Articulos_Update;
delimiter //
create procedure SP_Articulos_Update(in 
		P_id int,
		p_nombre varchar(20), 
        p_descripcion varchar(50),
		p_tipo enum('PRENDA','JUGUETE','ALIMENTO','SNACK','ACCESORIO','CORREAS','MEDICAMENTO'),
		p_especieRecomendada enum('CANINO','FELINO','AVE','PEZ','ROEDOR'),
        p_costo double,
        p_precio double,
        p_stock int,
        p_stockMinimo int,
        p_stockMaximo int,
        p_comentarios varchar(50),
        p_activo boolean
        )
	begin
		update articulos set nombre=p_nombre, descripcion=p_descripcion, tipo=p_tipo, especieRecomendada=p_especieRecomendada, 
			costo=p_costo, precio=p_precio, stock=p_stock, stockMinimo=p_stockMinimo,stockMaximo=p_stockMaximo, comentarios=p_comentarios,activo=p_activo
            where id=P_id;
		end;
// delimiter ;

drop procedure if exists SP_Articulos_Delete;
delimiter //
create procedure SP_Articulos_Delete(in P_id int)
	begin
		delete from articulos where id=P_id;
    end;
// delimiter ;
select * from articulos;
call SP_Articulos_Delete(3);
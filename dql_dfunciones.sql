use Chinook;


-- TotalDeVentasCliente(ClienteID): Calcula el total de ventas de un cliente en un año específico.
drop function if exists TotalDeVentasCliente;
delimiter //
create function TotalDeVentasCliente(cliente_id int, año int)
returns decimal(10, 2)
deterministic
begin
    declare total_ventas decimal(10, 2);
    select sum(i.total)
    into total_ventas
    from Invoice i
    where i.customerid = cliente_id
      and year(i.InvoiceDate) = año;
    return ifnull(total_ventas, 0);
end //
delimiter ;
select TotalDeVentasCliente(3,2024);

-- PrecioPromedioPorCompra(CompraID): Retorna el precio promedio de canciones en una compra.
drop function if exists PrecioPromedioPorCompra;
delimiter //
create function PrecioPromedioPorCompra(compra_id int)
returns decimal(10, 2)
deterministic
begin
    declare precio_promedio decimal(10, 2);
    select avg(il.unitprice)
    into precio_promedio
    from Invoiceline il
    where il.Invoiceid = compra_id;
    return ifnull(precio_promedio, 0);
end //
delimiter ;
select PrecioPromedioPorCompra(3);

-- DuracionTotalAlbum(AlbumID): Retorna la duración total de canciones en un álbum.
drop function if exists DuracionTotalAlbum;
delimiter //
create function DuracionTotalAlbum(album_id int)
returns int
deterministic
begin
    declare duracion_total int;
    select sum(t.milliseconds) / 1000
    into duracion_total
    from track t
    where t.albumid = album_id;
    return ifnull(duracion_total, 0);
end //
delimiter ;
select DuracionTotalAlbum(3);

-- CalcularDescuentoCliente(ClienteID): Calcula el descuento a aplicar según el historial de compras.

-- EsVIP(ClienteID): Verifica si un cliente es "VIP" con base en su frecuencia de compra.
drop function if exists EsVIP;
delimiter //
create function EsVIP(cliente_id int)
returns boolean
deterministic
begin
    declare compras_anuales varchar(255);
    select count(*)
    into compras_anuales
    from Invoice i
    where i.customerid = cliente_id
      and i.InvoiceDate >= date_sub(curdate(), interval 1 year);
	if compras_anuales < 12 then
    set compras_anuales = 'no';
        return compras_anuales;
    else
    set compras_anuales = 'si';
        return compras_anuales;
    end if;    
end //
delimiter ;
select EsVIP(3);
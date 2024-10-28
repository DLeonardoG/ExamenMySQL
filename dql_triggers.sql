use Chinook;

show triggers;

-- ActualizarStockEnVenta: Al realizar una venta, actualiza la cantIdad de canciones en stock.
drop trigger if exists ActualizarStockEnVenta;
delimiter //
create trigger ActualizarStockEnVenta
after insert on InvoiceLine
for each row
begin
    update Track
    set Track.bytes = Track.bytes - new.quantity
    where Track.TrackId = new.TrackId;
end //
delimiter ;

-- AuditarCambioCliente: Cada vez que se modifica un cliente, registra el cambio en una tabla de auditoría.

-- RegistrarCambioPrecio: Guarda el historial de cambios de precio en las canciones.
create table if not exists historial_precio (
    historial_Id int auto_increment primary key,
    Track_Id int,
    precio_anterior decimal(10, 2),
    nuevo_precio decimal(10, 2),
    fecha_cambio datetime default current_timestamp
);

drop trigger if exists RegistrarCambioPrecio;
delimiter //
create trigger RegistrarCambioPrecio
before update on Track
for each row
begin
    if old.UnitPrice != new.UnitPrice then
        insert into historial_precio (Track_Id, precio_anterior, nuevo_precio)
        values (old.TrackId, old.UnitPrice, new.UnitPrice);
    end if;
end //
delimiter ;


-- NotificarEliminacionVenta: Notifica cuando se elimina un registro de venta.
drop trigger if exists NotificarEliminacionVenta;
delimiter //
create trigger NotificarEliminacionVenta
before delete on Invoice
for each row
begin
    insert into auditoria_cliente (cliente_Id, campo_modificado, valor_anterior, nuevo_valor, fecha_modificacion)
    values (old.CustomerId, 'Venta eliminada', old.InvoiceId, null, current_timestamp);
end //
delimiter ;


-- BloquearCompraConDeuda: Evita la compra de un cliente si tiene deuda pendiente.
drop trigger if exists BloquearCompraConDeuda;
delimiter //
create trigger BloquearCompraConDeuda
before insert on Invoice
for each row
begin
    declare deuda_pendiente decimal(10, 2);
    select sum(total) - sum(pagado)
    into deuda_pendiente
    from Invoice
    where CustomerId = new.CustomerId;
    if deuda_pendiente > 0 then
        signal sqlstate '45000' set message_text = 'el cliente tiene que pagar primero lo siento papichulo';
    end if;
end //
delimiter ;


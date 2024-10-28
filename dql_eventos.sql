use Chinook;

show events;

-- InformeSemanalVentas: Genera un informe de ventas semanal automáticamente.
drop event if exists InformeSemanalVentas;
delimiter //
create event InformeSemanalVentas
on schedule every 1 week
starts current_timestamp
do
begin
    insert into informe_ventas (fecha, total_ventas)
    select current_date, sum(total)
    from Invoice
    where InvoiceDate >= date_sub(current_date, interval 1 week);
end //
delimiter ;

-- ActualizarEstadosCuentaMensual: Actualiza el estado de cuenta de los clientes mensualmente.
drop event if exists ActualizarEstadosCuentaMensual;
delimiter //
create event ActualizarEstadosCuentaMensual
on schedule every 1 month
starts current_timestamp
do
begin
    update customer
    set estado_cuenta = case
        when (select sum(total - pagado) from invoice where customer.customerid = invoice.customerid) > 0 then 'pendiente'
        else 'al dia'
    end;
end //
delimiter ;

-- AlertaAlbumNoVendidoAnual: Envía una alerta cuando un álbum no se ha vendido en el último año.

-- LimpiarRegistrosAntiguosAuditoria: Borra los registros antiguos de auditoría cada trimestre.
drop event if exists LimpiarRegistrosAntiguosAuditoria;
delimiter //
create event LimpiarRegistrosAntiguosAuditoria
on schedule every 3 month
starts current_timestamp
do
begin
    delete from auditoria_cliente
    where fecha_modificacion < date_sub(current_date, interval 1 year);
end //
delimiter ;

-- ActualizarGenerosMasVendidosMensual: Actualiza la lista de géneros más vendidos cada mes.
drop event if exists ActualizarGenerosMasVendidosMensual;
delimiter //
create event ActualizarGenerosMasVendidosMensual
on schedule every 1 month
starts current_timestamp
do
begin
    delete from generos_mas_vendidos;
    insert into generos_mas_vendidos (genreid, ventas)
    select genreid, count(*)
    from track
    join invoiceline on track.trackid = invoiceline.trackid
    where invoice_date >= date_sub(current_date, interval 1 month)
    group by genreid
    order by ventas desc
    limit 5;
end //
delimiter ;

show events;

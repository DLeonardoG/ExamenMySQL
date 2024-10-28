use Chinook;

-- Obtén el álbum más vendIdo en cada país en el último año
select c.Country, a.Title as Album,
    count(il.InvoiceLineId) as ventas
from Invoice i
join InvoiceLine il on i.InvoiceId = il.InvoiceId
join Track t on il.TrackId = t.TrackId
join Album a on t.AlbumId = a.AlbumId
join Customer c on i.CustomerId = c.CustomerId
where i.InvoiceDate >= date_sub(curdate(), interval 1 year)
group by c.Country, a.AlbumId
order by c.Country, ventas desc;

-- Lista los clientes que han gastado más de $40 en total en la tienda
select c.firstname, c.lastname,
    sum(i.total) as total
from Customer c
join Invoice i on c.CustomerId = i.CustomerId
group by c.CustomerId
having total > 40;

-- Encuentra los cinco géneros más vendIdos
select g.name as Genre, count(il.InvoiceLineId) as ventas
from InvoiceLine il
join Track t on il.TrackId = t.TrackId
join Genre g on t.GenreId = g.GenreId
group by g.GenreId
order by ventas
 desc
limit 5;

-- Calcula el número de canciones compradas por cada cliente
select c.firstname, c.lastname,
    count(il.InvoiceLineId) as songs
from Customer c
join Invoice i on c.CustomerId = i.CustomerId
join InvoiceLine il on i.InvoiceId = il.InvoiceId
group by c.CustomerId;

-- Lista los clientes que no han realizado compras en los últimos 6 meses
select c.firstname, c.lastname
from Customer c 
left join Invoice i on c.CustomerId = i.CustomerId and i.InvoiceDate >= date_sub(curdate(), interval 6 month)
where i.InvoiceId is null;

-- Consulta el número total  de ventas por cada Artista
select ar.name as artista,
    count(il.InvoiceLineId) as ventas
from InvoiceLine il
join Track t on il.TrackId = t.TrackId
join Album a on t.AlbumId = a.AlbumId
join Artist ar on a.ArtistId = ar.ArtistId
group by ar.ArtistId;

-- Calcula el total de ventas de cada empleado en el último mes
select e.firstname, e.lastname,
    sum(i.total) as ventas
from Employee e
join Customer c on e.EmployeeId = c.supportrepId
join Invoice i on c.CustomerId = i.CustomerId
where i.InvoiceDate >= date_sub(curdate(), interval 1 month)
group by e.EmployeeId;

-- Encuentra los clientes más frecuentes de cada país
select c.Country, c.firstname, c.lastname,
    count(i.InvoiceId) as total_purchases
from Customer c
join Invoice i on c.CustomerId = i.CustomerId
group by c.Country, c.CustomerId
order by c.Country, total_purchases desc;

-- Lista las ventas diarias de canciones en un mes específico
select date(i.InvoiceDate) as sale_date,
    count(il.InvoiceLineId) as total_songs_sold
from Invoice i
join InvoiceLine il on i.InvoiceId = il.InvoiceId
where month(i.InvoiceDate) = 5 
    and year(i.InvoiceDate) = year(curdate())
group by sale_date;

-- Genera un informe de los cinco clientes más recientes
select c.firstname, c.lastname,
    max(i.InvoiceDate) as fecha
from Customer c
join Invoice i on c.CustomerId = i.CustomerId
group by c.CustomerId
order by fecha desc
limit 5;

-- Calcula el precio promedio de venta de canciones
select avg(il.unitprice) as prome
from InvoiceLine il;

-- Lista las canciones más caras y más baratas vendIdas
select t.name as song, il.unitprice
from InvoiceLine il
join Track t on il.TrackId = t.TrackId
order by il.unitprice desc
limit 1;
-- -----------------------
select t.name as song, il.unitprice 
from InvoiceLine il
join Track t on il.TrackId = t.TrackId
order by il.unitprice asc
limit 1;

-- Muestra los cinco clientes que compraron más canciones de Rock
select c.firstname, c.lastname, count(il.InvoiceLineId) as number_
from Customer c
join Invoice i on c.CustomerId = i.CustomerId
join InvoiceLine il on i.InvoiceId = il.InvoiceId
join Track t on il.TrackId = t.TrackId
join Genre g on t.GenreId = g.GenreId
where g.name = 'Rock'
group by c.CustomerId
order by number_ desc
limit 5;

-- Encuentra la duración total de canciones en cada álbum
select a.Title as Album, 
    sum(t.milliseconds) / 1000 as total_duration_seconds
from Album a
join Track t on a.AlbumId = t.AlbumId
group  by a.AlbumId;

-- Lista los empleados que generaron más ventas en el último año
select e.firstname, e.lastname,
    sum(i.total) as ventas
from Employee e
join Customer c on e.EmployeeId = c.supportrepId
join Invoice i on c.CustomerId = i.CustomerId
where i.InvoiceDate >= date_sub(curdate(), interval 1 year)
group by e.EmployeeId
order by ventas desc
limit 5;

-- Calcula el descuento promedio aplicado a los clientes VIP

-- Encuentra el cliente con más canciones compradas
select c.firstname, c.lastname, count(il.InvoiceLineId) as canciones
from Customer c
join Invoice i on c.CustomerId = i.CustomerId
join InvoiceLine il on i.InvoiceId = il.InvoiceId
group by c.CustomerId
order by canciones desc
limit 1;

-- Lista los álbumes con  más canciones vendidas en el último trimestre

-- Muestra las ventas semanales de canciones en el último año

-- Lista los géneros que no han sido vendidos en el último año

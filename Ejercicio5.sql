--Selecciona las columnas film_id y title de la tabla film.
select film_id, title from  film;
--Selecciona 5 filas de la tabla film, obteniendo todas las columnas.
select * from film limit 5;
--Selecciona filas de la tabla film donde film_id sea menor que 4.
select * from film where film_id >4;
--Selecciona filas de la tabla film donde el rating sea PG o G.
select * from  film where rating in ('PG','G');
--Selecciona filas de la tabla actor donde el nombre sea Angela, Angelina o Audrey usando IN.
select * from  actor where first_name in ('ANGELA','ANGELINA','AUDREY');
--Obtén una lista de actores con el nombre Julia.
select * from  actor where first_name ='JULIA';
--Obtén una lista de actores con los nombres Chris, Cameron o Cuba.
select * from  actor where first_name in ('CHRIS','CAMERON','CUBA');
--Selecciona la fila de la tabla customer para el cliente con el nombre Jamie Rice.
select * from  customer where CONCAT(first_name,' ',last_name) = 'JAMIE RICE';
--Selecciona el monto y la fecha de pago de la tabla payment donde el monto pagado sea menor a $1.
select amount , payment_date from payment where amount >1;
--¿Cuáles son las diferentes duraciones de alquiler permitidas por la tienda?
select distinct (rental_duration)   from film;  
--Ordena las filas en la tabla city por country_id y luego por city.
select * from city order by country_id asc, city  asc;
--¿Cuáles son los ID de los últimos 3 clientes que devolvieron un alquiler?
select * from  customer where customer_id in (select customer_id from rental where return_date is not null  order by return_date desc limit 3 );
--¿Cuántas películas tienen clasificación NC-17? ¿Cuántas tienen clasificación PG o PG-13?
select rating, count(*)  from  film where rating in ('NC-17','PG','PG-13')  group by rating;
--¿Cuántos clientes diferentes tienen registros en la tabla rental?
select count(distinct(customer_id)) from rental;
--¿Hay algún cliente con el mismo apellido?
select  last_name, count(*)  from customer group by last_name having count(*)>1;
--¿Qué película (id) tiene la mayor cantidad de actores?
select film_id,count(*) as count1  from film_actor group by film_id order by count1 desc limit 1;
--¿Qué actor (id) aparece en la mayor cantidad de películas?
select actor_id,count(*) as count2  from film_actor group by actor_id order by count2 desc limit 1;
--Cuenta el número de ciudades para cada country_id en la tabla city. Ordena los resultados por count(*).
select country_id, count(*) as cities  from city  group by country_id  order by cities desc;
--¿Cuál es la tarifa de alquiler promedio de las películas? ¿Puedes redondear el resultado a 2 decimales?
select ROUND(AVG(rental_rate),2) from  film;
--Selecciona los 10 actores que tienen los nombres más largos (nombre y apellido combinados).
select concat(first_name,' ',last_name) as full_name, length(concat(first_name,last_name)) as longitud  from actor order by longitud desc limit 10;
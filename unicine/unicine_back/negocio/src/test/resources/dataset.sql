insert into ciudad values (1, "armenia");
insert into ciudad values (2, "pereira");
insert into ciudad values (3, "manizales");
insert into ciudad values (4, "cali");
insert into ciudad values (5, "bogota");

insert into cliente values ("12345", "123", "correo@gmail.com", 1, "Cliente", "jessica ospina", 1, "ruta/img", 1, 1);
insert into cliente values ("12346", "123", "correo2@gmail.com", 1, "Cliente", "johana echeverry", 1, "ruta/img", 1, 1);
insert into cliente values ("12347", "123", "correo3@gmail.com", 1, "Cliente", "juan jose ortiz", 1, "ruta/img", 1, 1);
insert into cliente values ("12348", "123", "correo4@gmail.com", 1, "Cliente", "david rodriguez", 1, "ruta/img", 1, 1);
insert into cliente values ("12349", "123", "correo5@gmail.com", 1, "Cliente", "alison lopez", 1, "ruta/img", 1, 1);
insert into cliente values ("12353", "123", "correo6@gmail.com", 1, "Cliente", "jose daniel", 1, "ruta/img", 1, 1);

insert into cliente_telefonos values ("12345", "3137705899", "personal");
insert into cliente_telefonos values ("12345", "3137705800", "trabajo");
insert into cliente_telefonos values ("12346", "3108896632", "personal");
insert into cliente_telefonos values ("12347", "3128676692", "personal");
insert into cliente_telefonos values ("12348", "3117895588", "personal");
insert into cliente_telefonos values ("12349", "3789988564", "personal");
insert into cliente_telefonos values ("12353", "3889745523", "trabajo");

insert into administrador values ("12350", "123", "admin1@gmail.com", 2, "Administrador", "administrador 1", 1);
insert into administrador values ("12351", "123", "admin2@gmail.com", 2, "Administrador", "administrador 2", 1);
insert into administrador values ("12352", "123", "admin3@gmail.com", 2, "Administrador", "administrador 3", 1);
insert into administrador values ("12354", "123", "admin4@gmail.com", 2, "Administrador", "administrador 4", 1);
insert into administrador values ("12355", "123", "admin5@gmail.com", 2, "Administrador", "administrador 5", 1);

insert into administrador values ("12356", "123", "admin6@gmail.com", 3, "Administrador_Teatro", "administrador 6", 1);

insert into confiteria values (1, "ruta/img", "confiteria 1", 13000.0);
insert into confiteria values (2, "ruta/img2", "confiteria 2", 14000.0);
insert into confiteria values (3, "ruta/img3", "confiteria 3", 15000.0);
insert into confiteria values (4, "ruta/img4", "confiteria 4", 16000.0);
insert into confiteria values (5, "ruta/img5", "confiteria 5", 17000.0);


insert into PQRS values (1, "Mensaje prueba pqrs aaa", "12345");
insert into PQRS values (2, "Mensaje prueba pqrs bbb", "12346");
insert into PQRS values (3, "Mensaje prueba pqrs ccc", "12347");
insert into PQRS values (4, "Mensaje prueba pqrs ccc", "12348");
insert into PQRS values (5, "Mensaje prueba pqrs ccc", "12349");

insert into estado_pelicula values (1, 1);
insert into estado_pelicula values (2, 0);

insert into pelicula values (1, "thriller", "ruta/img", "pelicula prueba", "jhon doe - jana doe", "sinopsis prueba", "ruta/url", 1);
insert into pelicula values (2, "thriller2", "ruta/img2", "pelicula prueba2", "jhon doe2 - jana doe2", "sinopsis prueba2", "ruta/url2", 1);
insert into pelicula values (3, "thriller3", "ruta/img3", "pelicula prueba3", "jhon doe3 - jana doe3", "sinopsis prueba3", "ruta/url3", 2);
insert into pelicula values (4, "thriller4", "ruta/img4", "pelicula prueba4", "jhon doe4 - jana doe4", "sinopsis prueba4", "ruta/url4", 1);
insert into pelicula values (5, "thriller5", "ruta/img5", "pelicula prueba5", "jhon doe5 - jana doe5", "sinopsis prueba5", "ruta/url5", 1);

insert into cupon values (1, "criterio prueba", "descripcion prueba", "2022-10-02", 20000.0);
insert into cupon values (2, "criterio prueba2", "descripcion prueba2", "2022-10-02", 21000.0);
insert into cupon values (3, "criterio prueba3", "descripcion prueba3", "2022-10-02", 22000.0);
insert into cupon values (4, "criterio prueba4", "descripcion prueba4", "2022-10-02", 23000.0);
insert into cupon values (5, "criterio prueba5", "descripcion prueba5", "2022-10-05", 24000.0);

insert into funcion values (1, "Lunes-Viernes", 20000.0);
insert into funcion values (2, "Sabado", 22000.0);
insert into funcion values (3, "Domingo", 23000.0);
insert into funcion values (4, "Festivo", 24000.0);
insert into funcion values (5, "Eventos", 27000.0);

insert into teatro values (1, "Cra. 14 #6-02", "Teatro 1 prueba", 1);
insert into teatro values (2, "Cra. 14 #7-02", "Teatro 2 prueba", 1);
insert into teatro values (3, "Cra. 14 #8-02", "Teatro 3 prueba", 1);
insert into teatro values (4, "Cra. 14 #9-02", "Teatro 4 prueba", 1);
insert into teatro values (5, "Cra. 14 #10-02", "Teatro 5 prueba", 1);

insert into sala values (1, "Sala 1 prueba", 1);
insert into sala values (2, "Sala 2 prueba", 1);
insert into sala values (3, "Sala 3 prueba", 2);
insert into sala values (4, "Sala 4 prueba", 2);
insert into sala values (5, "Sala 5 prueba", 3);

insert into funcion_sala values (1, 2, 2, 1);
insert into funcion_sala values (2, 1, 1, 1);
insert into funcion_sala values (3, 1, 2, 1);
insert into funcion_sala values (4, 2, 1, 1);
insert into funcion_sala values (5, 3, 2, 1);

insert into compra values (1, "2022-10-02 12:30:59", "Efectivo", 30000.0, 30000.0, "12345", 1);
insert into compra values (2, "2022-10-03 12:30:59", "Efectivo", 40000.0, 40000.0, "12345", 1);
insert into compra values (3, "2022-10-04 12:30:59", "Tarjeta", 50000.0, 50000.0, "12346", 2);
insert into compra values (4, "2022-10-05 12:30:59", "Efectivo", 70000.0, 70000.0, "12347", 3);
insert into compra values (5, "2022-10-05 12:30:59", "Efectivo", 20000.0, 20000.0, "12347", 2);

insert into cupon_cliente values (1, 1, "12345", 1);
insert into cupon_cliente values (2, 1, "12346", 2);
insert into cupon_cliente values (3, 1, "12345", 2);
insert into cupon_cliente values (4, 1, "12348", 4);
insert into cupon_cliente values (5, 1, "12349", 5);

insert into confiteria_compra values (1, 50000.0, 3, 1);
insert into confiteria_compra values (2, 30000.0, 1, 2);
insert into confiteria_compra values (3, 40000.0, 2, 3);
insert into confiteria_compra values (4, 70000.0, 5, 4);
insert into confiteria_compra values (5, 60000.0, 4, 5);

insert into entrada values (1, "Columna A1", "Fila C3", 1);
insert into entrada values (2, "Columna A2", "Fila J3", 1);
insert into entrada values (3, "Columna A1", "Fila C4", 2);
insert into entrada values (4, "Columna A1", "Fila B3", 3);
insert into entrada values (5, "Columna A3", "Fila B4", 3);

insert into distribuccion_silla values (1, 7, "Distribuccion 1", 7, 49, 1);
insert into distribuccion_silla values (2, 8, "Distribuccion 2", 8, 64, 1);
insert into distribuccion_silla values (3, 9, "Distribuccion 3", 9, 81, 1);
insert into distribuccion_silla values (4, 6, "Distribuccion 4", 6, 36, 1);
insert into distribuccion_silla values (5, 5, "Distribuccion 5", 5, 25, 1);
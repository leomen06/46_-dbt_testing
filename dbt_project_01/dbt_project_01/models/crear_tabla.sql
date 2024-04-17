create table datos_csv(
    id int
    ,first_name varchar(20)
    ,last_name varchar(20)
    ,email varchar(50)
    ,gender varchar(10)
    ,ip_address varchar (20)
);

copy datos_csv from {{ source('datos_de_origen') }};
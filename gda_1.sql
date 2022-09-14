-- 1. Crear el 'USUARIO' que se pueda conectar desde cualquier terminal y ver informacion de toda la BD. 

CREATE USER IF NOT EXISTS 'USUARIO'@'%' IDENTIFIED BY 'usuario';
GRANT SELECT ON pokemonrpg.* TO 'USUARIO'@'%';
-- 2. Crear el usuario 'admin' que desde la terminal el sistema puede ver toda la BD y dar de alta y modificar Especie y Objeto.

CREATE USER IF NOT EXISTS 'ADMIN'@'localhost' IDENTIFIED BY 'admin';
GRANT SELECT ON pokemonrpg.* TO 'ADMIN'@'localhost';
GRANT INSERT ON pokemonrpg.Especie TO 'ADMIN'@'localhost';
GRANT UPDATE ON pokemonrpg.Objeto TO 'ADMIN'@'localhost';

-- 3. Crear el usuario 'Sistema' que se puede conectar desde la red 10.120.3.x y puede ver toda la BD y:
--Mochila: INSERT Y modificar CANTIDAD
--Entrenador: INSERT Y modificar DINERO
--POKEDEX: INSERT y modificar ENCUENTROS Y ATRAPADOS.

CREATE USER IF NOT EXISTS 'SISTEMA'@'10.120.3.%' IDENTIFIED BY 'sistema';
GRANT SELECT ON pokemonrpg.* TO 'SISTEMA'@'10.120.3.%' ;
GRANT INSERT, UPDATE(cantidad) ON pokemonrpg.Mochila TO 'SISTEMA'@'10.120.3.%';
GRANT INSERT,UPDATE(dinero) ON pokemonrpg.Entrenador TO 'SISTEMA'@'10.120.3.%';
GRANT INSERT,UPDATE(Encuentros, Atrapados) ON pokemonrpg.Pokedex TO 'SISTEMA'@'10.120.3.%';
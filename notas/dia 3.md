# Contenedor

Entorno aislado donde ejecutar procesos en un sistema Operativo Linux.

Con su propio:
- Sistema de archivos
- Configuración de red
- Limitación de recursos HW
- Variables de entorno

Me ofrece algo similar a lo que me ofrecen las maquinas virtuales.. pero conseguido de una forma MUY DIFERENTE

Se crean desde una IMAGEN DE CONTENEDOR

# Imagen de contendor

Un fichero tar que dentro tiene:
- Una app ya instalada y configurada por alguien!
- Además meten de paso otro software que me pueda ser útiles
+ Valores por defecto de configuración que puedo cambiar (VARIABLES DE ENTORNO POR DEFECTO)


docker run --rm -d --name miapache httpd
docker exec -it miapache /bin/bash



# Playbook de apache

Instala apache y mis apps en unos servers
app1, app2 -> entorno de desarrollo ... 1 servidor

httpd.desa.conf
virtualhost1
virtualhost2

app1, app2 -> entorno de produccion... cluster... 15 servidores
httpd.prod.conf Ni de coña
virtualhost1.prod
virtualhost2.desa

5 servidores
    -> en cada uno monto 2 apaches. ?? Sentido < un "poco" de tranquilidad




# Playbook Apache:

Sirve para tomar una maquina y dejarle un Apache montado y configurado
E instalarle unas apps y configurar apache (virtualhosts)

Playbook -> Servidores de apache tipo A, app1, app2
Playbook -> Servidores de apache tipo B, app3

Al llamar al playbook, damos: vars.
    Varios fichero httpd.conf... para cada tipo de servidor
    En cada servidor del mismo tipo, montamos el mismo fichero httpd.conf 
    
    
---
Conectarnos de verdad de la buena a maquinas remotas por ssh

Usamos clave publica/privada:
Requiere el host dado de alta en ~/.ssh/known_hosts
La primera vez... no está. PROBLEMON

Soluciones:                                     RESULTADO   NOTAS

 1  $ export ANSIBLE_HOST_KEY_CHECKING=False          √       Ruina gigantesca!!!
    Puedo garantizar que esa variable exista donde voy a ejecutar el playbook? NO
    Que hacemos con esa variable?   Desactivar comprobación del remoto... Me paso la seguridad por ....

 2  Añadir --ssh-common-args='-o StrictHostKeyChecking=no' al ansible-playbook
                                                      √       Ruina gigantesca!!!
    Me sigo pasando la seguridad por ....

 3  [defaults] < host_key_checking = False      > en el fichero ansible.cfg    
                                                        /etc/ansible  
                                                        ~/.ansible.cfg

 4 GUAY
    Buscar si tengo al equipo dado de alta en mi known_hosts
    Si no, lo doy de alta
    

ssh-keygen -F hostname.     nos mira si tenemos el host dado de alta
ssh-keyscan -H hostname.    genera la huella para darlo de alta en el fichero ~/.ssh/known_hosts




Al trabajar via ssh con claves:
El servidor al que me conecto me identifica por mi clave 

Siempre necesito autenticación: contraseña / clave publica/privada
    
    
    
    
    






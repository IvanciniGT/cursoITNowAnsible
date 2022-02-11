FACTS = VARIABLE DINAMICA
------------------------------

Al conectarme con una maquina, puedo pedir a Ansible que me traiga algunos datos de esa máquina:
    - gather_facts: true        \
    - modulo: setup             /   ansible_facts

Puedo crear variables dinámicas en Ansible:
    - modulo: set_fact

Con repecto a las máquinas... gather_facts: 
    Yo puedo crear mis propias variables (FACTS) dentro de cada host remoto: CUSTOM_FACTS
    
Escenario 1:
    Dia 1: Ejecutar un playbook desde una maquina A -> maquina B -> Datos... que se necesitan a posteriori
        Qué versión he dejado montada.
        Cuando fue la última vez que se ejecutó el playbook.
    Dia 2: Ejecutar un playbook desde una maquina C -> maquina B

Escenario 2:
    Hay información dinámica que solo existe dentro del remoto y que la necesito para operar.

Los custom facts, se obtienen de la carpeta /etc/ansible/facts.d DEL REMOTO
Un custom fact, es un fichero que vamos a dejar en esa carpeta y que contiene un json

DICCCIONARIOS
---------------
Iterar sobre un diccionario:

DiccionarioA:               Lista
    clave1: valor1              - key: clave1
                                  value: valor1
    clave2: valor2   ->         - key: clave2
                                  value: valor2
    
                Funcion JINJA !!!! "dict2items"
    


Iterar con subelementos:
---------------------------
- apache:
    package: httpd
    puertos:    -->    lista | subelements ('puertos')
        - 80
        - 81
- nginx:
    package: nginx
    puertos:
        - 77

- [ { apache: { package: httpd, puertos: [80,81] }} , 80 ]
- [ { apache: { package: httpd, puertos: [80,81] }} , 81 ]
- [ { nginx: { package: nginx, puertos: [77] }} , 77 ]


-----------

nginx:
    puertos: 
        - 80
        - 443
apache:
    puertos: 
        - 81
        - 444

---> dict2items
-   key:    nginx
    value:
            puertos: 
                - 80
                - 443
-   key:    apache
    value:
            puertos: 
                - 81
                - 444

                OTRA LISTA
                    V 
---> subelements (value.puertos)
-   -   key:    nginx
        value:
            puertos: 
                - 80
                - 443
    -   80
    
-   -   key:    nginx
        value:
            puertos: 
                - 80
                - 443
    -   443

loop: item.0.key
      item.1
      
      
PERMISOS UNIX
--------------
rwx rwx rwx
··· ··· ···
010 011 110

001 < 1 EJECUCION
010 < 2 ESCRITURA
100 < 4 LECTURA
110 < 6
101 < 5 
111 < 7








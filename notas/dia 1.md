# Qué es Ansible?

Es una familia de productos de software.

# Productos dentro del ecosistema Ansible

## Ansible Tower - Redhat / AWX <<< Intro

- Orquestador de tareas de ansible engine/project. De un tipo de tareas muy concreto: Playbooks de ansible.
- Sistema centralizado para gestionar mis playbooks, inventarios.
- Sistema centralizado/API Restful (HTTP) desde el que ejecutar esas tareas.

Es un servidor central, donde tenemos en ejecución:
    AWX/Tower:
        App web que permite gestionar / orquestar playbooks de ansible engine / project.
    En esta máquina corren procesos (a nivel de SO) de ansible engine/project.

## Ansible Galaxy

Repositorio de roles de ansible / herramienta para ayudarnos a crear/gestionar roles.
Role de Ansible? Conjunto de tareas predefinas, que alguien ha creado y ha tenido la amabilidad de compartir con otras personas
                 Que puedo reutilizar
                 Modularización de código (Libreria)
                 
                 Ej. Role: Automatizar la creación y conf de las redes de una computadora.
                     Role: Automatizar la instalación de un serv. de aplicaciónes concreto: Weblogic

## Ansible engine Redhat (de pago) / project <<<<< HABITUALMENTE LLAMADO ANSIBLE

Herramienta de automatización: Para: 
- Herramienta para facilitar la creación de máquinas y su gestión... por ejemplo
- Automatizar tareas de administración.... por ejemplo

Herramientas equivalentes: Puppet, Chef ...

# Redhat

La empresa reina en el mundo Opensource.
Tiene productos de pago... politica no está basada en licencias, sino en subscripciones (soporte).
De todos los productos, siempre hay una versión Opensource y gratuita, y otra de pago.

Productos:
- R.H.Entreprise Linux: RHEL < Proyecto Upstream: Fedora
- Openshift Platform         < Openshift origin   
- RH Openstack               < Openstack
- JBoss                      < Wildfly
- Ansible Tower              < AWX

## Opensource

Cualquiera puede tener acceso al código.
Los sistemas opensource, están sujetos a licencia? SI, y hay muchas.. algunas muy restrictivas.

MITOS: 
- Cualquiera puede contribuir al código
- Gratis

# Historia de Ansible

Redhat NO ES QUIEN EMPIEZA CON ANSIBLE.
Comenzó una persona llamada Micheal DeHaan -> Cobbler < Automatizar la instalación y configuración de un SO en un HIERRO.

Originalmente propiedad de Ansible Inc. -> 2015 Adquirido por redhat.

# Arquitectura / Conceptos básicos de Ansible engine/project

Funciona de forma descentralizada, a diferencia de otras herramientas como Chef o Puppet.
Ansible no necesita de un servidor donde Ansible se esté ejecutando.
Ansible se puede ejecutar en cualquier máquina "Linux".
Puedo instalarlo en Windows.... Su uso el subsistema linux, si.... o si monto una maquina virtual con Linux... si..

Ansible, desde esa máquina que tenemos instalada, 
    puede acceder a entornos remotos, para configurarlos... administralos... Hacer tareas en ellos:
        - Linux.   > ssh
        - Unix.    > ssh
        - Windows. > wrm
    Entornos remotos:
        - Servidores
        - Appliance
        - Firewalls
        - Switches

Ansible en la máquina que se ejecuta requiere tener instalado PYTHON
En teoria en los entornos que va a aadministrar, no requiere nada (ssh, wrm)... en teoría!!!
    En la práctica, ansible realiza las operaciónes (tareas) usando MODULOS.
    El lenguaje en que se desarrollan esos módulos es PYTHON.

Entorno LINUX donde ejecuto ansible
    Python
        Ansible
            Playbooks (listados de tareas... y más)     -> ssh/wrm -> Entorno remoto
                                                                        procesos... modulos
                                                        -> json    <

## Donde puedo instalar Ansible? 

En cualquier Linux con Python

## Objetivos de diseño de Ansible

Sistema descentralizado, no necesidad de un servidor central desde donde ejecutar las tareas. <<<< IMPORTANTE
Requerimientos mínimos, python (linux/unix)
Aprendizaje mínimo
Consistente                         |
    Emplea un lenguaje declarativo  |   En ansible decimos COMO QUEREMOS QUE QUEDE UN ENTORNO
                                                No decimos COMO CONSEGUIR QUE UN ENTORNO QUEDE DE UNA DETERMINADA MANERA
    Idempotencia: Yo puedo ejecutar un playbook (unas tareas) 1 o 100 veces... el sistema siempre tiene que quedar igual.
    
    Antes las automatizaciones las hacíamos con: Scripts de la shell: .sh
    Que problema tiene esto? y que aporta ANSIBLE al respecto:
        - Lenguaje de la shell? Pobre.... para según que cosas
                                Duro
                                Scripting / Programación
        - Decimos NO LO QUE QUIERO EN MI SISTEMA... sino COMO HACERLO
        
--------- UBUNTU         
    1- Instala git
        $ apt-get install git -y 
    2- Crea una carpeta
        $ mkdir -p ~/proyecto
        $ if [! -d ~/proyecto ]; then
            $ mkdir -p ~/proyecto
        $ elif [! -f ~/proyecto ]; then
            $ rm -rf ~/proyecto
            $ mkdir -p ~/proyecto
        $ fi
    3- Clona un repositorio de git en esa carpeta.
        $ git clone URL ~/proyecto (Mas vale que tenga acceso)
        
1 - Que pasa si ya tengo git? por suerte.. apt get es bastante espabilao... no pasaria nada
2 - Que pasa si la carpeta ya está creada? EXPLOSION !!! RUINA GRANDE !!!!
3 - Que pasa si ya he hecho una clonacion antes? Explota... me inetersa actualizarlo... 

--------- ANSIBLE
Quiero git en la maquina... BUSCATE LA VIDA DON ANSIBLE !
Quiero una carpeta ~/proyecto
En esa carpeta quiero la ultima version de este repo de git. Haz lo que necesites... 
    me da igual.. pero cuando acabas que esto sea así!

# Términos:

## Nodo de control: Al entorno (máquina) donde se está ejecutando ANSIBLE (engine/project)

## Nodos gestionados. Entornos a los ANSIBLE (desde el nodo de control) accede para hacer tareas en ellos

## Módulos:
    - Unidades de códugo que ansible ejecuta en los nodos gestionados.
    - Cada módulo tiene un uso particular:
        - Gestión de usuarios: LINUX
        - Gestión de usuarios: WINDOWS
        - Gestion de ficheros
    - Cientos sino miles de módulos
    - Deben cumplir con el principio de la idempotencia

## Inventario

Un fichero, con su(s) particular(es) sintaxis : 3 sintaxis diferentes en Ansible
Que contiene datos acerca de los nodos gestionados: Por ejemplo:
- IPS ... NOMBRES
- TIPO DE SERVIDOR (CLASIFICACIÓN)
- Empresas
- Credenciales
- En que puerto quiero que corra el weblogic que vas a instalar alli dentro

En una organización es habitual tener 1 o varios ficheros de inventario? Montonones
¿¿?? Donde voy a guardar estos ficheros ¿?¿? En un repositorio de git < Repositorios remotos (github, bitbucket, gitlab)

## Tareas

Unidad minima de acción dentro de ansible. Una tarea se ejecuta a través de un módulo "Configuración de un módulo".
Las tareas podemos pedirle a ansible que las ejecute de una en una... Eso no se hace.
Las tareas mejor las agrupamos en ficheros: 

## Playbooks

Un playbook es un fichero (con su propia sintaxis) que contiene:
- Tareas < Roles
- Variables
- Donde las ejecutamos
- Como las ejecutamos

## Sintaxis principal que usamos en Ansible? YAML

Lenguaje informático de marcado de información de proposito general. Al igual que: XML, JSON
Lenguaje informático de marcado de información de dominio especifico: HTML, SVG

Lenguaje:
- Sintaxis      Cómo se articulan las oraciones / sentencias en ese lenguaje
- Gramatica     Cómo se forman palabras y que tipos de palabras podemos utilizar
- Semantica     Qué significan esas palabras.

YAML se ha convertido en el lenguaje de marcado de información más utilziado a día de hoy:
- Ansible
- Docker-compose
- Kubernetes
- Ubuntu < Conf. de red 

YAML se parece a 
 XML
HTML
  ML: Markup language: <tag> contenido </tag>

YAML: YAML aint markup language.
Es un lenguaje pensado para seres humanos, a diferencia de XML o JSON
Fuerte inspiración de Python.

386BSD: SO basado en la spec UNIX ® (POSIX,SUS)
GNU : GNU is not Unix?

# GIT?

Un sistema de control de versiones de software: SCM 
Otros equivalentes: CVS, svn, mercurial...
GIT se ha impuesto al resto.

git ... cómo surge? Linus Torvalds... Para poder crear Linux (Android ... GNU/Linux)

Esto no es algo de desarrolladores? Qué hacemos los sysadmin usando esto????
Los sysadmin a dia de hoy somo programadores.
    Nuestro trabajo ya no es administrar/monitorizar sistemas.
¿Cual es nuestro trabajo? HACER PROGRAMAS QUE ADMINISTRES / MONITORICEN SISTEMAS

Kubernetes
Terraform -> AWS / IBM Cloud 
Ansible -> Provisionar un entorno



# GIT 

Sistema de control de versión, creado por Linus torvalds.

Para qué sirven este tipo de herramientas?
- Mantener un control sobre las modificaciones realizadas sobre el conjunto de fichero que tengo en un proyecto
- Control mayor sobre los cambios que se incorporan en cada backup (COMMIT)
    - Me interesa conocer que lineas concretas han cambiado de un fichero
    - Quien cambió esas lineas concretas
- Herramientas para ayuda a trabajar a un equipo de trabajo.
    - Fusión de cambios: Merge, rebase
- Versiones de ese proyecto (colección de archivos).
    - Versiones secuenciales: v1 -> v2 -> v2.1 -> v2.2 -> v3
    - Versiones paralelas: (MULTIVERSO): Variantes 
        - Software v2
        - Software v1 <- Instalado en clientes
                         Y la tengo que mantener: Si sale un bug, lo tengo que arreglar
    - Lineas de tiempo paralelas: RAMAS
    - LA SAGRADA LINEA TEMPORAL? Rama principal: master, MAIN, trunk
    - En la rama principal no puedo hacer NINGUN CAMBIO !!!!!
    

Sistema de backups . Copia de seguridad cada dia... cada minuto... de mi proyecto y de todos sus archivos?
Un SCM es un sistema de backups avanzado.

git init

REPO LOCAL (proyecto/.git)      <    Area de Preparación(staging)        <      CARPETA proyecto
    COMMIT 1                                                                       fichero 1(3)
       fichero 1(1)                                                                fichero 2
    COMMIT 2
        fichero 1(3)
        fichero 2
        
Estados de un fichero dentro de git:
- Untracked: No está siendo controlado por git
- Modified:  El fichero está siendo controlado por git y ha cambiado desde la ultima versión que git guardo en un commit.
- Unmodified: El fichero esta controlado por git, y en él no hay cambios desde la ultima foto que git tomó
- 

master                                           C7--------------
                                                /
desarrollo. ---C1----C2--------C5------C6-----C7-----------------
                      \                /     /
cambios1               \---C3-------- /  ---/--------------------- Elena
                        \            /
cambios2                 ----C4-----/-------------------------------- Elena

    
                Repo remoto (C1, C2, C3, C7) Gitlab, Github, Bitbucket
      push          |
  ---------------------------------------------
  |                       |                   |                      
Ivan                    Elena               Iñaki
repo local              repo local          repo local

Elena e Iñaki, la primera vez usarian el comando git clone


## POR FIN... ivan va a dejar de enrollarse y empieza con un playbook de ansible. ya era hora !!!!
# Instalación ansible
# Intento de Playbook 
# Intento de inventario
# Ejecutarlo con ansible
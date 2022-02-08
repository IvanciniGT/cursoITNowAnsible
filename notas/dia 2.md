# Ansible Tower

Qué hace?
- Interfaz gráfica WEB de "Ansible engine"
- Instalado en un servidor centralizado
- En él es donde ejecuto los playbooks
- Donde va a estar el playbook? git
- Donde van a estar los ficheros de inventario? git
- Cómo hace Ansible Tower para ejecutar un playbook?
    Igual que nosotros: ejecuta el comando ansible-playbook
- Permite programación y orquestación de playbooks:
    - Programación: CRON UNIX:
                    Todos los jueves días 17 de mes de los 
                    meses impares a las horas pares cada 10 minutos
    - Orquestar playbooks:
        Despues de este playbook, si va bien, ejecuta este otro
                                  si va mal, ejecuta aquel de allí

- Desencadenar la ejecución de un playbook basado en otro tipo de eventos:
    - Ansible Tower: API REST- URL a la que puedo llamar para 
                     que se inicie la ejecución de una tarea.
                        curl: URL AWX/TOWER
    - Jenkins

IBM (detecta un problema) -> X -> Jenkins -> CURL ANSIBLE TOWER (PROBLEMA)
                                                    |
                                                    V
                                            Workflow de playbooks (1)

Opensource <<<< Mayor parte de la gente: AWX
    ansible project

Redhat -> Tower / ansible engine

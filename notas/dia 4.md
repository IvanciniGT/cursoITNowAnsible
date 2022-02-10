# Playbook Apache:

Sirve para tomar una maquina y dejarle un Apache montado y configurado
E instalarle unas apps y configurar apache (virtualhosts)

Playbook -> Servidores de apache tipo A, app1, app2
Playbook -> Servidores de apache tipo B, app3

Al llamar al playbook, damos: vars.
    Varios fichero httpd.conf... para cada tipo de servidor
    En cada servidor del mismo tipo, montamos el mismo fichero httpd.conf 
# TL;DR;

```sh
ansible-playbook playbook-apache.yaml \
                 -i <INVENTORY_FILE> \
                 --extra-vars "@<VARS_FILE>" 
```

# Tags

- mandatory
- pre-instalacion
- instalacion
- configuracion
- test

# Vars

```yaml
apache:                 
    user:                   apache
    virtualhosts:           
        -   domain:         localhost
            documentRoot:   /home/apache/app
            ports:
                            - 80
            app:            https://github.com/IvanciniGT/webEjemploAnsible
    dependencies:           
                            - php
    modules:                
                            - mod_php
```
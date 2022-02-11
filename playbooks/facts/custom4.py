#!/usr/bin/python3

import json
saludo="HOLA"
nombre="IVAN"

resultado={ "dato1": saludo, "dato2": nombre}

print(json.dumps(resultado))
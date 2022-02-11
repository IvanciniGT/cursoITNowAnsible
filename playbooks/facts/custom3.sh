#!/bin/bash
MAQUINA=$(hostname)

cat << EOF  
{
    "dato1": "$MAQUINA",
    "dato2": "6767"
}
EOF
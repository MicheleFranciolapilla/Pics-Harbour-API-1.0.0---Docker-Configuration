#!/bin/bash

# Setta la variabile d'ambiente 'SEED_DB' al suo valore di default 'true', così come nel file 'docker-compose.yml'.
SEED_DB="true"
# Setta la variabile 'MODE' a stringa vuota.
MODE=""

# Cicla tra tutti i parametri passati e li processa
while (( "$#" )); do
    # Effettua il 'case', inteso come 'switch' in Javascript, sul primo parametro (parametro corrente, poichè 'shift' rimuove il parametro in posizione 1 ad ogni ciclo).
    # Il 'case' viene eseguito sul parametro convertito in 'lowercase'
    # Il ';;' ha lo stesso effetto del 'break' in Javascript
    case "${1,,}" in
        noseed)
            SEED_DB="false"
            shift
            ;;
        -d)
            MODE="-d"
            shift
            ;;
        *)
            echo "Unknown option: $1"
            shift
            ;;
    # Chiude il 'case'
    esac
# Chiude il ciclo
done

# Esporta la variabile d'ambiente ed esegue il comando 'docker-compose up' con l'eventuale parametro MODE
export SEED_DB
docker-compose up $MODE

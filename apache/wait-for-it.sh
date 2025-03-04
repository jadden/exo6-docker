#!/bin/sh

# Variables
DB_HOST="${DB_HOST:-mysql}"
DB_PORT="${DB_PORT:-3306}"
DB_USER="${DB_USER:-root}"
DB_PASS="${DB_PASS:-rootpassword}"
DB_DATABASE="${DB_DATABASE:-testdb}"
TIMEOUT=30
echo "On attends MySQL sur $DB_HOST:$DB_PORT avec utilisateur '$DB_USER' pendant $TIMEOUT secondes..."

# Boucle d'attente
for i in $(seq 1 $TIMEOUT); do
    OUTPUT=$(mysql -h"$DB_HOST" -P"$DB_PORT" -u"$DB_USER" -p"$DB_PASS" -e "SELECT 1;" "$DB_DATABASE" 2>&1)
    result=$?
    if [ $result -eq 0 ]; then
        echo "MySQL est prêt sur $DB_HOST:$DB_PORT !"
        exec apache2-foreground
    fi

    echo "MySQL pas encore prêt... (Tentative $i/$TIMEOUT) Code erreur: $result"
    echo "Erreur MySQL : $OUTPUT"
    sleep 1
done


# Timeout
echo "Timeout !"
exit 1
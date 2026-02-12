#!/bin/bash
#Alberto López González

clear
if [ ! $UID == 0 ]; then
	echo "No eres root"
	exit
fi

if [ $# -eq 1 ]; then
	Base_UID=$1
else
	Base_UID=1000
fi

FECHA=$(date +"%d-%m-%Y")
HORA=$(date +"%H:%M")

echo "========================================================="

echo "Informe del usuario el día $FECHA a las $HORA"



lineas=$(cat /etc/passwd)

contador=0

for l in $lineas; do

	u=$(echo "$l" | cut -d ":" -f 1)
	ID=$(echo "$l" | cut -d ":" -f 3)
	if [ "$ID" -ge "$Base_UID" ] 2>/dev/null; then
		echo "$u - $ID"
		contador=$(($contador + 1))
	fi
done

echo "Total: $contador usuarios"
echo "========================================================="

echo "$FECHA-$HORA-El usuario $user ha solicitado un informe de usuario" > /tmp/logeventos

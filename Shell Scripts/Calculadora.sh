#!/bin/bash
#Alberto López González
#08/02/2026

clear

if [ $# -ne 2 ]; then
	echo "Uso: <archivo_salida> <num_interacciones> "
	exit 1
fi

archivo_salida=$1
num_interacciones=$2
interacciones=0

if [[ ! $num_interacciones=~^[0-9]+$ ]]; then
	echo "Error: el segundo parámetro debe ser un número"
	exit 1
fi

if [ -f "$archivo_salida" ] ; then
	echo "Error, el archivo existe"
	exit 1
fi

echo "Alberto López González"

while [ $interacciones -lt $num_interacciones ]; do
	read -p "Añada dos valores:" num1 num2

	echo "Suma = S"
	echo "Resta = R"
	echo "Multiplicación = M"
	echo "División = D"
	echo "Salir = X"
	read -p "Seleccione operación:" opcion

	case $opcion in
	S)
	resultado=$((num1 + num2))
		echo "Suma $num1 $num2" >> "$archivo_salida"
		echo "Resultado: $resultado"
	;;
	R)
	resultado=$((num1 - num2))
		echo "Resta $num1 $num2" >> "$archivo_salida"
		echo "Resultado: $resultado"
	;;
	M)
	resultado=$((num1 * num2))
		echo "Multiplicación $num1 $num2" >> "$archivo_salida"
		echo "Resultado: $resultado"
	;;
	D)
	if ["$num2" -eq 0 ]; then
		echo "Error: división entre 0"
	else
		resultado=$(($num1/$num2))
		echo "División $num1 $num2" >> "$archivo_salida"
		echo "Resultado: $resultado"
	fi
	;;
	X)
		echo "Saliendo..."
		exit 0
	;;
	*)
		echo "Opción no válida"
	;;
	esac

	echo
	interaccion=$(($interaccion +1))
done

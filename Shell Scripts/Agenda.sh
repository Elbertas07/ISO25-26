#!/bin/bash
#Alberto López González
#Ejercicio Entregable AGENDA
clear

AGENDA=agenda.txt

if [ ! -f "$AGENDA" ];then
	touch "$AGENDA"
fi

while true; do

	echo "==============="
	echo     "AGENDA"
	echo "==============="
	echo "a) Añadir una entrada"
	echo "b) Buscar por dni"
	echo "c) Ver la agenda completa"
	echo "d) Eliminar todas las entradas de la agenda"
	echo "e) Finalizar"
	read -p "Eliga una opción." opcion
case "$opcion" in

	a)
		read -p "Introducir el DNI:" dni
		if grep -q "^dni:" "$AGENDA"; then
			echo "El DNI ya está registrado en la agenda."
		else
		read -p "Introduce el nombre: " nombre
		read -p "Introduce los apellidos: " apellidos
		read -p "introduce la localidad: " localidad

	echo "$dni:$nombre:$apellidos:$localidad" >> "$AGENDA"
	echo "Entrada añadida correctamente."
	fi

	;;

	b)
		read -p "Introduce el DNI a buscar:" dni_buscar

		linea=$(grep "^$dni_buscar:" "$AGENDA")

	if [ -z "$linea" ]; then
		echo "No existe ninguna persona con ese DNI".
	else
		nombre=$(echo "$linea"| cut -d ":" -f 2)
		apellidos=$(echo "$linea" | cut -d ":" -f 3)
		localidad=$(echo "linea" | cut -d ":" -f 4)

		echo "La persona con DNI número $dni_buscar es: $nombre $apellidos, y vive en $localidad"
	fi

	;;

	c)
		if [ ! -s "$AGENDA" ]; then
			echo "Agenda vacía."
		else
			echo "Contenido de la agenda:"
			cat "$AGENDA"
		fi
	;;

	d) 	> "$AGENDA"
		echo "Agenda borrada correctamente."

	;;

	e)
		echo "Saliendo del programa..."
		exit 0
	;;

	*)
		echo "Opción no valida"

	;;
	esac
	echo ""
done

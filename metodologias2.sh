#!/bin/bash

# Base de datos (archivo para almacenar la información)
DB_FILE="metodologias_info.txt"

# Función para el submenú de acciones
function submenu {
    local section=$1
    echo "Usted está en la sección $section, seleccione la opción que desea utilizar:"
    echo "1) Agregar información"
    echo "2) Buscar"
    echo "3) Eliminar información"
    echo "4) Leer base de información"
    read -p "Seleccione una opción (1-4): " action_choice

    case $action_choice in
        1)
            agregar_info $section
            ;;
        2)
            buscar_info $section
            ;;
        3)
            eliminar_info $section
            ;;
        4)
            leer_info
            ;;
        *)
            echo "Opción no válida."
            ;;
    esac
}

# Función para agregar información
function agregar_info {
    local section=$1
    read -p "Ingrese la información que desea agregar para $section: " info
    echo "$section: $info" >> $DB_FILE
    echo "Información agregada correctamente."
}

# Función para buscar información
function buscar_info {
    local section=$1
    read -p "Ingrese el término de búsqueda para $section: " term
    grep "$section.*$term" $DB_FILE && echo "Resultados encontrados." || echo "No se encontraron coincidencias."
}

# Función para eliminar información
function eliminar_info {
    local section=$1
    read -p "Ingrese el término de la información que desea eliminar de $section: " term
    sed -i "/$section.*$term/d" $DB_FILE && echo "Información eliminada." || echo "No se encontró la información."
}

# Función para leer toda la base de información
function leer_info {
    if [ -s $DB_FILE ]; then
        echo "Contenido de la base de información:"
        cat $DB_FILE
    else
        echo "La base de información está vacía."
    fi
}

# Función para el menú de metodologías ágiles
function menu_agile {
    echo "Bienvenido a la guía rápida de Agile, para continuar seleccione un tema:"
    echo "1) SCRUM"
    echo "2) XP (Programación Extrema)"
    echo "3) Kanban"
    echo "4) Crystal"
    read -p "Seleccione una opción (1-4): " agile_choice

    case $agile_choice in
        1)
            submenu "SCRUM"
            ;;
        2)
            submenu "XP (Programación Extrema)"
            ;;
        3)
            submenu "Kanban"
            ;;
        4)
            submenu "Crystal"
            ;;
        *)
            echo "Opción no válida."
            ;;
    esac
}

# Función para el menú de metodologías tradicionales
function menu_traditional {
    echo "Bienvenido a la guía rápida de metodologías tradicionales, para continuar seleccione un tema:"
    echo "1) Cascada"
    echo "2) Espiral"
    echo "3) Modelo V"
    read -p "Seleccione una opción (1-3): " traditional_choice

    case $traditional_choice in
        1)
            submenu "Cascada"
            ;;
        2)
            submenu "Espiral"
            ;;
        3)
            submenu "Modelo V"
            ;;
        *)
            echo "Opción no válida."
            ;;
    esac
}

# Validar parámetro al ejecutar el script
if [ "$1" == "-a" ]; then
    menu_agile
elif [ "$1" == "-t" ]; then
    menu_traditional
else
    echo "Uso: $0 -a (Metodologías ágiles) o -t (Metodologías tradicionales)"
fi


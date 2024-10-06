#!/bin/bash

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
            echo "SCRUM: Es un marco de trabajo ágil..."
            ;;
        2)
            echo "XP (Programación Extrema): Es una metodología ágil enfocada..."
            ;;
        3)
            echo "Kanban: Es un sistema ágil visual..."
            ;;
        4)
            echo "Crystal: Es una familia de metodologías ágiles..."
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
            echo "Cascada: Es un modelo de desarrollo secuencial..."
            ;;
        2)
            echo "Espiral: Es un modelo iterativo que combina elementos..."
            ;;
        3)
            echo "Modelo V: Es un modelo de desarrollo de software que..."
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


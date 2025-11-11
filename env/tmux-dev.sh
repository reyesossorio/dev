#!/bin/bash

# Nombre de la sesión
SESSION_NAME="dev"

# Carpeta del proyecto
PROJECT_DIR="$HOME/Dev"
NOTES_DIR="$HOME/Documents/dev-notes"
# Crear sesión si no existe
tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
    # Crear nueva sesión en segundo plano con ventana 1 ejecutando nvim
    tmux new-session -d -s $SESSION_NAME -c $PROJECT_DIR -n "nvim" nvim

    # Crear ventana 2 con shell normal
    tmux new-window -t $SESSION_NAME:2 -n "shell" -c $PROJECT_DIR
    
    # Crear ventana 3 con las notas 
    tmux new-window -t $SESSION_NAME:3 -n "notes" -c $NOTES_DIR nvim
    
    # Seleccionar la primera ventana por defecto
    tmux select-window -t $SESSION_NAME:1
fi

# Adjuntar a la sesión
tmux attach-session -t $SESSION_NAME


#!/bin/bash
set -e

echo "🔧 Ejecutando despliegue..."

# Ejecutar migraciones
php artisan migrate --force

# Limpiar cache
php artisan config:clear
php artisan cache:clear

echo "✅ Despliegue completado!"
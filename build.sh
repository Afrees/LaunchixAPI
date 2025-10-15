#!/bin/bash
set -e

echo "🚀 Iniciando build de Laravel..."

# Instalar dependencias PHP
composer install --optimize-autoloader --no-dev --no-interaction

# Instalar y construir assets si existen
if [ -f "package.json" ]; then
    echo "📦 Instalando Node dependencies..."
    npm ci --silent
    npm run build
fi

# Configurar permisos
chmod -R 775 storage
chmod -R 775 bootstrap/cache

# Optimizar Laravel
php artisan config:cache
php artisan route:cache
php artisan view:cache
php artisan event:cache

echo "✅ Build completado!"
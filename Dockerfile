# Usamos la imagen oficial de PHP con Nginx
FROM php:8.1-fpm

# Instalamos extensiones de PHP necesarias
RUN docker-php-ext-install pdo pdo_mysql

# Instalamos Nginx
RUN apt update && apt install -y nginx && rm -rf /var/lib/apt/lists/*

# Copiamos los archivos de la aplicación
COPY . /var/www/html

# Copiamos el archivo de configuración de Nginx
COPY nginx.conf /etc/nginx/sites-available/default

# Exponemos el puerto 80
EXPOSE 80

# Comando de inicio para PHP y Nginx
CMD service nginx start && php-fpm


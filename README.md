# Proyecto de Laravel con Docker
Este proyecto proporciona un entorno Dockerizado para ejecutar una aplicación Laravel. Utiliza Docker Compose para orquestar los contenedores necesarios.

## Requisitos
Antes de comenzar, asegúrate de tener los siguientes requisitos instalados en tu sistema:

Docker: https://www.docker.com/get-started

## Configuración
1. Clona este repositorio en tu máquina local
2. Ve al directorio del proyecto: `cd <PROYECTO>`
3. cp .env.example .env

Asegúrate de configurar las variables de entorno según tus necesidades.

## Levantar el Ambiente con Docker
Ejecuta el siguiente comando para levantar los contenedores:
```bash
docker-compose up -d
```

Esto iniciará los contenedores de Docker en segundo plano.

## Accede a la aplicación Laravel en tu navegador:
URL: http://localhost:8080

## Instalación de Laravel
Si necesitas instalar una versión específica de Laravel en el directorio laravel, sigue estos pasos:

1. Accede al contenedor de la aplicación Laravel y navega al directorio "laravel" (crearlo sino esta):
```bash
docker-compose exec laravel-app bash
mkdir laravel
cd laravel
```
2. Dentro del contenedor, ejecuta el siguiente comando para instalar Laravel:
```bash
composer create-project --prefer-dist laravel/laravel .
```

3. Esto creará una nueva instalación de Laravel en el directorio actual (.).

Sal del contenedor:
```bash
exit
```

Ahora tendrás una nueva instalación de Laravel en el directorio laravel dentro del proyecto.

### Otros aspectos importantes:
Si se requiere se pueden configurar las versiones de las imagenes en el Dockerfile y docker-compose:
1. Cambiar la versión de PHP, por default esta configurada la "7.3"
2. Cambiar la versión de NodeJS, por default esta la "^16.*" 
3. Cambiar la versión de MySQL, por default esta "5.7.*"

Happy coding!
# Prueba para desarrolladores de Tooldata ###
Este entorno de desarrollo replica la misma configuración que se tiene en el
servidor de producción con la características adicionales de que tiene disponible
livereload tanto para el Backend con el Frontend.

### Instrucciones ###
```bash
# Para iniciar
git clone --recurse-submodules https://github.com/Jamp/dev-server.git
cd dev-server

cd frontend && yarn && cd ..
cd backend && npm install && cd ..

docker-compose up

# Para actualizar todo
git submodule foreach git pull origin master
```

### Características ###
- Frontend de Tooldata con livereload
- Backend de Tooldata con livereload
- PostgreSQL con autenticación activa para la base de datos relacional
- MongoDB con autenticación activa para la base de datos no relacional
- NGINX para hacer proxy reverse escuchando por defecto el puerto 80

### Requerimientos ###
- Docker CE 16+
- Docker Compose 1+
- Tener desocupado el puerto 80

### Problemas comunes ###
- Si el frontend al construir da un error con que no consigue la librería chalk,
entrar en el directorio del frontend y hacer un ```yarn``` para que instale todas
las depende y se vuelve a reconstruir con un ```docker-compose up --build```
(**Esto queda al pendiente por corregir**)

### Autor ###
- Jaro Marval <jaro@tooldata.io>

# Imagen base oficial de Node
FROM node:20-bullseye

# Instala dependencias necesarias para n8n
RUN apt-get update && apt-get install -y python3 make g++ git

# Crea directorio de la app
WORKDIR /app

# Copia los archivos del proyecto
COPY package*.json ./

# Instala dependencias
RUN npm install --omit=dev

# Copia todo el proyecto
COPY . .

# Expone el puerto que usa n8n
EXPOSE 5678

# Arranca n8n
CMD ["npm", "start"]

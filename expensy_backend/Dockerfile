#generate Dockerfile for thsi expensy_backend

#Backend (expensy_backend/.env)
#Variable	Default	Description
#PORT	8706	Server port
#DATABASE_URI	mongodb://root:example@localhost:27017	MongoDB connection
#REDIS_HOST	localhost	Redis host
#REDIS_PORT	6379	Redis port
#REDIS_PASSWORD	someredispassword	Redis password
# Use an official Node.js runtime as a parent image
FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 8706
CMD ["node", "dist/server.js"]
     


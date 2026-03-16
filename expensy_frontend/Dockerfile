#Frontend (expensy_frontend/.env.production)
#Variable	Default	Description
#NEXT_PUBLIC_API_URL	http://localhost:8706	Backend API URL
# Use an official Node.js runtime as a parent image
FROM node:18
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
EXPOSE 3000
CMD ["npm", "run", "preview"]
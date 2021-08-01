FROM node:boron

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json .
RUN npm install
RUN npm install chai
RUN npm install chai-http
RUN npm install express
RUN npm install socket.io

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "npm", "start" ]

# Use an official NGINX runtime as a parent image
FROM nginx:latest

# Install Node.js and npm
RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# Install PM2
RUN npm install -g pm2

# Install mongodb
RUN /bin/sh /mongo.sh

# Set environment variables for MongoDB connection
ENV MONGO_HOST=localhost \
    MONGO_DB=firstmongo 

# Copy the application files to the container
COPY . /home/app

# Set the working directory to /home/app
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
RUN npm install -g yarn

# Install dependencies
RUN yarn

# Remove the default nginx configuration file and replace it with our own
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf

# Create directory for custom configuration
RUN mkdir -p /etc/nginx/sites-available

# Copy default configuration file
COPY default /etc/nginx/sites-available/default

# Expose port 80
EXPOSE 80

# Start Nginx and PM2
CMD service nginx start && pm2-runtime start script.js


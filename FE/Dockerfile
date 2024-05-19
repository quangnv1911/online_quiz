# build stage
FROM node:20-alpine as build-stage
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# production stage
FROM nginx:stable-alpine3.17 as production-stage

# Remove any existing config files
RUN rm /etc/nginx/conf.d/*

# Copy config files
# *.conf files in conf.d/ dir get included in main config
COPY nginx.conf /etc/nginx/
COPY --from=build-stage /app/build /usr/share/nginx/html
# Expose the listening port
EXPOSE 83

# Launch NGINX
CMD [ "nginx", "-g", "daemon off;" ]
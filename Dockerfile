FROM node:10 AS ui-build
WORKDIR /usr/src/app
COPY react-webapp/ ./react-webapp/
RUN cd react-webapp && npm install && npm run build


FROM nginx:alpine

#!/bin/sh


## Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy from the stahg 1
COPY --from=ui-build /usr/src/app/react-webapp/build/ /usr/share/nginx/html

EXPOSE 4200 80 3000
 
ENTRYPOINT ["nginx", "-g", "daemon off;"]

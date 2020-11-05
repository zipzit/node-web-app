# node-web-app
Simple Docker Container based on NodeJS Alpine 

It is intended that this container be used with docker compose to create a basic node server (either client server or API style server)

In my particular use case I have 
 - nginx proxy server
 - React client server (using zipzpt/node-web-app)
 - Mongo container
 - React backend API server (again using zipzit/node-web-app)
 
Remember with Node Alpine to gain access to the container, you must use:
    $  docker exec -it <node-app-1> sh
     

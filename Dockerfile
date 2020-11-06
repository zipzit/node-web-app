FROM "node:current-alpine3.10"
#FROM "node:latest"

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8080

CMD [ "node", "server.js" ]

##VOLUME /usr/src/app

# build docker image via:
#  $  docker build -t <your username>/node-web-app .
# run docker image via:
#  $  docker run -p 49160:8080 -d <your username>/node-web-app

# check http://0.0.0.0:49160  --> Hello World

# If you need to go inside the normal node container you can use the exec command:
#  $  docker exec -it <container id> /bin/bash
# If you need to go inside the alpine node container you can use the exec command:
#  $  docker exec -it <container id> sh


# ---Other Docker Tools-----------------------------------------------------------

#     $ docker info
#     $ docker-compose verbose up
#     $ docker logs myContainerImage               ## Display Log File
#     $ docker inspect myContainerImage            ## Get Info on Container, including IP Address
#     $ docker port myContainerImage               ## Get info on assigned ports.
#     $ docker-machine ip default                  ## find the hostname

# ---Containers and Images--------------------------------------------------------

#     Docker containers are like DVD drive
#     Docker images are like DVD's ... they are unique, individual, and fit into a container

#     $ docker images       ## list images
#     $ docker images -a    ## list all images
#     $ docker ps           ## list containers
#     $ docker ps -a        ## list all containers

#     $ docker stop Cool_Static_Site           ## Stop container
#     $ docker rm Cool_Static_Site             ## Remove container
#     $ docker rm -f static-site-2             ## Shortcut, stop and remove the container
#     $ docker rm `docker ps --no-trunc -aq`   ## Remove all containers
#     $ docker stop $(docker ps -a -q)         ## Stop all containers
#     $ docker rm $(docker ps -a -q)           ## Remove all containers

#     $ docker images -f dangling=true         ## List dangling images
#     $ docker rmi $(docker images -f dangling=true -q)      ## remove dangling images
#     $ docker rmi $(docker images -a -q)      ## Remove all images

#     $ docker network ls -q                   ## List all networks
#     $ docker network rm $(docker network ls -q)            ## Remove all of your networks

# ---Docker remove named volumes--------------------------------------------------

#     https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes

#     $ docker system prune -a                 ## remove any stopped containers and all unused images
#     $ docker volume ls                       ## List all volumes
#     $ docker volume rm volume_name volume_name    ## Remove volume
#     $ docker volume ls -f dangling=true           ## List Dangling Volumes
#     $ docker volume prune                         ## Delete Dangling Volumes

#     $ docker service ls                           ## List services (swarm only)
#     $ docker service rm service_name              ## Remove service (swarm only)

# ---Shell into a running docker node container?----------------------------------

#     Normally it's $ docker exec -it node-app-1 /bin/bash
#     But that won't work with alpine node.  There try:
#     docker exec -it node-app-1 sh

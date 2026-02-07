FROM alpine:latest

# Install openjdk
RUN apk add openjdk21

# Create and populate new workdir
WORKDIR /srv/

ADD *.jar    ./

ADD config/  ./
ADD plugins/ ./plugins/

# Add world mount symlinks and directory
RUN mkdir -p /mnt/WORLDATA/world

#RUN mkdir /mnt/WORLDATA
ADD worlds /mnt/WORLDATA
RUN ln -s /mnt/WORLDATA/world world


# Setup user to run the minecraft server and chown it
RUN adduser -D --no-create-home user
RUN chown -R user:user /srv/
RUN chown -R user:user /mnt/WORLDATA/
USER user:user

# List workdir for easier debugging
RUN ls

# Expose service's ports
EXPOSE 25561/tcp
#EXPOSE 25571/tcp
# ^only needed for rcon support

# Run service on container start
#ENV PWD=/usr/src/SERVER_DATA

# Long list of unknown wizard's black magic JVM arguments.
# I have no idea if these help, are really needed,
# or how many will break with newer java versions
ENTRYPOINT java -Xms2G -Xmx2G -jar *.jar

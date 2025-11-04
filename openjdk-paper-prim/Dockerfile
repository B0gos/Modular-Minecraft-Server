FROM openjdk:oraclelinux8

# Create and populate the new workdir
RUN mkdir /usr/src/SERVER_DATA
WORKDIR /usr/src/SERVER_DATA

ADD *.jar    ./
ADD config/  ./
ADD plugins/ ./plugins/ 

# Add world mount symlinks and directory
RUN mkdir -p /mnt/WORLDATA/world
RUN mkdir -p /mnt/WORLDATA/world_nether
RUN mkdir -p /mnt/WORLDATA/world_the_end

#RUN mkdir /mnt/WORLDATA
ADD worlds /mnt/WORLDATA

RUN ln -s /mnt/WORLDATA/world world
RUN ln -s /mnt/WORLDATA/world_nether world_nether
RUN ln -s /mnt/WORLDATA/world_the_end world_the_end


# Setup user to run the minecraft server and chown it
RUN groupadd --gid 1001 user
RUN useradd --uid 1001 --gid 1001 user
RUN chown -R user:user /usr/src/SERVER_DATA
RUN chown -R user:user /mnt/WORLDATA/
USER user:user

# List workdir for easier debugging
RUN ls

# Expose service's ports
EXPOSE 25562/tcp
#EXPOSE 25572/tcp
# ^only needed for rcon support

# Run service on container start
#ENV PWD=/usr/src/SERVER_DATA
# ^I don't think this is really neccessary

#https://www.spigotmc.org/threads/guide-optimizing-spigot-remove-lag-fix-tps-improve-performance.21726/page-10#post-1055873
# Long list of unknown wizard's black magic JVM arguments.
# I have no idea if these help, are really needed,
# or how many will break with newer java versions
ENTRYPOINT java -Xms8G -Xmx8G -jar *.jar 

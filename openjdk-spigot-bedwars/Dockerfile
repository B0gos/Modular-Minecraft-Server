FROM openjdk:11.0.14.1-oraclelinux8

# Install build dependencies
RUN microdnf install git

# ### Run buildtools and save spigot.jar
# Create build directory
RUN mkdir /tmp/BuildTools
WORKDIR /tmp/BuildTools

# Download BuildTools.jar and run it
RUN curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
RUN java -jar BuildTools.jar -o /usr/src/SERVER_DATA/ --rev 1.16.4
# ^ change latest to 1.xx.x for specific versions of spigot

# Cleanup work dir
RUN rm -rf /tmp/BuildTools

# Populate new workdir
WORKDIR /usr/src/SERVER_DATA

ADD config/  ./
ADD plugins/ ./plugins/
ADD worlds/  ./

# Setup user to run the minecraft server and chown it
RUN groupadd --gid 1001 user
RUN useradd --uid 1001 --gid 1001 user
RUN chown -R user:user /usr/src/SERVER_DATA
USER user

# List workdir for easier debugging
RUN ls

# Expose service's ports
EXPOSE 25563/tcp
#EXPOSE 25571/tcp
# ^only needed for rcon support

# Run service on container start
#ENV PWD=/usr/src/SERVER_DATA
ENTRYPOINT java -Xms4G -Xmx4G -jar *.jar

FROM openjdk:20-oraclelinux8

# Create workdir
RUN mkdir /usr/src/Velocity
WORKDIR /usr/src/Velocity

# Copy configuration files to new workdir
ADD config/  ./
ADD plugins/ ./plugins/

# Install Velocity jar
ADD velocity-* ./

# Setup user to run the minecraft server and chown it
RUN groupadd --gid 1001 user
RUN useradd --uid 1001 --gid 1001 user
RUN chown -R user:user /usr/src/Velocity

USER user:user

# Install some plugins
RUN curl -Lo plugins/floodgate-velocity.jar https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/velocity


# Expose service's ports
EXPOSE 25565/tcp
#EXPOSE 25570/tcp
# ^only needed for rcon I belive
#EXPOSE 19132/udp
# ^ For bedrock support

# Run service on container start
#ENV PWD=/usr/src/Velocity
# ^ Pretty sure this is useless due to the WORKDIR specification above
ENTRYPOINT java -jar *.jar

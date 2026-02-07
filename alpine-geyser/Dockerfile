FROM alpine:latest

# Install openjdk and curl
RUN apk add openjdk21 curl

# Create workdir
WORKDIR /srv/

# Copy configuration files to new workdir
ADD config/  ./
ADD extensions/ ./extensions
ADD packs/   ./packs

# Install Geyser jar
RUN curl -Lo Geyser-Standalone.jar https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone

# Setup user to run the minecraft server and chown it
RUN adduser -D --no-create-home user
RUN chown -R user:user /srv/
USER user:user

# Expose service's ports
EXPOSE 19132/udp

# Run service on container start
#ENV PWD=/usr/src/Geyser
# ^ Pretty sure this is useless due to the WORKDIR specification above
ENTRYPOINT java -jar Geyser-Standalone.jar

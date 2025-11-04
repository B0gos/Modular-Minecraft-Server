# Copys new world data from existing docker containers and replaces the old data in the build folder

# Check for correct directory [!]
echop $PWD

# Backup existing build data
echo "Backup Folder:"
echo $PWD + "/backup"
echo "Backing up existing configuration..."
cp -rp ./ backup/

# Remove old World data
echo "Removing old world data"
rm -rf openjdk-paper-hub/worlds/*
rm -rf openjdk-paper-prim/worlds/*
#rm -rf openjdk-paper-legacy/worlds/*

# Copy the new data
echo "Copying new world data for [hub]"
docker cp minecraft-hub-1:/mnt/WORLDATA/. openjdk-paper-hub/worlds

echo "Copying new world data for [prim]"
docker cp minecraft-primary-1:/mnt/WORLDATA/. openjdk-paper-prim/worlds

#echo "Copying new world data for [legacy]"
#docker cp minecraft_legacy_1:/mnt/WORLDATA/. openjdk-paper-legacy/worlds


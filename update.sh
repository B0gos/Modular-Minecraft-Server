# Simple update script using spud to make things faster
# Will only update folders with the openjdk-paper-* names
# Requires Spud a python module

echo "Removing old updaters..."
rm server_update.py
rm -rf spud

echo "Downloading dependancies..."
wget https://raw.githubusercontent.com/OwenCochell/PaperMC-Update/master/server_update.py
git clone https://github.com/exciteabletom/spud.git

echo "Updating papermc..."
dirs=($(find openjdk-paper-* -maxdepth 0 -type d))
for dir in "${dirs[@]}"; do
  echo $PWD
  python3 server_update.py $dir
done

echo "Installing spud"
cd spud
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install -r requirements.txt
python3 setup.py install
cd ..

echo "Updating plugins..."
dirs=($(find openjdk-paper-* -maxdepth 0 -type d))
for dir in "${dirs[@]}"; do
  cd "$dir"/plugins
  echo $PWD
  python3 -m spud -n update
done
deactivate

echo "DONE"

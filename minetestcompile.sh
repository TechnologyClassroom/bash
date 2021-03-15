# Compile Minetest with MineClone 2 and other subgames

# WIP targeting Ubuntu 18.04/Trisquel 9.

# Dependencies
sudo apt update
sudo apt install -y g++ build-essential make libc6-dev cmake libpng-dev libjpeg-dev libxxf86vm-dev libgl1-mesa-dev libsqlite3-dev libogg-dev libvorbis-dev libopenal-dev libcurl4-gnutls-dev libfreetype6-dev zlib1g-dev libgmp-dev libjsoncpp-dev unzip

sudo apt install -y git libirrlicht-dev libgettextpo0 libfreetype6-dev cmake libbz2-dev libxxf86vm-dev libcurl4-openssl-dev libluajit-5.1-dev liblua5.1-0-dev libleveldb-dev

# Trisquel 8 does not have libjpeg62-turbo-dev. Installing libjpeg-turbo8-dev instead.
# TODO if trisquel 8 do turbo8.  If trisquel 9 do jpeg62-turbo.
sudo apt install -y libjpeg-turbo8-dev 2>/dev/null
sudo apt install -y libjpeg62-turbo-dev 2>/dev/null

# Removed libpng12-dev in favor of libpng-dev.

cd $HOME

# Clone minetest
git clone https://github.com/minetest/minetest.git

# BEGIN SUBGAMES SECTION
# Download subgames.
cd minetest/games
git clone https://github.com/minetest/minetest_game.git
# Remove tnt
rm -fr minetest_game/mods/tnt
# MineClone 2
wget https://git.minetest.land/MineClone2/MineClone2/archive/0.71.0.zip
unzip 0.71.0.zip
rm 0.71.0.zip
# Technic
cp -a minetest_game minetest_game_technic
sed -i 's/name = Minetest Game/name = Minetest Game Technic/g' minetest_game_technic/game.conf
cd minetest_game_technic/mods
git clone https://github.com/minetest-mods/technic
git clone https://github.com/minetest-mods/moreores/
git clone https://gitlab.com/VanessaE/biome_lib
git clone https://gitlab.com/VanessaE/moretrees
git clone https://gitlab.com/VanessaE/basic_materials
git clone https://gitlab.com/VanessaE/pipeworks/
cd ../..
# Dreambuilder
# git clone https://gitlab.com/VanessaE/dreambuilder_game

# Additional optional mods that could be included in subgames.
# git clone https://github.com/Uberi/MineTest-WorldEdit/ # The gui does not work for all inventory systems.
# rm -fr MineTest-WorldEdit/worldedit_gui/
# git clone https://notabug.org/TenPlus1/protector
# https://github.com/FaceDeer/remove_stick

cd ..
# END SUBGAMES SECTION

# Build irrlicht dependency for the client. (Optional if targeting server)
git clone https://github.com/minetest/irrlicht
cd irrlicht/
cmake .
make
cd ..

# Configure Minetest
cmake . -DRUN_IN_PLACE=TRUE -DBUILD_CLIENT=1 -DBUILD_SERVER=1 -DIRRLICHT_INCLUDE_DIR=$HOME/minetest/irrlicht/include
#cmake . -DRUN_IN_PLACE=TRUE -DBUILD_CLIENT=1 -DBUILD_SERVER=1 -DIRRLICHT_INCLUDE_DIR=$HOME/minetest/irrlicht/include -DIRRLICHT_LIBRARY=$HOME/minetest/irrlicht/lib/Linux/libIrrlicht.so
sed -i "s|IRRLICHT_LIBRARY:FILEPATH=/usr/lib/x86_64-linux-gnu/libIrrlicht.so|IRRLICHT_LIBRARY:FILEPATH=$HOME/minetest/irrlicht/lib/Linux/libIrrlicht.so|g" CMakeCache.txt

# Only make the server (Does not require irrlicht)
#cmake . -DRUN_IN_PLACE=TRUE -DBUILD_CLIENT=1 -DBUILD_SERVER=1 -DIRRLICHT_INCLUDE_DIR=/home/user/minetest/irrlicht/include

# Build Minetest
make -j$(nproc)

# Install Minetest (Optional)
# sudo make install

# Run Minetest
./bin/minetest

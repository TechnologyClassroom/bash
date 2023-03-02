# Compile Minetest with MineClone 2 and other subgames

# Tested with Minetest 5.7-dev and Ubuntu 20.04/Trisquel 10.

# Dependencies
sudo apt update
sudo apt install g++ make libc6-dev cmake libpng-dev libjpeg-dev libxi-dev libgl1-mesa-dev libsqlite3-dev libogg-dev libvorbis-dev libopenal-dev libcurl4-gnutls-dev libfreetype6-dev zlib1g-dev libgmp-dev libjsoncpp-dev libzstd-dev libluajit-5.1-dev git libncurses-dev

cd $HOME

# Clone minetest
git clone https://github.com/minetest/minetest.git

# BEGIN SUBGAMES SECTION

# Download subgames.
cd minetest/
git clone https://github.com/minetest/minetest_game.git games/minetest_game

# Modify mods

# Add WorldEdit
git clone https://github.com/Uberi/MineTest-WorldEdit/ games/minetest_game/mods/WorldEdit
# The gui does not work for all inventory systems.
rm -fr games/minetest_game/mods/WorldEdit/worldedit_gui/

# Add protector
git clone https://notabug.org/TenPlus1/protector games/minetest_game/mods/protector

# Add xban2
git clone https://github.com/minetest-mods/xban2/ games/minetest_game/mods/xban2

# Remove tnt
rm -fr games/minetest_game/mods/tnt

# MineClone 2
git clone https://git.minetest.land/MineClone2/MineClone2 games/MineClone2

# Technic
cp -a games/minetest_game games/minetest_game_technic
sed -i 's/name = Minetest Game/name = Minetest Game Technic/g' minetest_game_technic/game.conf
cd games/minetest_game_technic/mods
git clone https://github.com/minetest-mods/technic
git clone https://github.com/minetest-mods/moreores/
git clone https://gitlab.com/VanessaE/biome_lib
git clone https://gitlab.com/VanessaE/moretrees
git clone https://gitlab.com/VanessaE/basic_materials
git clone https://gitlab.com/VanessaE/pipeworks/
cd ../../..

# Dreambuilder
git clone https://gitlab.com/VanessaE/dreambuilder_game games/dreambuilder

# END SUBGAMES SECTION

# Build irrlicht dependency for the client. (Optional if targeting server)
git clone https://github.com/minetest/irrlicht lib/irrlichtmt
cd lib/irrlichtmt
cmake .
make
cd ../..

# Configure Minetest
cmake . -DRUN_IN_PLACE=FALSE -DBUILD_CLIENT=1 -DBUILD_SERVER=1

# Only make minetestserver (Does not require irrlicht)
#cmake . -DRUN_IN_PLACE=FALSE -DBUILD_CLIENT=0 -DBUILD_SERVER=1

# Build Minetest
make -j$(nproc)

# Install Minetest (Optional)
# sudo make install

# Run Minetest
./bin/minetest

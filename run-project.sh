#!/bin/bash
echo "--------------------------------------"
echo " 🐙 Docker compose ..."
echo "--------------------------------------"
docker-compose -f docker-compose.yml up -d --build

echo "--------------------------------------"
echo " 📦 Install prerequisites"
echo "--------------------------------------"
docker exec -it nodejs bash -c "make install"

echo "--------------------------------------"
echo " 🐳 Restarting Node container ..."
echo "--------------------------------------"
docker restart nodejs
# Not the best approach but pending until I could research for the better solution

echo "--------------------------------------"
echo " 🟢 Ready to go!!"
echo "--------------------------------------"
  
#!/bin/bash
echo "--------------------------------------"
echo " 🐙 Docker compose ..."
echo "--------------------------------------"
docker-compose -f docker-compose.yml up -d --build

echo "--------------------------------------"
echo " 📦 Install prerequisites"
echo "--------------------------------------"
docker exec -it node01 bash -c "make install"
docker exec -it node02 bash -c "make install"

echo "--------------------------------------"
echo " 🐳 Restarting Node container ..."
echo "--------------------------------------"
docker restart node01 node02
# Not the best approach but pending until I could research for the better solution

echo "--------------------------------------"
echo " 🟢 Ready to go!!"
echo "--------------------------------------"
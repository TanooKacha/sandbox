  
#!/bin/bash
echo "--------------------------------------"
echo " 🐙 Docker compose ..."
echo "--------------------------------------"
docker-compose -f docker-compose.yml up -d --build

echo "--------------------------------------"
echo " 📦 Install prerequisites"
echo "--------------------------------------"
docker exec -it node00 bash -c "make install"
docker exec -it node01 bash -c "make install"
docker exec -it node02 bash -c "make install"
docker exec -it node03 bash -c "make install"

echo "--------------------------------------"
echo " 🐳 Restarting Node container ..."
echo "--------------------------------------"
docker restart node00 node01 node02 node03
# Not the best approach but pending until I could research for the better solution

echo "--------------------------------------"
echo " 🟢 Ready to go!!"
echo "--------------------------------------"
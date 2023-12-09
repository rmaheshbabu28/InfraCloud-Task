git clone git@github.com:rmaheshbabu28/InfraCloud-Task.git --> my repo
git clone --single-branch --branch update-assignment https://github.com/infracloudio/csvserver.git (copied code from cloud infra)

docker pull infracloudio/csvserver:latest
docker pull prom/prometheus:v2.22.0  
docker images 

docker run -d --name infracloud-assign infracloudio/csvserver:latest

docker ps 
docker ps -a

docker logs 157bcedb3741  ( 2023/12/09 15:15:13 error while reading the file "/csvserver/v": open /csvserver/inputdata: no such file or directory)


create script to generate inputdata file 


./gencsv.sh

./gencsv.sh 2 8

docker cp inputFile infracloud-assign:/csvserver/inputdata

docker logs 157bcedb3741 - 2023/12/09 15:15:13 error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory

docker rm 157bcedb3741 ( delete existing container )

docker run -d --name infracloud-assign -v "$(pwd)/inputFile:/csvserver/inputdata" infracloudio/csvserver:latest

container started running 

docker exec infracloud-assign netstat -tulpn | grep LISTEN ( port numbers) 
   tcp6       0      0 :::9300                 :::*                    LISTEN      1/csvserver

docker rm -f 1362127251af delete existing container 

docker run -d --name infracloud-assign -v "$(pwd)/inputFile:/csvserver/inputdata" -e CSVSERVER_BORDER=Orange -p 9393:9300 infracloudio/csvserver:latest

application started showing on localhost:9393 

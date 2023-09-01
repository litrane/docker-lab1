docker build -t theta  .   
docker compose -f docker-compose-mainchain.yml up -d
docker compose -f docker-compose-subchain.yml up -d 

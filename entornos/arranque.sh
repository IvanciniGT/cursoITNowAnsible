sudo rm -rf ~/environment/claves
mkdir ~/environment/claves
chmod 777 -R ~/environment/claves


#dentro de la carpeta entornos
cd ~/environment/entornos
docker-compose down -v
docker-compose up -d
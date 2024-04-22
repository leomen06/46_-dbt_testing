#!/bin/bash/
#program for access to posgres psql bash shell
#author: LLM mendezleonardom@gmail.com

container_name=""
start_container=""
opt_y_n=""
opt_os=0
pass=""
clear
echo "-----------------------------------------------------------------------"
echo "*********WELCOME TO POSTGRES CONTAINER CONNECTION FOR TESTING**********"
echo -e "-----------------------------------------------------------------------\n"

echo -e "NOTE: CRT+d --> Exit to Postgres\n"
read -n1 -p "Need to run a NEW postgres container (y/n):" opt_y_n
echo -e "\n"

if [ $opt_y_n == "n" ]; then
        read -p "Enter the container name: " container_name
        read -n1 -p "Start the container (y/n): " start_container
        echo -e "\n"
        if [ $start_container == "y" ]; then 
                docker start $container_name
                echo -e "starting container ..."
                sleep 5
                docker exec -it $container_name psql -U $container_name --password
        else
                docker exec -it $container_name psql -U $container_name --password
        fi
else
        echo -e "\n1. For Linux/MacOS"
        echo -e "\n2. For Windows\n"
        read -n1 -p "Option (1/2): " opt_os
        echo -e "\n"
        read -p "Enter the container name: " container_name
        read -p "Set your password: " pass
        if [ $opt_os == 1 ]; then
            sudo docker run -d --name=$container_name -p 5432:5432 -v postgres-volume:/var/lib/postgresql/data -e POSTGRES_PASSWORD=$pass postgres
            echo "Creating $container_name container - WSL/MacOS ..."
        else
            docker run -d --name=$container_name -p 5432:5432 -v postgres-volume:/var/lib/postgresql/data -e POSTGRES_PASSWORD=$pass postgres
            echo "Creating $container_name container - Windows ..."
        fi
fi
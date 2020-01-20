# Ghost_blog
internal blog setup consisting of a Ghost Blog and MySQL service using volumes for persistent storage.
Create a docker-compose.yml file in the root directory.
vi docker-compose.yml
Add the following contents to it:
 version: "3"
 services:
   ghost:
     image: ghost:1-alpine
     container_name: ghost-blog
     restart: always
     ports:
     - 80:2368
     environment:
       database__client: mysql
       database__connection__host: mysql
       database__connection__user: root
       database__connection__password: P4sSw0rd0!
       database__connection__database: ghost
     volumes:
       - ghost-volume:/var/lib/ghost
     depends_on:
       - mysql

   mysql:
     image: mysql:5.7
     container_name: ghost-db
     restart: always
     environment:
       MYSQL_ROOT_PASSWORD: P4sSw0rd0!
     volumes:
       - mysql-volume:/var/lib/mysql

 volumes:
   ghost-volume:
   mysql-volume:
   
   Install Docker, docker-compose and terraform on root directory
   
   Run docker-compose up -d to start the ghost container
   
   sudo apt install mysql-client-core-5.7 to install mysql on root directory
   
   sudo docker logs container name/ID to generate mysql password
   
   sudo docker exec -it image name/ID mysql -uroot -p; enter generated password to login to mysql container server
   
   ALTER USER 'root'@'localhost' IDENTIFIED BY 'NewPassword'; (used to change password)
   
   GRANT ALL PRIVILEGES ON *.* to root@'%' IDENTIFIED BY 'root'; (used to grant access to root)
   
   select * from mysql.user;
   
   SELECT User, Host, authentication_string FROM mysql.user;
   
   SHOW GRANTS FOR 'root'@'localhost';
   
   Add required port number to security group
   
   Open browser: http://publicipaddress:portnumber
   


   

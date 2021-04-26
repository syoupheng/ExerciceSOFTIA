# ExerciceSOFTIA

## Introduction

see SOFTIA-EXEC-CANDIDAT.pdf.

## I) My setup

I am working on ***macOS BigSur***.

Requirements : ***Apache Server, PHP, MySQL***

I used PHPmyadmin to create my database but you can use any other application compatible with MySQL.

## II) How to configure Apache

To check if Apache is working open your web browser and type http://localhost

You can change the port for apache in the **/etc/apache2/httpd.conf** file, by default it is usually 80.

To start/stop Apache you can run the commands :

`sudo apachectl start
sudo apachectl stop 
sudo apachectl restart`

## III) How to configure PHP

To enable PHP in Apache you need to open httpd.conf and uncomment the following line:

`LoadModule php7_module libexec/apache2/libphp7.so`

**Don't forget to restart Apache after the modification.**

## IV) How to configure MySQL

In order to use MySQL in the terminal (on Mac) type the following command :

`echo 'export PATH=/usr/local/mysql/bin:$PATH' >> ~/.bash_profile`

Then type `. ./bash_profile` to reload.

To connect to MySQL in the terminal type : `mysql -u root -p`

## V) How to use PHP whith MySQL

I used ***MySQLi*** in order to use PHP with MySQL. On Mac, MySQLi is already included with PHP, you just have to create a copy of **/etc/php.ini.default** with the following command:

`sudo cp php.ini.default php.ini`

Then you have to uncomment the line about mySQLi in php.ini:

`extension=mysqli`

## VI) How to use my application

First of all, you will need to create the database using the FormationPlus_db.sql file. Then you will have to modify the **config.php** file with your servername, username and password for MySQL and the name of the database.

To launch this project you have to place the directory ExerciceSOFTIA/ in the document root of Apache which is by default **/Library/WebServer/Documents/** on Mac but you can change it in httpd.conf. Then type **http://localhost:80/ExerciceSOFTIA/Form_p1.php** in your browser if your port number for apache is 80. This should open the first page of the form. Then choose a student and press Confirm to go to the second page. You should see the convention of the student and the message in the text area. Click on Envoyer to add the data in the attestation table in your database.


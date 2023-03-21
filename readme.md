Install XAMPP, open the app, and start apache and msql.

on windows put your git repo in 'C:\xampp\htdocs\...', or whatever your xampp install is.

the site is located at 'http://localhost/db340proj/page.php'

if you do not need the default xampp page, replace the /xampp/index.php's call to header() with this -> header('Location: '.$uri.'/db340proj/page.php');
then you can just visit 'http://localhost/' to get to the site.

you can create a new database in the mysql admin panel, from XAMPP. There is a default database called 'test', or you can create a new one. Import the import.sql file into the database, then you can import sampledata1.sql.

i named my db restaurant-test-1, if you use a different name change the $db variable in db_connect.php
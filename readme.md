Install XAMPP, open the app, and start apache and msql.

on windows put your git repo in 'C:\xampp\htdocs\...', or whatever your xampp install is.

the site is located at 'http://localhost/db340proj/page.php'

if you do not need the default xampp page, replace the /xampp/index.php's call to header() with this -> header('Location: '.$uri.'/db340proj/page.php');
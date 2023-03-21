<html>

<head>
    <title> Databases Final Project </title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="row">
        <div class="column">
            <!-- left column -->
            <h1> Databases Final Project </h1>
            <textarea name="query" rows="30" cols="60" placeholder="Enter your query here"></textarea>
            <br><br>
            <!-- left column buttons: send query, load predefined query 1-5 -->
            <form action="page.php" method="post">
                <input type="submit" name="submit" value="Submit">
            </form>
            <form action="page.php" method="post">
                <input type="submit" name="submit" value="Predefined Query 1">
            </form>
            <form action="page.php" method="post">
                <input type="submit" name="submit" value="Predefined Query 2">
            </form>
            <form action="page.php" method="post">
                <input type="submit" name="submit" value="Predefined Query 3">
            </form>
            <form action="page.php" method="post">
                <input type="submit" name="submit" value="Predefined Query 4">
            </form>
            <form action="page.php" method="post">
                <input type="submit" name="submit" value="Predefined Query 5">
            </form>
        </div>
        <div class="column">
            <!-- right column -->
            <h2> Query Results </h2>
            <p name=result><p>
            <?php
                include 'db_connection.php';

                $conn = OpenCon();

                if(array_key_exists('submit',$_POST)){
                    if ($result->num_rows > 0) {
                        // output data of each row
                        while($row = $result->fetch_assoc()) {
                            echo "name: " . $row["name"]. " - amount: " . $row["SUM(amount)"]. "<br>";
                        }
                    } else {
                        echo "0 results";
                    }    
                }

                if (array_key_exists('query',$_POST)){
                    $textbox = $_POST['query'];
                }

                $result = $conn->query($textbox);

                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                } else {

                #echo "Connected Successfully<br><br>";
                }

                $sql = "SELECT name, SUM(amount) FROM Ingredient GROUP BY name";

                $result = $conn->query($sql);
                
                if ($result->num_rows > 0) {
                    // output data of each row
                    while($row = $result->fetch_assoc()) {
                        echo "name: " . $row["name"]. " - amount: " . $row["SUM(amount)"]. "<br>";
                    }
                } else {
                    echo "0 results";
                }    

                CloseCon($conn);
            ?>
        </div>
    </div>
</body>

</html>
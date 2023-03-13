<html>

<head>
    <title> Test </title>
</head>

<body>
    <p>Test Query</p>

    <?php echo "hello world<br><br>";?>

    <?php
    include 'db_connection.php';

    $conn = OpenCon();

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
    echo "Connected Successfully<br><br>";
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
</body>

</html>
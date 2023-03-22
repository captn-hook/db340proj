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
            <form method="post">
                <textarea name="query" id="query" rows="30" cols="60" placeholder= "Enter query..."></textarea>
                <br><br>
                <!-- left column buttons: send query, load predefined query 1-5 -->
                <input type='submit' name='0' value='Send Query'> 
                <input type='submit' name='1' value='Query 1'>
                <input type='submit' name='2' value='Query 2'>
                <input type='submit' name='3' value='Query 3'>
                <input type='submit' name='4' value='Query 4'>
                <input type='submit' name='5' value='Query 5'>
            </form>
        </div>
        <div class="column" style="flex-shrink: 80%">
            <!-- right column -->
            <h2> Query Results </h2>
            <p name="result" id="result"><p>
            <?php
                include 'db_connection.php';
                include 'output_query.php';

                if ($_POST) // If form was submited...
                {
                    if (isset($_POST['0'])) {
                        # Main button
                        $text = $_POST["query"];
                        exec_sql_query($text);
                    } else {
                        # load query from number
                        $str = implode(" ", $_POST);
                        #get number from end of string
                        $n = substr($str, -1);
                        $n = intval($n);
                        loadQuery($n);
                    }
                }

                function loadQuery($n) {
                    $queries = fopen("queries.sql", "r");
                    #query == line number
                    $myFile = "queries.sql";
                    //file in to an array
                    $lines = file($myFile);
                    $sql = $lines[$n - 1];
                    fclose($queries);
                    exec_sql_query($sql);                    
                }

                function exec_sql_query($sql) {
                    $conn = OpenCon();

                    if ($conn->connect_error) {
                        die("Connection failed: " . $conn->connect_error);
                    } else {
                        try {
                            $result = $conn->query($sql);
                            Output($result);               
                        } catch (Exception $e) {
                            echo "Error in query";
                        }
                    }   

                    CloseCon($conn);   
                }
            ?>
        </div>
    </div>
</body>

</html>
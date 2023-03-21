<?php

function output($result)
{
    if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
            # iterate over each row and print table
            echo "<table>";
            foreach ($row as $key => $value) {
                echo "<tr>";
                echo "<td>" . $key . "</td>";
                echo "<td>" . $value . "</td>";
                echo "</tr>";
            }
            echo "</table>";
        }
    } else {
        echo "0 results";
    }
}
?>
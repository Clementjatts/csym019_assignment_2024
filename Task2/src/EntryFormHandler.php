<?php
$servername = "your_servername";
$username = "your_username";
$password = "your_password";
$dbname = "your_database_name";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$action = $_POST['action'];

if ($_POST['formType'] == 'teamForm') {
    $club = $_POST['club'];
    $city = $_POST['city'];
    $manager = $_POST['manager'];
    $founded = $_POST['founded'];
    $stadium = $_POST['stadium'];

    if ($action == 'add') {
        $sql = "INSERT INTO clubs (team_name, team_city, manager_name, founded_year, stadium_name) VALUES ('$club', '$city', '$manager', $founded, '$stadium')";
    } elseif ($action == 'update') {
        $club_id = $_POST['club_id'];
        $sql = "UPDATE clubs SET team_name='$club', team_city='$city', manager_name='$manager', founded_year=$founded, stadium_name='$stadium' WHERE club_id=$club_id";
    } elseif ($action == 'delete') {
        $club_id = $_POST['club_id'];
        $sql = "DELETE FROM clubs WHERE club_id=$club_id";
    }
} elseif ($_POST['formType'] == 'matchForm') {
    $date = $_POST['date'];
    $home_team = $_POST['home_team'];
    $home_score = $_POST['home_score'];
    $away_team = $_POST['away_team'];
    $away_score = $_POST['away_score'];

    if ($action == 'add') {
        $sql = "INSERT INTO matches (date, home_team, home_score, away_team, away_score) VALUES ('$date', $home_team, $home_score, $away_team, $away_score)";
    } elseif ($action == 'update') {
        $match_id = $_POST['match_id'];
        $sql = "UPDATE matches SET date='$date', home_team=$home_team, home_score=$home_score, away_team=$away_team, away_score=$away_score WHERE match_id=$match_id";
    } elseif ($action == 'delete') {
        $match_id = $_POST['match_id'];
        $sql = "DELETE FROM matches WHERE match_id=$match_id";
    }
}

if ($conn->query($sql) === TRUE) {
    echo "Record successfully modified";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
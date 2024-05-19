<?php
include 'db.php';

if (isset($_POST['teams'])) {
    $teams = $_POST['teams'];
    $team_list = implode("','", $teams);
    
    // Fetch team details including club_id
    $sql = "SELECT club_id, team_name AS name, team_city AS city, manager_name AS manager, founded_year AS founded, stadium_name AS stadium 
            FROM clubs 
            WHERE team_name IN ('$team_list')";
    $stmt = $pdo->query($sql);
    
    $teams_data = array();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        // Calculate additional fields
        $row['wins'] = 0;
        $row['losses'] = 0;
        $row['drawn'] = 0;
        $row['remaining'] = 0;
        $teams_data[] = $row;
    }

    // Fetch match details and calculate stats
    $matches_sql = "SELECT 
                        home_team,
                        away_team,
                        home_score,
                        away_score
                    FROM matches 
                    WHERE home_team IN (SELECT club_id FROM clubs WHERE team_name IN ('$team_list'))
                    OR away_team IN (SELECT club_id FROM clubs WHERE team_name IN ('$team_list'))";
    $matches_stmt = $pdo->query($matches_sql);

    while ($row = $matches_stmt->fetch(PDO::FETCH_ASSOC)) {
        foreach ($teams_data as &$team) {
            if ($row['home_team'] == $team['club_id'] || $row['away_team'] == $team['club_id']) {
                if ($row['home_score'] > $row['away_score']) {
                    if ($row['home_team'] == $team['club_id']) {
                        $team['wins']++;
                    } else {
                        $team['losses']++;
                    }
                } elseif ($row['home_score'] < $row['away_score']) {
                    if ($row['away_team'] == $team['club_id']) {
                        $team['wins']++;
                    } else {
                        $team['losses']++;
                    }
                } else {
                    $team['drawn']++;
                }
                $team['remaining'] = 38 - ($team['wins'] + $team['losses'] + $team['drawn']); // Assuming 38 matches in a season
            }
        }
    }

    $report_data = array(
        "teams" => $teams_data
    );

    // Save the report data to a JSON file
    file_put_contents('report_data.json', json_encode($report_data, JSON_PRETTY_PRINT));

    // Redirect to Report.html
    header("Location: Report.html");
    exit();
} else {
    echo "No teams selected";
}

$pdo = null;
?>
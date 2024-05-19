<?php
include 'db.php';

try {
    $sql = "
        SELECT
            clubs.team_name, 
            COALESCE(SUM(CASE WHEN matches.home_team = clubs.club_id THEN 1 ELSE 0 END + CASE WHEN matches.away_team = clubs.club_id THEN 1 ELSE 0 END), 0) AS played,
            COALESCE(SUM(CASE WHEN matches.home_team = clubs.club_id AND matches.home_score > matches.away_score THEN 1 ELSE 0 END + CASE WHEN matches.away_team = clubs.club_id AND matches.away_score > matches.home_score THEN 1 ELSE 0 END), 0) AS won,
            COALESCE(SUM(CASE WHEN matches.home_team = clubs.club_id AND matches.home_score = matches.away_score THEN 1 ELSE 0 END + CASE WHEN matches.away_team = clubs.club_id AND matches.home_score = matches.away_score THEN 1 ELSE 0 END), 0) AS drawn,
            COALESCE(SUM(CASE WHEN matches.home_team = clubs.club_id AND matches.home_score < matches.away_score THEN 1 ELSE 0 END + CASE WHEN matches.away_team = clubs.club_id AND matches.away_score < matches.home_score THEN 1 ELSE 0 END), 0) AS lost,
            COALESCE(SUM(CASE WHEN matches.home_team = clubs.club_id THEN matches.home_score ELSE 0 END + CASE WHEN matches.away_team = clubs.club_id THEN matches.away_score ELSE 0 END), 0) AS goals_for,
            COALESCE(SUM(CASE WHEN matches.home_team = clubs.club_id THEN matches.away_score ELSE 0 END + CASE WHEN matches.away_team = clubs.club_id THEN matches.home_score ELSE 0 END), 0) AS goals_against,
            COALESCE(SUM(CASE WHEN matches.home_team = clubs.club_id THEN matches.home_score ELSE 0 END + CASE WHEN matches.away_team = clubs.club_id THEN matches.away_score ELSE 0 END - CASE WHEN matches.home_team = clubs.club_id THEN matches.away_score ELSE 0 END - CASE WHEN matches.away_team = clubs.club_id THEN matches.home_score ELSE 0 END), 0) AS goal_difference,
            COALESCE(SUM(CASE WHEN matches.home_team = clubs.club_id AND matches.home_score > matches.away_score THEN 3 ELSE 0 END + CASE WHEN matches.away_team = clubs.club_id AND matches.away_score > matches.home_score THEN 3 ELSE 0 END + CASE WHEN matches.home_team = clubs.club_id AND matches.home_score = matches.away_score THEN 1 ELSE 0 END + CASE WHEN matches.away_team = clubs.club_id AND matches.home_score = matches.away_score THEN 1 ELSE 0 END), 0) AS points
        FROM clubs
        LEFT JOIN matches ON clubs.club_id = matches.home_team OR clubs.club_id = matches.away_team
        GROUP BY clubs.team_name
        ORDER BY points DESC, goal_difference DESC, goals_for DESC;
    ";

    $result = $pdo->query($sql);

    if ($result->rowCount() > 0) {
        $position = 1;
        while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
            echo "<tr>
                    <td><input type='checkbox' name='teams[]' value='" . $row['team_name'] . "'></td>
                    <td>" . $position . "</td>
                    <td><img src='logos/" . $row['team_name'] . ".png' alt='" . $row['team_name'] . "' style='width: 20px; height: 20px;'> " . $row['team_name'] . "</td>
                    <td>" . $row['played'] . "</td>
                    <td>" . $row['won'] . "</td>
                    <td>" . $row['drawn'] . "</td>
                    <td>" . $row['lost'] . "</td>
                    <td>" . $row['goals_for'] . "</td>
                    <td>" . $row['goals_against'] . "</td>
                    <td>" . $row['goal_difference'] . "</td>
                    <td>" . $row['points'] . "</td>
                  </tr>";
            $position++;
        }
    } else {
        echo "<tr><td colspan='11'>No teams found</td></tr>";
    }
} catch (PDOException $e) {
    echo 'Query failed: ' . $e->getMessage();
}
?>
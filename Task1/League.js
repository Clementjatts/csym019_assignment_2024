document.addEventListener("DOMContentLoaded", function () {
    const updateInterval = 60000; // Update every minute
    let currentPage = 1;
    const scorersPerPage = 10;

    const previousButton = document.getElementById("previousButton");
    const nextButton = document.getElementById("nextButton");

    if (previousButton) {
        previousButton.addEventListener("click", previousPage);
    }

    if (nextButton) {
        nextButton.addEventListener("click", nextPage);
    }

    function initTeam(teamName) {
        return {
            team: teamName,
            played: 0,
            won: 0,
            drawn: 0,
            lost: 0,
            goalsFor: 0,
            goalsAgainst: 0,
            points: 0,
            form: [],
        };
    }

    function updateTeamRecord(team, result) {
        team.form.unshift(result);
        if (team.form.length > 6) team.form.pop();

        switch (result) {
            case "W":
                team.won++;
                team.points += 3;
                break;
            case "D":
                team.drawn++;
                team.points += 1;
                break;
            case "L":
                team.lost++;
                break;
        }
    }

    function computeStandings(matchResults) {
        const standings = {};
        matchResults.forEach((match) => {
            const { homeTeam, awayTeam, homeScore, awayScore } = match;

            if (!standings[homeTeam]) standings[homeTeam] = initTeam(homeTeam);
            if (!standings[awayTeam]) standings[awayTeam] = initTeam(awayTeam);

            standings[homeTeam].played++;
            standings[awayTeam].played++;

            standings[homeTeam].goalsFor += homeScore;
            standings[awayTeam].goalsFor += awayScore;
            standings[homeTeam].goalsAgainst += awayScore;
            standings[awayTeam].goalsAgainst += homeScore;

            if (homeScore > awayScore) {
                updateTeamRecord(standings[homeTeam], "W");
                updateTeamRecord(standings[awayTeam], "L");
            } else if (homeScore < awayScore) {
                updateTeamRecord(standings[awayTeam], "W");
                updateTeamRecord(standings[homeTeam], "L");
            } else {
                updateTeamRecord(standings[homeTeam], "D");
                updateTeamRecord(standings[awayTeam], "D");
            }
        });

        Object.values(standings).forEach((team) => {
            team.goalDifference = team.goalsFor - team.goalsAgainst;
        });

        return Object.values(standings).sort(
            (a, b) =>
                b.points - a.points ||
                b.goalDifference - a.goalDifference ||
                b.goalsFor - a.goalsFor
        );
    }

    async function fetchData() {
        try {
            const response = await fetch("League.json");
            const data = await response.json();
            const matchResults = data.matchResults;

            if (document.getElementById("leagueTable")) {
                const standings = computeStandings(matchResults);
                updateLeagueTable(standings);
            }

            // Correctly calling extractScorers and using its result
            if (document.getElementById("topScorersTable")) {
                const allScorers = extractScorers(matchResults);
                updateTopScorers(allScorers);
            }
        } catch (error) {
            console.error("Error fetching data:", error);
        }
    }

    function updateLeagueTable(standings) {
        const leagueTable = document.getElementById("leagueTable");
        if (leagueTable) {
            const table = document.createElement("table");
            table.setAttribute("class", "league-table");

            // Create the header row
            const thead = table.createTHead();
            const headerRow = thead.insertRow();
            const headers = [
                "Position",
                "Team",
                "Played",
                "Won",
                "Drawn",
                "Lost",
                "For",
                "Against",
                "GD",
                "Points",
                "Form",
            ];
            headers.forEach((text) => {
                const headerCell = document.createElement("th");
                headerCell.textContent = text;
                headerRow.appendChild(headerCell);
            });

            // Create the body of the table
            const tbody = table.createTBody();
            standings.forEach((team, index) => {
                const row = tbody.insertRow();

                const positionCell = row.insertCell();
                positionCell.textContent = index + 1;

                const teamCell = row.insertCell();
                teamCell.innerHTML = `<div class="team-cell"><img src="Logos/${team.team}.png" alt="${team.team}" class="team-logo">${team.team}</div>`;

                const playedCell = row.insertCell();
                playedCell.textContent = team.played;

                const wonCell = row.insertCell();
                wonCell.textContent = team.won;

                const drawnCell = row.insertCell();
                drawnCell.textContent = team.drawn;

                const lostCell = row.insertCell();
                lostCell.textContent = team.lost;

                const goalsForCell = row.insertCell();
                goalsForCell.textContent = team.goalsFor;

                const goalsAgainstCell = row.insertCell();
                goalsAgainstCell.textContent = team.goalsAgainst;

                const goalDiffCell = row.insertCell();
                goalDiffCell.textContent = team.goalDifference;

                const pointsCell = row.insertCell();
                pointsCell.textContent = team.points;

                const formCell = row.insertCell();
                formCell.innerHTML = generateFormIcons(team.form);
            });

            // Clear previous contents and append the new table
            leagueTable.innerHTML = "";
            leagueTable.appendChild(table);
        } else {
            console.log("League table container not found.");
        }
    }

    function generateFormIcons(form) {
        return (
            `<div class="form-icons">` +
            form
                .map((result, index) => {
                    let className = index === 5 ? "icon-last" : "icon";
                    switch (result) {
                        case "W":
                            return `<img src="Logos/Win.png" alt="Win" class="${className}">`;
                        case "D":
                            return `<img src="Logos/Draw.png" alt="Draw" class="${className}">`;
                        case "L":
                            return `<img src="Logos/Loss.png" alt="Loss" class="${className}">`;
                        default:
                            return "";
                    }
                })
                .join("") +
            `</div>`
        );
    }

    function extractScorers(matchResults) {
        let scorers = {};
        matchResults.forEach((match) => {
            // Process Home Scorers
            if (match.scorerHome) {
                match.scorerHome.forEach((scorer) => {
                    if (!scorer.name.includes("(OG)")) {
                        // Check if it's not an own goal
                        let playerName = scorer.name;
                        let goals = scorer.goals;
                        if (scorers[playerName]) {
                            scorers[playerName].goals += goals;
                        } else {
                            scorers[playerName] = { playerName, team: match.homeTeam, goals };
                        }
                    }
                });
            }

            // Process Away Scorers
            if (match.scorerAway) {
                match.scorerAway.forEach((scorer) => {
                    if (!scorer.name.includes("(OG)")) {
                        // Check if it's not an own goal
                        let playerName = scorer.name;
                        let goals = scorer.goals;
                        if (scorers[playerName]) {
                            scorers[playerName].goals += goals;
                        } else {
                            scorers[playerName] = { playerName, team: match.awayTeam, goals };
                        }
                    }
                });
            }
        });

        return Object.values(scorers).sort((a, b) => b.goals - a.goals);
    }

    function updateTopScorers(scorers) {
        const topScorersTable = document.getElementById("topScorersTable");
        if (topScorersTable) {
            const table = document.createElement("table");
            table.setAttribute("class", "scorers-table");

            const startIndex = (currentPage - 1) * scorersPerPage;
            const endIndex = startIndex + scorersPerPage;
            const paginatedScorers = scorers.slice(startIndex, endIndex);

            // Rest of the function...
            const thead = table.createTHead();
            const headerRow = thead.insertRow();
            ["Rank", "Player", "Team", "Goals"].forEach((text) => {
                const headerCell = document.createElement("th");
                headerCell.textContent = text;
                headerRow.appendChild(headerCell);
            });

            const tbody = table.createTBody();
            paginatedScorers.forEach((scorer, index) => {
                const row = tbody.insertRow();

                row.insertCell().textContent = startIndex + index + 1;
                row.insertCell().textContent = scorer.playerName;

                const teamCell = row.insertCell();
                teamCell.innerHTML = `<div class="team-cell"><img src="Logos/${scorer.team}.png" alt="${scorer.team}" class="team-logo">${scorer.team}</div>`;
                row.insertCell().textContent = scorer.goals;
            });

            topScorersTable.innerHTML = "";
            topScorersTable.appendChild(table);
        }
    }

    function nextPage() {
        currentPage++;
        fetchData();
    }

    function previousPage() {
        if (currentPage > 1) {
            currentPage--;
            fetchData();
        }
    }

    fetchData();
    setInterval(fetchData, updateInterval);
});
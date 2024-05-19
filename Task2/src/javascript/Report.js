document.addEventListener("DOMContentLoaded", function () {
  try {
    const teamData = JSON.parse(
      document.getElementById("teamData").textContent
    ).teams;
    console.log("Team Data:", teamData); // Log the team data to verify content

    function renderPieChart(data) {
      const ctx = document.getElementById("pieChart").getContext("2d");
      new Chart(ctx, {
        type: "pie",
        data: {
          labels: ["Wins", "Losses", "Drawn", "Remaining"],
          datasets: [
            {
              data: data,
              backgroundColor: ["#4caf50", "#f44336", "#ffeb3b", "#9e9e9e"],
            },
          ],
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
        },
      });
    }

    function renderBarChart(teams) {
      const ctx = document.getElementById("barChart").getContext("2d");
      const labels = ["Wins", "Losses", "Drawn", "Remaining"];
      const datasets = teams.map((team, index) => {
        return {
          label: team.name,
          data: [team.wins, team.losses, team.drawn, team.remaining],
          backgroundColor: `rgba(${Math.floor(
            Math.random() * 255
          )}, ${Math.floor(Math.random() * 255)}, ${Math.floor(
            Math.random() * 255
          )}, 0.7)`,
        };
      });

      new Chart(ctx, {
        type: "bar",
        data: {
          labels: labels,
          datasets: datasets,
        },
        options: {
          responsive: true,
          maintainAspectRatio: false,
          scales: {
            x: { stacked: true },
            y: { stacked: true },
          },
        },
      });
    }

    function displayTeamData(teams) {
      const tbody = document.querySelector(".report-table-container tbody");
      teams.forEach((team) => {
        const row = document.createElement("tr");
        row.innerHTML = `
                    <td>${team.name}</td>
                    <td>${team.city}</td>
                    <td>${team.manager}</td>
                    <td>${team.founded}</td>
                    <td>${team.stadium}</td>
                `;
        tbody.appendChild(row);
      });
    }

    if (teamData.length > 0) {
      displayTeamData(teamData);

      if (teamData.length === 1) {
        const pieData = [
          teamData[0].wins,
          teamData[0].losses,
          teamData[0].drawn,
          teamData[0].remaining,
        ];
        renderPieChart(pieData);
        document.getElementById("barChartSection").style.display = "none";
      } else {
        // Render bar chart for multiple teams
        renderBarChart(teamData);
        document.getElementById("pieChartSection").style.display = "none";
      }
    } else {
      console.error("No team data available");
    }
  } catch (e) {
    console.error("Error parsing team data:", e);
  }
});

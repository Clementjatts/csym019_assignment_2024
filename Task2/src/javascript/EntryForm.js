function handleFormSubmit(formId) {
  const form = document.getElementById(formId);
  const action = form.querySelector('select[name="action"]').value;
  let isValid = true;

  if (formId === "teamForm") {
    const club = form.querySelector('input[name="club"]');
    const city = form.querySelector('input[name="city"]');
    const manager = form.querySelector('input[name="manager"]');
    const founded = form.querySelector('input[name="founded"]');
    const stadium = form.querySelector('input[name="stadium"]');

    if (!/^\d{4}$/.test(founded.value)) {
      founded.classList.add("shake");
      isValid = false;
    }

    if (club.value.trim() === "") {
      club.classList.add("shake");
      isValid = false;
    }
    if (city.value.trim() === "") {
      city.classList.add("shake");
      isValid = false;
    }
    if (manager.value.trim() === "") {
      manager.classList.add("shake");
      isValid = false;
    }
    if (stadium.value.trim() === "") {
      stadium.classList.add("shake");
      isValid = false;
    }
  }

  if (formId === "matchForm") {
    const date = form.querySelector('input[name="date"]');
    const home_team = form.querySelector('input[name="home_team"]');
    const home_score = form.querySelector('input[name="home_score"]');
    const away_team = form.querySelector('input[name="away_team"]');
    const away_score = form.querySelector('input[name="away_score"]');

    if (date.value.trim() === "") {
      date.classList.add("shake");
      isValid = false;
    }
    if (home_team.value.trim() === "") {
      home_team.classList.add("shake");
      isValid = false;
    }
    if (home_score.value.trim() === "") {
      home_score.classList.add("shake");
      isValid = false;
    }
    if (away_team.value.trim() === "") {
      away_team.classList.add("shake");
      isValid = false;
    }
    if (away_score.value.trim() === "") {
      away_score.classList.add("shake");
      isValid = false;
    }
  }

  if (!isValid) {
    setTimeout(() => {
      form.querySelectorAll(".shake").forEach((element) => {
        element.classList.remove("shake");
      });
    }, 500);
    return;
  }

  switch (action) {
    case "add":
      form.action = "entryFormHandler.php?action=add";
      break;
    case "update":
      form.action = "entryFormHandler.php?action=update";
      break;
    case "delete":
      form.action = "entryFormHandler.php?action=delete";
      break;
    default:
      alert("Invalid action selected");
      return;
  }

  form.submit();
}
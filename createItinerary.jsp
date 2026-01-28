<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>🧳 TripMaster - Create</title>

<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="login.css">
<link rel="stylesheet" href="transaction.css">

<style>
    .container { padding: 10px; max-width: 800px; margin: auto; }
    .day-block { background: #f8f9fa; padding: 15px; margin-bottom: 20px; border-left: 5px solid #ffc72c; border-radius:5px; }
    .activity-row { display: flex; gap: 10px; margin-top: 10px; }
    input[type=text], input[type=time], input[type=date] { padding: 8px; border-radius: 4px; border: 1px solid #aaa; }
    .add-btn { background: #000; color: #ffc72c; border: none; padding: 8px 12px; border-radius: 4px; cursor: pointer; font-weight:bold; }
    .remove-btn { background: #dc3545; color: white; border: none; padding: 5px 10px; border-radius: 4px; cursor: pointer; }
    .save-btn { width: 100%; padding: 15px; background-color: #ffc72c; color: black; font-weight: 900; border: none; cursor: pointer; text-transform: uppercase; margin-top: 20px;}
</style>
</head>
<body>

<header class="main-header">
    <h1 class="header-title">🧳 TripMaster</h1>
    <div class="header-content">
        <nav class="main-nav">
            <a href="ActivitiesController?action=listAll">← Back to My Itinerary</a>
        </nav>
    </div>
</header>

<main class="main-content fuel-container">
    <div class="container">
        <h2>Create Itinerary</h2>
        
        <form action="ActivitiesController" method="POST">
            <input type="hidden" name="action" value="create">
            
            <input type="hidden" id="totalDays" name="totalDays" value="1">

            <label><strong>Trip Title:</strong></label><br>
            <input type="text" name="itineraryTitle" placeholder="e.g. Summer Vacation" style="width:100%; margin-bottom: 20px;" required>
            
            <div id="daysContainer">
                <div class="day-block" id="day1">
                    <label><strong>Day 1:</strong></label>
                    <div style="display:flex; gap:10px; margin-bottom:10px;">
                        <input type="text" name="dayTitle_1" placeholder="Day Title (e.g. Arrival)" style="flex-grow:1;" required>
                        <input type="date" name="dayDate_1" required>
                    </div>

                    <div class="activity-row">
                        <input type="time" name="activityTime_1[]" required>
                        <input type="text" name="activityName_1[]" placeholder="Activity..." required>
                        <button type="button" class="remove-btn" onclick="removeActivity(this)">-</button>
                    </div>

                    <br>
                    <button type="button" class="add-btn" onclick="addActivity(1)">+ Add Activity</button>
                </div>
            </div>

            <br>
            <button type="button" class="add-btn" style="background:#007bff; color:white;" onclick="addDay()">+ Add Day</button>
            <br>
            
            <button type="submit" class="save-btn">💾 Save & View Itinerary</button>

        </form>
    </div>
</main>

<footer class="main-footer">
    <div class="footer-content">
        <p>&copy; 2025 TripMaster. All rights reserved.</p>
    </div>
</footer>

<script>
let dayCount = 1;

// Add activity
function addActivity(dayId) {
    const dayBlock = document.getElementById("day" + dayId);
    
    // Create new row
    const newRow = document.createElement("div");
    newRow.className = "activity-row";
    newRow.innerHTML = `
        <input type="time" name="activityTime_` + dayId + `[]" required>
        <input type="text" name="activityName_` + dayId + `[]" placeholder="Activity..." required>
        <button type="button" class="remove-btn" onclick="removeActivity(this)">-</button>
    `;
    
    // Insert before the "+ Add Activity" button
    const addBtn = dayBlock.querySelector("button.add-btn");
    dayBlock.insertBefore(newRow, addBtn);
}

// Remove activity
function removeActivity(btn) {
    btn.parentElement.remove();
}

// Add a new day
function addDay() {
    dayCount++;
    
    // ✅ NEW: Update the hidden input for Java to read
    document.getElementById("totalDays").value = dayCount;

    const container = document.getElementById("daysContainer");
    const newDay = document.createElement("div");
    newDay.className = "day-block";
    newDay.id = "day" + dayCount;

    newDay.innerHTML = `
        <label><strong>Day ` + dayCount + `:</strong></label>
        <div style="display:flex; gap:10px; margin-bottom:10px;">
            <input type="text" name="dayTitle_` + dayCount + `" placeholder="Day Title..." style="flex-grow:1;" required>
            <input type="date" name="dayDate_` + dayCount + `" required>
        </div>

        <div class="activity-row">
            <input type="time" name="activityTime_` + dayCount + `[]" required>
            <input type="text" name="activityName_` + dayCount + `[]" placeholder="Activity..." required>
            <button type="button" class="remove-btn" onclick="removeActivity(this)">-</button>
        </div>
        <br>
        <button type="button" class="add-btn" onclick="addActivity(` + dayCount + `)">+ Add Activity</button>
    `;

    container.appendChild(newDay);
}
</script>

</body>
</html>
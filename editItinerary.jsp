<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="JavaBeans.Itinerary" %>
<%@ page import="JavaBeans.Activities" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>TripMaster - Edit</title>
    <link rel="stylesheet" href="style.css">
    <style>
        .container {
            padding: 10px;
            max-width: 800px;
            margin: auto;
        }

        .day-block {
            background: #f8f9fa;
            padding: 20px;
            margin-bottom: 25px;
            border-left: 6px solid #ffc72c;
        }

        .activity-row {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }

        input {
            padding: 8px;
        }

        .save-btn {
            width: 100%;
            padding: 15px;
            background: #ffc72c;
            border: none;
            cursor: pointer;
            font-weight: bold;
        }
    </style>
</head>

<body>

<%
    Itinerary itin = (Itinerary) request.getAttribute("itinerary");
    List<Activities> actList = (List<Activities>) request.getAttribute("activityList");
    String sourceParam = (String) request.getAttribute("source");
    if (sourceParam == null) sourceParam = "";

    List<String> distinctDays = new ArrayList<>();
    if (actList != null) {
        for (Activities a : actList) {
            if (!distinctDays.contains(a.getTitle())) {
                distinctDays.add(a.getTitle());
            }
        }
    }
%>

<main class="main-content">
    <div class="container">
        <h2>Edit Itinerary</h2>

        <form action="ActivitiesController" method="POST">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="itineraryId" value="<%= itin.getItinerary_ID() %>">
            <input type="hidden" id="dayCountInput" name="totalDays" value="<%= distinctDays.size() %>">
            <input type="hidden" name="source" value="<%= sourceParam %>">

            <label>Trip Title:</label><br>
            <input type="text" name="itineraryTitle" value="<%= itin.getCreate() %>" style="width:100%; margin-bottom: 20px;" required>

            <div id="daysContainer">
<%
    int dayIndex = 0;
    for (String dayTitle : distinctDays) {
        dayIndex++;
        java.util.Date dayDate = null;
        for (Activities a : actList) {
            if (a.getTitle().equals(dayTitle)) {
                dayDate = a.getDate();
                break;
            }
        }
%>
                <div class="day-block" id="day<%= dayIndex %>">
                    <label>Day <%= dayIndex %> Details:</label><br>
                    <input type="text" name="dayTitle_<%= dayIndex %>" value="<%= dayTitle %>" required>
                    <input type="date" name="dayDate_<%= dayIndex %>" value="<%= dayDate %>" required>

<%
        for (Activities act : actList) {
            if (act.getTitle().equals(dayTitle)) {
%>
                    <div class="activity-row">
                        <input type="time" name="activityTime_<%= dayIndex %>[]" value="<%= act.getPlan() %>" required>
                        <input type="text" name="activityName_<%= dayIndex %>[]" value="<%= act.getEvent() %>" required>
                        <button type="button" onclick="this.parentElement.remove()">X</button>
                    </div>
<%
            }
        }
%>
                    <br>
                    <button type="button" onclick="addActivity(<%= dayIndex %>)">+ Add Activity</button>
                </div>
<%
    }
%>
            </div>

            <br>
            <button type="button" onclick="addDay()">+ Add New Day</button>
            <br><br>
            <button type="submit" class="save-btn">Update Itinerary</button>
        </form>
    </div>
</main>

<script>
    let dayCount = <%= distinctDays.size() %>;

    function addActivity(dayId) {
        const dayBlock = document.getElementById("day" + dayId);
        const newRow = document.createElement("div");
        newRow.className = "activity-row";
        newRow.innerHTML = '<input type="time" name="activityTime_' + dayId + '[]"><input type="text" name="activityName_' + dayId + '[]"><button type="button" onclick="this.parentElement.remove()">X</button>';
        const buttons = dayBlock.querySelectorAll("button");
        dayBlock.insertBefore(newRow, buttons[buttons.length - 1]);
    }

    function addDay() {
        dayCount++;
        document.getElementById("dayCountInput").value = dayCount;
        alert("Add Day logic needs to be copied from createItinerary.jsp");
    }
</script>

</body>

</html>

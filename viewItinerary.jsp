<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="JavaBeans.Itinerary" %>
<%@ page import="JavaBeans.Activities" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TripMaster - View Itinerary</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">

    <style>
        body { margin: 0; padding: 0; font-family: 'Inter', sans-serif; background-color: #ffffff; }
        .sub-nav { background-color: #ffe066; padding: 10px 40px; text-align: right; border-bottom: 2px solid #e6c200; }
        .sub-nav a { text-decoration: none; color: #000000; font-size: 0.9rem; font-weight: 800; text-transform: uppercase; margin-left: 5px; }
        .main-content { max-width: 1200px; margin: 50px auto; padding: 0 40px; display: flex; gap: 40px; align-items: flex-start; }
        .details-column { flex: 1; }
        .image-column { flex: 1; display: flex; justify-content: center; }
        .trip-image { width: 100%; max-width: 600px; height: auto; object-fit: cover; border: 1px solid #ddd; border-radius: 8px; }
        .title-row { display: flex; gap: 5px; margin-bottom: 30px; }
        .trip-title { background-color: #ffe066; padding: 15px 20px; font-weight: 900; font-size: 1.5rem; text-transform: uppercase; color: #000; flex-grow: 1; }
        .edit-btn { background-color: #ffe066; padding: 15px 25px; font-weight: 800; font-size: 1.2rem; text-transform: uppercase; color: #fff; text-decoration: none; display: flex; align-items: center; justify-content: center; cursor: pointer; }
        .day-block { margin-bottom: 30px; }
        .date-header { background-color: #29b6f6; color: white; font-weight: 800; padding: 10px 20px; display: inline-block; margin-bottom: 15px; font-size: 1.1rem; border-radius: 4px; }
        .event-row { display: flex; margin-bottom: 10px; align-items: stretch; }
        .time-box { background-color: #000000; color: white; padding: 8px 15px; font-weight: 800; font-size: 1rem; min-width: 100px; text-align: center; display: flex; align-items: center; justify-content: center; border-radius: 4px 0 0 4px; }
        .event-desc { background-color: #c4c4c4; color: #000; padding: 8px 15px; font-weight: 700; font-size: 1rem; flex-grow: 1; display: flex; align-items: center; border-radius: 0 4px 4px 0; }
    </style>
</head>

<body>

<%
    // 1. RECEIVE DATA FROM CONTROLLER
    Itinerary itinerary = (Itinerary) request.getAttribute("itinerary");
    List<Activities> actList = (List<Activities>) request.getAttribute("activityList");

    String mainTitle = (itinerary != null) ? itinerary.getCreate() : "Unknown Trip";
%>

<header class="main-header">
    <h1 class="header-title">🧳 TripMaster</h1>
    <div class="header-content">
        <p class="tagline">Plan Smarter, Travel Better.</p>
        <nav class="main-nav">
            <a href="ActivitiesController?action=listAll">📄 My Itineraries</a>
            <a href="createItinerary.jsp">✚ Create Itinerary</a>
            <a href="ActivitiesController?action=listAll">🏠 Home</a>
            <a href="TravelerController?action=logout">🔒 Logout</a>
        </nav>
    </div>
</header>

<main class="main-content">

    <div class="details-column">

        <div class="title-row">
            <div class="trip-title"><%= mainTitle %></div>
            
            <a href="ActivitiesController?action=edit&id=${itinerary.itinerary_ID}" class="edit-btn">EDIT ✎</a>
        </div>

        <% 
        // 3. LOGIC TO GROUP ACTIVITIES BY DAY
        if (actList != null && !actList.isEmpty()) {
            
            String currentDayTitle = "";
            boolean isFirstDay = true;

            for (Activities act : actList) {
                
                // Retrieve Data
                String dayTitle = act.getTitle(); // e.g., "Day 1"
                java.util.Date actDate = act.getDate(); // e.g., "2025-12-25"
                String time = act.getPlan();           // e.g., "10:00"
                String eventName = act.getEvent();     // e.g., "Flight"

                // Check if this is a NEW DAY block
                if (!dayTitle.equals(currentDayTitle)) {
                    
                    // Close the previous day-block div (if it's not the very first one)
                    if (!isFirstDay) { 
        %>
                    </div> <% 
                    } 
                    
                    isFirstDay = false;
                    currentDayTitle = dayTitle;
        %>
                    <div class="day-block">
                        <div class="date-header">
                            <%= dayTitle %> 
                            
                            <% if (actDate != null) { %>
                                <span style="font-weight: 400; font-size: 0.9em; margin-left: 10px;">
                                    - <%= actDate %>
                                </span>
                            <% } %>
                        </div>
        <% 
                } // End of Header Logic 
        %>

                <div class="event-row">
                    <div class="time-box"><%= time %></div>
                    <div class="event-desc"><%= eventName %></div>
                </div>

        <% 
            } // End Loop
        %>
            </div> <% 
        } else { 
        %>
            <p>No details found for this trip yet.</p>
        <% } %>

    </div>

    <div class="image-column">
        <img src="https://images.unsplash.com/photo-1524231757912-21f4fe3a7200"
             alt="Turkey Scenery" class="trip-image">
    </div>

</main>

<footer class="main-footer">
    <div class="footer-content">
        <p>&copy; 2025 TripMaster. All rights reserved.</p>
        <div class="footer-links">
            <a href="tel:+60970708888">Call Us: 09-7070 8888</a>
            <a href="mailto:info@tripmaster.com">Email: info@tripmaster.com</a>
        </div>
    </div>
</footer>

</body>
</html>
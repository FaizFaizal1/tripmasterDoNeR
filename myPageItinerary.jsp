





<%--============================================================ --%>
<%--                     NOT USED                               --%>
<%--======================================================= --%>



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="JavaBeans.Itinerary" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TripMaster - My Itinerary</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="login.css">
    <link rel="stylesheet" href="transaction.css"> 
    
    <style>
        .itinerary-list-container {
            width: 100%;
            max-width: 600px;
            margin: 40px auto;
            padding: 0 20px;
        }
        
        .itinerary-title {
            text-align: center;
            font-size: 28px;
            font-weight: 900;
            margin-bottom: 25px;
            text-transform: uppercase;
        }

        /* ✅ Make the link cover the whole block */
        .block-link {
            text-decoration: none;
            display: block;
        }

        .itinerary-item {
            background-color: #ffc72c; /* Yellow block color */
            padding: 20px;
            margin-bottom: 10px;
            text-align: center;
            font-size: 20px;
            font-weight: 700;
            color: #000;
            cursor: pointer;
            text-transform: uppercase;
            transition: transform 0.2s;
            position: relative; /* Needed for delete button positioning */
        }

        .itinerary-item:hover {
            transform: scale(1.02);
            background-color: #ffd54f;
        }
        
        .add-item {
            background-color: #ccc;
            padding: 20px;
            margin-top: 20px;
            text-align: center;
            font-size: 30px;
            font-weight: 100;
            color: #000;
            cursor: pointer;
        }
        
        .add-item a {
            text-decoration: none;
            color: black;
            display: block;
        }

        /* ✅ Delete Button Style */
        .delete-btn {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #d32f2f;
            font-size: 18px;
            font-weight: bold;
            text-decoration: none;
            z-index: 10;
            padding: 5px;
        }
        .delete-btn:hover {
            color: red;
            background-color: rgba(255,255,255,0.5);
            border-radius: 50%;
        }
    </style>
</head>
<body class="min-h-screen">

    <header class="main-header">
        <h1 class="header-title"> TripMaster</h1>
        
        <div class="header-content">
            <p class="tagline">Plan Smarter, Travel Better.</p>
            <nav class="main-nav">
                <a href="ActivitiesController?action=home"> Back to Main Site</a>
            </nav>
        </div>
    </header>

    <main class="main-content fuel-container">
        <div class="itinerary-list-container">
            <h2 class="itinerary-title">MY ITINERARY</h2>
            
            <c:choose>
                <c:when test="${not empty itineraryList}">
                    
                    <c:forEach var="it" items="${itineraryList}">
                        
                        <div style="position:relative;">
                            <a href="ActivitiesController?action=view&id=${it.itinerary_ID}" class="block-link">
                                <div class="itinerary-item">
                                    ${it.create}  </div>
                            </a>

                            <a href="ActivitiesController?action=delete&id=${it.itinerary_ID}" 
                               class="delete-btn"
                               onclick="return confirm('Are you sure you want to delete this trip?')">
                               ✖
                            </a>
                        </div>
                        
                    </c:forEach>
                    
                </c:when>
                
                <c:otherwise>
                    <div style="text-align:center; padding:20px; color:#666;">
                        You have no itineraries yet.
                    </div>
                </c:otherwise>
            </c:choose>
            <div class="add-item">
                <a href="createItinerary.jsp">Create New +</a>
            </div>
        </div>
    </main>

    <footer class="main-footer">
        <div class="footer-content">
            <p>&copy; 2025 TripMaster. All rights reserved.</p>
        </div>
    </footer>
    
</body>
</html>
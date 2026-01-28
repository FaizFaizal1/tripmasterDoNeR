<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="DAO.TravelerDAO" %>  <%

	String role = (String) session.getAttribute("role");
	if (role == null || !"ADMIN".equalsIgnoreCase(role)) {
    	response.sendRedirect("login.jsp");
    	return; 
	}


	TravelerDAO dao = new TravelerDAO();
	int totalUsers = dao.getTotalUsers();
	int totalTrips = dao.getTotalTrips();


	System.out.println("DEBUG CHECK:");
	System.out.println("Role in Session: '" + role + "'");

   
    if (role == null || !role.equals("ADMIN")) {
    
        response.sendRedirect("login.jsp");
        return;
    }
%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>TripMaster Admin Dashboard</title>
    <link rel="stylesheet" href="style.css">
    <style>
        body { font-family: Arial, sans-serif; padding: 40px; background:#f4f4f4; }
        .dashboard { display: flex; gap: 30px; flex-wrap: wrap; }
        .card { background: white; padding: 30px; border-radius: 10px; flex: 1 1 200px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); text-align: center; }
        .card h2 { font-size: 36px; margin: 0; color: #333; }
        .card p { font-size: 18px; color: #666; margin-top: 10px; }
    </style>
</head>
<body><header class="main-header">
    <h1 class="header-title">🧳 TripMaster</h1>

    <div class="header-content">
        <p class="tagline">Plan Smarter, Travel Better.</p>

        <nav class="main-nav">
           
            <a href="login.jsp">Logout</a>
        </nav>
    </div>
</header>

<h1>TripMaster Admin Dashboard</h1>

<div class="dashboard">
    <div class="card">
        <h2><%= totalUsers %></h2>
        <p>Total Users</p>
    </div>

    <div class="card">
        <h2><%= totalTrips %></h2>
        <p>Total Trips</p>
    </div>

    
</div>

</body>
</html>

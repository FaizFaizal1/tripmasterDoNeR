<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.List" %>
        <%@ page import="JavaBeans.Traveller" %>
            <% String role=(String) session.getAttribute("role"); if (role==null || !"ADMIN".equalsIgnoreCase(role)) {
                response.sendRedirect("login.jsp"); return; } Integer totalUsers=(Integer)
                request.getAttribute("totalUsers"); Integer totalTrips=(Integer) request.getAttribute("totalTrips");
                List<Traveller> userList = (List<Traveller>) request.getAttribute("userList");

                    // Safely handle nulls if accessed directly without controller
                    if (totalUsers == null) totalUsers = 0;
                    if (totalTrips == null) totalTrips = 0;
                    %>

                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <title>TripMaster Admin Dashboard</title>
                        <link rel="preconnect" href="https://fonts.googleapis.com">
                        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                        <link
                            href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
                            rel="stylesheet">
                        <link rel="stylesheet" href="style.css">
                        <style>
                            /* Dashboard Specific Styles not in style.css */
                            .dashboard-container {
                                display: flex;
                                gap: 2rem;
                                flex-wrap: wrap;
                                margin-bottom: 2rem;
                            }

                            .stat-card {
                                background: white;
                                padding: 2rem;
                                border-radius: 0.75rem;
                                flex: 1 1 200px;
                                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
                                display: flex;
                                flex-direction: column;
                                align-items: center;
                                justify-content: center;
                            }

                            .stat-number {
                                font-size: 3rem;
                                font-weight: 800;
                                color: #1e40af;
                                margin: 0;
                            }

                            .stat-label {
                                font-size: 1.125rem;
                                color: #4b5563;
                                margin-top: 0.5rem;
                            }

                            .table-container {
                                overflow-x: auto;
                                background: white;
                                border-radius: 0.75rem;
                                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
                                margin-bottom: 2rem;
                            }

                            table {
                                width: 100%;
                                border-collapse: collapse;
                                text-align: left;
                            }

                            th {
                                background-color: #f9fafb;
                                padding: 1rem;
                                font-weight: 600;
                                color: #374151;
                                border-bottom: 1px solid #e5e7eb;
                            }

                            td {
                                padding: 1rem;
                                border-bottom: 1px solid #e5e7eb;
                                color: #4b5563;
                            }

                            tr:hover {
                                background-color: #f9fafb;
                            }

                            .action-link {
                                text-decoration: none;
                                font-weight: 500;
                                margin-right: 10px;
                            }

                            .edit-btn {
                                color: #2563eb;
                            }

                            .delete-btn {
                                color: #dc2626;
                            }

                            .edit-btn:hover {
                                text-decoration: underline;
                            }

                            .delete-btn:hover {
                                text-decoration: underline;
                            }

                            .dashboard-header {
                                display: flex;
                                justify-content: space-between;
                                align-items: center;
                                margin-bottom: 1.5rem;
                            }
                        </style>
                    </head>

                    <body>

                        <header class="main-header">
                            <div class="header-content">
                                <div>
                                    <h1 class="header-title">🧳 TripMaster</h1>
                                    <p class="tagline">Admin Dashboard</p>
                                </div>
                                <nav class="main-nav">
                                    <a href="TravelerController?action=logout">Logout</a>
                                </nav>
                            </div>
                        </header>

                        <div class="main-content">

                            <div class="dashboard-container">
                                <div class="stat-card">
                                    <span class="stat-number">
                                        <%= totalUsers %>
                                    </span>
                                    <span class="stat-label">Total Users</span>
                                </div>
                                <div class="stat-card">
                                    <span class="stat-number">
                                        <%= totalTrips %>
                                    </span>
                                    <span class="stat-label">Total Trips</span>
                                </div>
                            </div>

                            <div class="dashboard-header">
                                <h2 class="section-title" style="margin-bottom:0; border-bottom:none;">User Management
                                </h2>
                                <a href="register.jsp" class="cta-button">Add New User</a>
                            </div>

                            <div class="table-container">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Trip</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% if (userList !=null && !userList.isEmpty()) { for (Traveller user : userList)
                                            { %>
                                            <tr>
                                                <td>
                                                    <div style="display:flex; align-items:center; gap:10px;">
                                                        <a href="AdminController?action=deleteUser&id=<%= user.getUser_ID() %>"
                                                            onclick="return confirm('Are you sure you want to delete this user?');"
                                                            class="delete-btn"
                                                            style="text-decoration:none; font-size:1.2rem; line-height:1;"
                                                            title="Delete User">
                                                            &#8854; <!-- Minus sign in circle -->
                                                        </a>
                                                        <span style="font-weight:600;">
                                                            <%= user.getName() %>
                                                        </span>
                                                    </div>
                                                </td>
                                                <td>
                                                    <%= user.getEmail() %>
                                                </td>
                                                <td>
                                                    <% List<JavaBeans.Itinerary> trips = user.getItineraries();
                                                        if (trips != null && !trips.isEmpty()) {
                                                        %>
                                                        <div style="display:flex; flex-direction:column; gap:5px;">
                                                            <% for (JavaBeans.Itinerary trip : trips) { %>
                                                                <div
                                                                    style="display:flex; align-items:center; gap:10px;">
                                                                    <span style="min-width:100px;">
                                                                        <%= trip.getCreate() %>
                                                                    </span>
                                                                    <!-- Edit Trip -->
                                                                    <a href="ActivitiesController?action=edit&id=<%= trip.getItinerary_ID() %>&source=dashboard"
                                                                        class="edit-btn"
                                                                        style="text-decoration:none; font-size:1.2rem; line-height:1;"
                                                                        title="Edit Trip">
                                                                        &#9998; <!-- Pencil icon -->
                                                                    </a>
                                                                    <!-- Delete Trip -->
                                                                    <a href="ActivitiesController?action=delete&id=<%= trip.getItinerary_ID() %>&source=dashboard"
                                                                        onclick="return confirm('Are you sure you want to delete this trip?');"
                                                                        class="delete-btn"
                                                                        style="text-decoration:none; font-size:1.2rem; line-height:1;"
                                                                        title="Delete Trip">
                                                                        &#8854;
                                                                    </a>
                                                                </div>
                                                                <% } %>
                                                        </div>
                                                        <% } else { %>
                                                            <span style="color:#9ca3af; font-style:italic;">No
                                                                trips</span>
                                                            <% } %>
                                                </td>
                                            </tr>
                                            <% } } else { %>
                                                <tr>
                                                    <td colspan="3" style="text-align:center; padding: 2rem;">No users
                                                        found.</td>
                                                </tr>
                                                <% } %>
                                    </tbody>
                                </table>
                            </div>

                        </div>

                        <footer class="main-footer">
                            <div class="footer-content">
                                <p>&copy; 2026 TripMaster. All rights reserved.</p>
                            </div>
                        </footer>

                    </body>

                    </html>
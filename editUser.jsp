<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="JavaBeans.Traveller" %>
        <% String role=(String) session.getAttribute("role"); if (role==null || !"ADMIN".equalsIgnoreCase(role)) {
            response.sendRedirect("login.jsp"); return; } Traveller user=(Traveller) request.getAttribute("user"); if
            (user==null) { response.sendRedirect("AdminController?action=dashboard"); return; } %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <title>Edit User - TripMaster</title>
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
                    rel="stylesheet">
                <link rel="stylesheet" href="style.css">
                <style>
                    .form-container {
                        background: white;
                        padding: 2rem;
                        border-radius: 0.75rem;
                        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
                        max-width: 600px;
                        margin: 0 auto;
                    }

                    .form-group {
                        margin-bottom: 1.5rem;
                    }

                    .form-label {
                        display: block;
                        margin-bottom: 0.5rem;
                        font-weight: 500;
                        color: #374151;
                    }

                    .form-input {
                        width: 100%;
                        padding: 0.75rem;
                        border: 1px solid #d1d5db;
                        border-radius: 0.5rem;
                        font-family: inherit;
                        font-size: 1rem;
                    }

                    .form-actions {
                        display: flex;
                        justify-content: flex-end;
                        gap: 1rem;
                        margin-top: 2rem;
                    }
                </style>
            </head>

            <body>

                <header class="main-header">
                    <div class="header-content">
                        <div>
                            <h1 class="header-title">🧳 TripMaster</h1>
                            <p class="tagline">Admin Dashboard > Edit User</p>
                        </div>
                        <nav class="main-nav">
                            <a href="AdminController?action=dashboard">Back to Dashboard</a>
                            <a href="TravelerController?action=logout">Logout</a>
                        </nav>
                    </div>
                </header>

                <div class="main-content">

                    <div class="form-container">
                        <h2 class="section-title">Edit User Details</h2>

                        <form action="AdminController" method="POST">
                            <input type="hidden" name="action" value="updateUser">
                            <input type="hidden" name="id" value="<%= user.getUser_ID() %>">

                            <div class="form-group">
                                <label class="form-label">Name</label>
                                <input type="text" name="name" class="form-input" value="<%= user.getName() %>"
                                    required>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Email</label>
                                <input type="email" name="email" class="form-input" value="<%= user.getEmail() %>"
                                    required>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Role</label>
                                <select name="role" class="form-input">
                                    <option value="USER" <%="USER" .equalsIgnoreCase(user.getRole()) ? "selected" : ""
                                        %>>User</option>
                                    <option value="ADMIN" <%="ADMIN" .equalsIgnoreCase(user.getRole()) ? "selected" : ""
                                        %>>Admin</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label class="form-label">Password</label>
                                <input type="text" name="password" class="form-input" value="<%= user.getPassword() %>"
                                    required>
                                <small style="color:#6b7280; display:block; margin-top:0.25rem;">Update to change
                                    password.</small>
                            </div>

                            <div class="form-actions">
                                <a href="AdminController?action=dashboard" class="cta-button"
                                    style="background:#6b7280; box-shadow:none;">Cancel</a>
                                <button type="submit" class="cta-button">Save Changes</button>
                            </div>
                        </form>
                    </div>

                </div>

                <footer class="main-footer">
                    <div class="footer-content">
                        <p>&copy; 2026 TripMaster. All rights reserved.</p>
                    </div>
                </footer>

            </body>

            </html>
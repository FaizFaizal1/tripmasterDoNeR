<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🧳 TripMaster - Login</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="login.css">
</head>
<body class="min-h-screen">

<header class="main-header">
    <h1 class="header-title">🧳 TripMaster</h1>

    <div class="header-content">
        <p class="tagline">Plan Smarter, Travel Better.</p>
        <nav class="main-nav">
           
        </nav>
    </div>
</header>

<main class="main-content login-container">
    <div class="login-card">
        <h2 class="login-title">Log In</h2>

        <form action="TravelerController" method="POST" class="login-form">
            <input type="hidden" name="action" value="login">

            <div class="form-group">
                <label for="email">Email</label>
                <!-- MUST match request.getParameter("email") -->
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>

            <button type="submit" class="cta-button login-button">Log In</button>

            <div class="form-links">
                <a href="#">Forgot Password?</a>
                <a href="register.jsp">Create Account</a>
            </div>
        </form>
    </div>
</main>

<footer class="main-footer">
    <div class="footer-content">
        <p>&copy; 2025 TripMaster. All rights reserved.</p>
    </div>
</footer>

</body>
</html>

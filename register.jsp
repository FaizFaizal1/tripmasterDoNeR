<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🧳 TripMaster - Register</title>

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
            <a href="login.jsp">← Back to Login</a>
        </nav>
    </div>
</header>

<main class="main-content login-container">
    <div class="login-card">
        <h2 class="login-title">Register New Account</h2>

        <form action="TravelerController" method="POST" class="login-form">
            <input type="hidden" name="action" value="create">

            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="password">Create Password</label>
                <input type="password" id="password" name="password" required>
            </div>

            <div class="form-group">
                <label for="confirm-password">Confirm Password</label>
                <input type="password" id="confirm-password" name="confirm-password" required>
            </div>

            <div class="checkbox-group">
                <input type="checkbox" id="terms" name="terms" required>
                <label for="terms">
                    I agree to the <a href="#">Terms of Service</a> and Privacy Policy.
                </label>
            </div>

            <button type="submit" class="cta-button login-button">Create Account</button>

            <div class="form-links">
                <p class="text-xs text-gray-600">
                    Already have an account? <a href="login.jsp">Sign In</a>
                </p>
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

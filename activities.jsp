<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🧳 TripMaster - Home</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">

    <style>
        /* HERO */
        .hero {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)),
                         url("images/hero-travel.jpg") center/cover no-repeat;
            color: white;
            padding: 120px 20px;
            text-align: center;
        }

        .hero h2 {
            font-size: 48px;
            font-weight: 900;
        }

        .hero p {
            font-size: 18px;
            margin-top: 10px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .hero a {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 30px;
            background: #ffc72c;
            color: #000;
            font-weight: 700;
            text-decoration: none;
            border-radius: 30px;
        }

        /* SECTION */
        .section {
            padding: 60px 20px;
            max-width: 1200px;
            margin: auto;
        }

        .section-title {
            text-align: center;
            font-size: 32px;
            font-weight: 900;
            margin-bottom: 40px;
        }

        /* CARDS */
        .place-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
        }

        .place-card {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
            background: #fff;
        }

        .place-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .place-content {
            padding: 20px;
        }

        .place-content h3 {
            margin: 0;
            font-size: 22px;
            font-weight: 800;
        }

        .place-content p {
            margin-top: 10px;
            font-size: 14px;
            color: #555;
        }
    </style>
</head>

<body class="min-h-screen">

<header class="main-header">
    <h1 class="header-title">🧳 TripMaster</h1>

    <div class="header-content">
        <p class="tagline">Plan Smarter, Travel Better.</p>

        <nav class="main-nav">
            <a href="ActivitiesController?action=listAll">My Itinerary</a>
        
            <a href="#places">Explore</a>
            <a href="login.jsp">Logout</a>
        </nav>
    </div>
</header>

<!-- HERO SECTION -->
<section class="hero">
    <h2>Your Journey Starts Here</h2>
    <p>Discover beautiful destinations, plan your itinerary, and make every trip unforgettable.</p>
    <a href="ActivitiesController?action=listAll">Start Planning</a>
</section>

<!-- BEST PLACES -->
<section id="places" class="section">
    <h2 class="section-title">Best Places to Visit</h2>

    <div class="place-grid">

        <div class="place-card">
            <img src="eclipse-workspace/paris.jpg" alt="Paris">
            <div class="place-content">
                <h3>Paris, France</h3>
                <p>The city of love, fashion, and iconic landmarks like the Eiffel Tower.</p>
            </div>
        </div>

        <div class="place-card">
            <img src="imagejapan.jpg" alt="Japan">
            <div class="place-content">
                <h3>Kyoto, Japan</h3>
                <p>Experience traditional temples, cherry blossoms, and rich culture.</p>
            </div>
        </div>

        <div class="place-card">
            <img src="images/bali.jpg" alt="Bali">
            <div class="place-content">
                <h3>Bali, Indonesia</h3>
                <p>Tropical beaches, breathtaking sunsets, and peaceful retreats.</p>
            </div>
        </div>

        <div class="place-card">
            <img src="images/newyork.jpg" alt="New York">
            <div class="place-content">
                <h3>New York, USA</h3>
                <p>The city that never sleeps, full of iconic sights and energy.</p>
            </div>
        </div>

    </div>
</section>

<footer class="main-footer">
    <div class="footer-content">
        <p>&copy; 2025 TripMaster. All rights reserved.</p>
    </div>
</footer>

</body>
</html>

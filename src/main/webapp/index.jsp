<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Cars Management System | Login</title>

<!-- Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<!-- Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
/* ===== Global ===== */
body{
    margin:0;
    font-family:'Poppins',sans-serif;
    background:linear-gradient(135deg,#000000,#0a1d3a);
    color:#ffffff;
}

/* ===== Header ===== */
header{
    background:linear-gradient(90deg,#000000,#0d47a1);
    padding:30px;
    text-align:center;
    box-shadow:0 6px 25px rgba(0,0,0,.9);
}

header h1 i{
    color:#2196f3;
}

/* ===== Main Layout ===== */
.main-container{
    display:flex;
    gap:30px;
    padding:40px;
}

/* ===== Login ===== */
.login-container{
    width:35%;
    background:linear-gradient(160deg,#000000,#0a1d3a);
    padding:30px;
    border-radius:18px;
    border:2px solid #0d47a1;
    box-shadow:0 12px 30px rgba(0,0,0,.9);
}

.login-container h2{
    text-align:center;
    color:#2196f3;
    margin-bottom:20px;
}

.login-container input{
    width:100%;
    padding:12px;
    margin:12px 0;
    border-radius:8px;
    border:1px solid #0d47a1;
    background:#111;
    color:#fff;
}

.login-container input:focus{
    outline:none;
    border-color:#2196f3;
    box-shadow:0 0 8px rgba(33,150,243,.9);
}

.login-container button{
    width:100%;
    padding:12px;
    background:linear-gradient(90deg,#0d47a1,#2196f3);
    color:#fff;
    font-size:16px;
    border:none;
    border-radius:8px;
    cursor:pointer;
    font-weight:600;
    transition:.3s;
}

.login-container button:hover{
    background:linear-gradient(90deg,#2196f3,#0d47a1);
    transform:translateY(-3px);
}

.login-container a{
    color:#64b5f6;
    text-decoration:none;
    font-weight:600;
}

/* ===== Cars Section ===== */
.cars-container{
    width:65%;
}

.cars-container h2{
    color:#2196f3;
    margin-bottom:20px;
}

.cars-grid{
    display:grid;
    grid-template-columns:repeat(auto-fill,minmax(230px,1fr));
    gap:20px;
}

/* ===== Car Card ===== */
.car-card{
    background:linear-gradient(160deg,#111,#000);
    padding:16px;
    border-radius:16px;
    border-top:5px solid #0d47a1;
    box-shadow:0 8px 22px rgba(0,0,0,.9);
    transition:.3s;
}

.car-card:hover{
    transform:translateY(-8px);
    border-top:5px solid #2196f3;
}

.car-card h3{
    margin:5px 0;
    color:#64b5f6;
}

.car-card p{
    margin:4px 0;
    font-size:14px;
}

/* Status */
.status{
    display:inline-block;
    margin-top:8px;
    padding:6px 14px;
    border-radius:20px;
    background:#1b5e20;
    font-weight:bold;
    font-size:13px;
}

/* ===== Footer ===== */
footer{
    background:linear-gradient(90deg,#000000,#0d47a1);
    padding:25px;
    text-align:center;
    box-shadow:0 -6px 25px rgba(0,0,0,.9);
}

footer i{
    color:#2196f3;
}

/* ===== Responsive ===== */
@media(max-width:900px){
    .main-container{
        flex-direction:column;
    }
    .login-container,
    .cars-container{
        width:100%;
    }
}
</style>
</head>

<body>

<header>
    <h1><i class="fa-solid fa-car"></i> Cars Management System</h1>
    <p>Premium Used Cars Platform</p>
</header>

<div class="main-container">

<!-- Login -->
<div class="login-container">
    <h2><i class="fa-solid fa-user"></i> Customer Login</h2>

    <form action="/login" method="post">
        <input type="text" name="username" placeholder="Username" required>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">
            <i class="fa-solid fa-right-to-bracket"></i> Login
        </button>
    </form>

    <p style="text-align:center;margin-top:15px;">
        New user? <a href="/register">Create account</a>
    </p>
</div>

<!-- Cars -->
<div class="cars-container">
    <h2><i class="fa-solid fa-car-side"></i> Available Cars</h2>

    <div class="cars-grid">

        <div class="car-card">
            <h3>Maruti Swift</h3>
            <p>Year: 2016</p>
            <p>Fuel: Petrol</p>
            <p>KMs: 78,000</p>
            <span class="status">Available</span>
        </div>

        <div class="car-card">
            <h3>Hyundai Creta</h3>
            <p>Year: 2017</p>
            <p>Fuel: Diesel</p>
            <p>KMs: 68,000</p>
            <span class="status">Available</span>
        </div>

        <div class="car-card">
            <h3>BMW 3 Series</h3>
            <p>Year: 2015</p>
            <p>Fuel: Petrol</p>
            <p>KMs: 98,000</p>
            <span class="status">Available</span>
        </div>

    </div>
</div>

</div>

<footer>
    <p><i class="fa-solid fa-building"></i> ShubhamDilipShisode Cars Pvt. Ltd.</p>
    <p>Pune, India | 📞 +91 98765 43210</p>
    <p>© 2026 All Rights Reserved</p>
</footer>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Dashboard | Cars Management</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>
body{
    background: linear-gradient(135deg,#ff3d00,#ff9100);
    min-height:100vh;
    color:#fff;
    font-family:'Segoe UI',Tahoma,Verdana,sans-serif;
}

.navbar{
    background: linear-gradient(90deg,#b71c1c,#ff6d00);
    box-shadow:0 4px 20px rgba(0,0,0,.8);
}

.dashboard-title{
    font-weight:800;
    color:#fff;
}

/* ===== LARGE CARD ===== */
.admin-card{
    background: linear-gradient(120deg,#ffffff,#2196f3,#ffffff);
    background-size:300% 300%;
    animation: cardFlow 6s ease infinite;

    border-radius:20px;
    box-shadow:0 14px 40px rgba(0,0,0,.6);
    transition:.35s ease;
    text-align:center;
    padding:35px 25px;
    min-height:320px;
    color:#000;
}

@keyframes cardFlow{
    0%{background-position:0% 50%}
    50%{background-position:100% 50%}
    100%{background-position:0% 50%}
}

.admin-card:hover{
    transform:translateY(-12px) scale(1.04);
    box-shadow:0 24px 55px rgba(33,150,243,.9);
}

.icon-circle{
    width:90px;
    height:90px;
    font-size:2.3rem;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    margin:0 auto 20px;
    color:#fff;
    background:linear-gradient(135deg,#2196f3,#0d47a1);
    box-shadow:0 6px 20px rgba(0,0,0,.7);
}

.btn{
    font-weight:600;
    border:none;
}
.btn-primary,.btn-info{background:#b71c1c;}
.btn-primary:hover,.btn-info:hover{background:#ff3d00;}
.btn-secondary{
    background:transparent;
    border:1px solid #fff;
    color:#fff;
}
.btn-secondary:hover{background:#fff;color:#000;}

footer{
    background: linear-gradient(90deg,#b71c1c,#ff6d00);
    padding:22px 0;
    margin-top:70px;
    box-shadow:0 -4px 20px rgba(0,0,0,.8);
}
</style>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark">
<div class="container">
    <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/admin/dashboard">
        <i class="bi bi-speedometer2"></i> Admin Panel
    </a>
    <span class="navbar-text fw-semibold">
        Used Cars Management System
    </span>
</div>
</nav>

<div class="container mt-5">
<h2 class="dashboard-title text-center mb-5">
    <i class="bi bi-gear-fill"></i> Admin Dashboard
</h2>

<div class="row g-5">

<!-- Add Car -->
<div class="col-lg-4 col-md-6">
    <div class="card admin-card">
        <div class="icon-circle"><i class="bi bi-car-front-fill"></i></div>
        <h4>Add Car</h4>
        <p>Add new car details</p>
        <a href="${pageContext.request.contextPath}/newcar" class="btn btn-primary">Open</a>
    </div>
</div>

<!-- Modify Car -->
<div class="col-lg-4 col-md-6">
    <div class="card admin-card">
        <div class="icon-circle"><i class="bi bi-pencil-square"></i></div>
        <h4>Modify Car Info</h4>
        <p>Edit existing car details</p>
        <a href="${pageContext.request.contextPath}/modify-cars" class="btn btn-info">Open</a>
    </div>
</div>

<!-- Car List -->
<div class="col-lg-4 col-md-6">
    <div class="card admin-card">
        <div class="icon-circle"><i class="bi bi-list-ul"></i></div>
        <h4>Car List</h4>
        <p>View all cars</p>
        <a href="${pageContext.request.contextPath}/all-cars" class="btn btn-primary">Open</a>
    </div>
</div>

<!-- Add Enquiry -->
<div class="col-lg-4 col-md-6">
    <div class="card admin-card">
        <div class="icon-circle"><i class="bi bi-chat-dots-fill"></i></div>
        <h4>Add Enquiry</h4>
        <p>Register customer enquiry</p>
        <a href="${pageContext.request.contextPath}/newenq" class="btn btn-secondary">Open</a>
    </div>
</div>

<!-- Enquiry List -->
<div class="col-lg-4 col-md-6">
    <div class="card admin-card">
        <div class="icon-circle"><i class="bi bi-journal-text"></i></div>
        <h4>Enquiry List</h4>
        <p>View customer enquiries</p>
        <a href="${pageContext.request.contextPath}/enquiry-list" class="btn btn-info">Open</a>
    </div>
</div>

</div>
</div>

<footer class="text-center">
<div class="container">
    <h6 class="mb-1">
        <i class="bi bi-building"></i> ShubhamDilipShisode Cars Management System
    </h6>
    <p class="mb-0">Admin Console | Spring Boot & Bootstrap</p>
</div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

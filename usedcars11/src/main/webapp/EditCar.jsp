<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Used Car</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background: linear-gradient(135deg,#e3f2fd,#fffde7);
    min-height:100vh;
}
.form-box{
    background:#fff;
    padding:30px;
    border-radius:20px;
    box-shadow:0 10px 25px rgba(0,0,0,0.2);
}
</style>
</head>

<body>

<div class="container mt-5">
<div class="row justify-content-center">
<div class="col-md-8">

<h3 class="text-center mb-4">✏️ Edit Used Car</h3>

<form action="${pageContext.request.contextPath}/update-car" method="post" class="form-box">

    <!-- REQUIRED FOR UPDATE -->
    <input type="hidden" name="carid" value="${car.carid}"/>

    <div class="row g-3">

        <div class="col-md-6">
            <label class="form-label">Brand</label>
            <input type="text" name="brand" value="${car.brand}" class="form-control" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Model</label>
            <input type="text" name="model" value="${car.model}" class="form-control" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Manufacture Year</label>
            <input type="number" name="mfgyear" value="${car.mfgyear}" class="form-control" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Kilometers</label>
            <input type="number" name="kilometers" value="${car.kilometers}" class="form-control">
        </div>

        <div class="col-md-6">
            <label class="form-label">Fuel Type</label>
            <select name="fueltype" class="form-select">
                <option value="Petrol" ${car.fueltype eq 'Petrol' ? 'selected' : ''}>Petrol</option>
                <option value="Diesel" ${car.fueltype eq 'Diesel' ? 'selected' : ''}>Diesel</option>
                <option value="CNG" ${car.fueltype eq 'CNG' ? 'selected' : ''}>CNG</option>
                <option value="Electric" ${car.fueltype eq 'Electric' ? 'selected' : ''}>Electric</option>
            </select>
        </div>

        <div class="col-md-6">
            <label class="form-label">Color</label>
            <input type="text" name="color" value="${car.color}" class="form-control">
        </div>

        <div class="col-md-6">
            <label class="form-label">Price</label>
            <input type="number" name="price" value="${car.price}" class="form-control">
        </div>

        <div class="col-md-6">
            <label class="form-label">Owner Name</label>
            <input type="text" name="ownername" value="${car.ownername}" class="form-control">
        </div>

        <div class="col-md-6">
            <label class="form-label">Mobile</label>
            <input type="text" name="mobile" value="${car.mobile}" class="form-control">
        </div>

        <div class="col-md-6">
            <label class="form-label">Status</label>
            <select name="status" class="form-select">
                <option value="Available" ${car.status eq 'Available' ? 'selected' : ''}>Available</option>
                <option value="Sold" ${car.status eq 'Sold' ? 'selected' : ''}>Sold</option>
            </select>
        </div>

    </div>

    <div class="mt-4 d-flex justify-content-between">
        <a href="${pageContext.request.contextPath}/modify-cars" class="btn btn-secondary">
            ⬅ Back
        </a>
        <button type="submit" class="btn btn-success">
            💾 Update Car
        </button>
    </div>

</form>

</div>
</div>
</div>

</body>
</html>

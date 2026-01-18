<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Used Cars List | Admin Panel</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>
/* =============================== */
/* BACKGROUND (RED + ORANGE) */
/* =============================== */
body { 
    background: linear-gradient(135deg, #ff512f, #ff9800);
    font-family: 'Segoe UI', sans-serif; 
    min-height: 100vh; 
    color: #000000;
}

/* Title */
h2 {
    color: #000000;
    font-weight: bold;
}

/* Filter Card */
.filter-card {
    background: #111111;
    border: 1px solid #ff7a18;
    border-radius: 16px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.4);
    color: #000000;
}
.filter-card label { color: #000000; }
.filter-card .form-control,
.filter-card .form-select {
    background: #ffffff;
    color: #000000;
    border: 1px solid #ff7a18;
}

/* Grid */
.card-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
}

/* Car Card */
.car-card {
    background: linear-gradient(160deg, #fffde7, #ffe082);
    border: 2px solid #ff9800;
    border-radius: 18px;
    box-shadow: 0 12px 30px rgba(255,152,0,0.4);
    transition: transform 0.4s ease, box-shadow 0.4s ease;
    color: #000000;
    overflow: hidden;
}
.car-card:hover {
    transform: translateY(-8px) scale(1.03);
    box-shadow: 0 20px 40px rgba(255,152,0,0.7);
}

.car-header {
    background: linear-gradient(90deg, #ff9800, #ffeb3b);
    padding: 12px 16px;
    font-weight: bold;
    color: #000000;
}

.car-body p {
    margin-bottom: 6px;
    font-size: 0.95rem;
    color: #000000;
}

/* Buttons */
.btn-primary {
    background: #ff7a18;
    border: none;
    font-weight: bold;
    color: #000000;
}
.btn-primary:hover {
    background: #ffa64d;
    color: #000000;
}
.btn-secondary {
    background: #ffffff;
    border: 1px solid #ff7a18;
    color: #000000;
    font-weight: bold;
}
.btn-secondary:hover {
    background: #ff7a18;
    color: #000000;
}
</style>
</head>

<body>

<div class="container mt-5 mb-5">

    <h2 class="text-center mb-4">🚗 Used Cars List 🚗</h2>

    <!-- Filter Card -->
    <div class="card filter-card p-4 mb-4">
        <div class="row g-3">
            <div class="col-md-3">
                <label class="form-label">Car ID</label>
                <input type="text" id="carId" class="form-control" placeholder="Enter Car ID">
            </div>
            <div class="col-md-3">
                <label class="form-label">Owner Name</label>
                <input type="text" id="ownerName" class="form-control" placeholder="Enter Owner Name">
            </div>
            <div class="col-md-3">
                <label class="form-label">Fuel Type</label>
                <select id="fuelType" class="form-select">
                    <option value="">All</option>
                    <option value="PETROL">Petrol</option>
                    <option value="DIESEL">Diesel</option>
                    <option value="CNG">CNG</option>
                    <option value="ELECTRIC">Electric</option>
                </select>
            </div>
            <div class="col-md-3 d-grid gap-2">
                <button class="btn btn-primary" onclick="applyFilter()">Search</button>
                <button class="btn btn-secondary" onclick="resetFilter()">Reset</button>
            </div>
        </div>
    </div>

    <c:if test="${empty carList}">
        <div class="alert alert-warning text-center">No cars available.</div>
    </c:if>

    <c:if test="${not empty carList}">
        <div class="card-grid">
            <c:forEach var="car" items="${carList}">
                <div class="car-item">
                    <div class="card car-card">
                        <div class="car-header">
                            ID: ${car.carid} | ${car.brand} ${car.model}
                        </div>
                        <div class="card-body car-body">
                            <p><strong>Year:</strong> ${car.mfgyear}</p>
                            <p><strong>KMs:</strong> ${car.kilometers}</p>
                            <p><strong>Fuel:</strong> ${car.fueltype}</p>
                            <p><strong>Color:</strong> ${car.color}</p>
                            <p><strong>Price:</strong> ₹ ${car.price}</p>
                            <p><strong>Owner:</strong> ${car.ownername}</p>
                            <p><strong>Mobile:</strong> ${car.mobile}</p>
                            <p>
                                <strong>Status:</strong>
                                <c:choose>
                                    <c:when test="${car.status eq 'AVAILABLE'}">
                                        <span class="badge bg-success">AVAILABLE</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-danger">${car.status}</span>
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
function applyFilter() {
    let idVal = document.getElementById("carId").value.toLowerCase();
    let ownerVal = document.getElementById("ownerName").value.toLowerCase();
    let fuelVal = document.getElementById("fuelType").value.toLowerCase();

    document.querySelectorAll(".car-item").forEach(card => {
        let text = card.innerText.toLowerCase();
        card.style.display =
            (idVal === "" || text.includes(idVal)) &&
            (ownerVal === "" || text.includes(ownerVal)) &&
            (fuelVal === "" || text.includes(fuelVal))
            ? "block" : "none";
    });
}

function resetFilter() {
    document.getElementById("carId").value = "";
    document.getElementById("ownerName").value = "";
    document.getElementById("fuelType").value = "";
    document.querySelectorAll(".car-item").forEach(card => card.style.display = "block");
}
</script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Delete Cars - Admin Panel</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Font Awesome Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>
body {
    background: linear-gradient(135deg, #0d6efd, #001f54);
    min-height: 100vh;
    padding: 30px;
    font-family: 'Segoe UI', sans-serif;
    color: #fff;
}

.marquee {
    background: #dc3545;
    color: #fff;
    padding: 12px;
    border-radius: 10px;
    margin-bottom: 20px;
}

.card-car {
    background: #ffffff;
    color: #000;
    border-radius: 20px;
    padding: 20px;
    margin-bottom: 25px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.4);
    transition: transform 0.3s ease;
}
.card-car:hover {
    transform: translateY(-5px);
}

.card-title {
    font-weight: bold;
    font-size: 1.25rem;
    margin-bottom: 10px;
}

.card-text {
    font-size: 0.95rem;
    margin-bottom: 5px;
}

.status-available {
    background-color: #198754;
    color: #fff;
    padding: 3px 8px;
    border-radius: 12px;
    font-size: 0.85rem;
}

.status-sold {
    background-color: #6c757d;
    color: #fff;
    padding: 3px 8px;
    border-radius: 12px;
    font-size: 0.85rem;
}

.btn-delete {
    background-color: #dc3545;
    color: #fff;
    border: none;
    width: 100%;
}
.btn-delete:hover {
    background-color: #bb2d3b;
}

.btn-delete-all {
    background: linear-gradient(45deg, #ff0000, #ff6b6b);
    color: #fff;
    font-weight: bold;
    padding: 10px 25px;
    border-radius: 30px;
    border: none;
}
</style>
</head>
<body>

<!-- HEADER -->
<marquee scrollamount="18" class="marquee">
    <h4><i class="fa-solid fa-car-burst"></i> DELETE USED CARS – ADMIN PANEL</h4>
</marquee>

<!-- FILTER BY YEAR -->
<div class="mb-4">
    <form class="d-flex" method="get" action="${pageContext.request.contextPath}/delete-cars">
        <input type="number" class="form-control me-2" name="year" placeholder="Filter by Year">
        <button type="submit" class="btn btn-primary">Filter</button>
    </form>
</div>

<!-- DELETE ALL CARS BUTTON -->
<!-- DELETE ALL CARS BUTTON -->
<div class="text-end mb-4">
    <form action="${pageContext.request.contextPath}/delete-all-cars"
          method="post"
          onsubmit="return confirm('⚠ Are you sure you want to DELETE ALL cars?');">

        <button type="submit" class="btn btn-danger">
            <i class="fa-solid fa-trash"></i> Delete All Cars
        </button>
    </form>
</div>


<!-- CAR CARDS -->
<div class="container">
    <div class="row g-4">
        <c:forEach var="car" items="${carList}">
            <div class="col-md-4">
                <div class="card-car">
                    <h5 class="card-title">${car.brand} ${car.model}</h5>
                    <p class="card-text"><strong>ID:</strong> ${car.carid}</p>
                    <p class="card-text"><strong>Year:</strong> ${car.mfgyear}</p>
                    <p class="card-text"><strong>Kilometers:</strong> ${car.kilometers} km</p>
                    <p class="card-text"><strong>Fuel:</strong> ${car.fueltype}</p>
                    <p class="card-text"><strong>Color:</strong> ${car.color}</p>
                    <p class="card-text"><strong>Price:</strong> ₹ ${car.price}</p>
                    <p class="card-text"><strong>Owner:</strong> ${car.ownername} (${car.mobile})</p>
                    <p class="card-text">
                        <strong>Status:</strong>
                        <span class="${car.status == 'AVAILABLE' ? 'status-available' : 'status-sold'}">
                            ${car.status}
                        </span>
                    </p>

                    <!-- SINGLE DELETE BUTTON -->
                    <form action="${pageContext.request.contextPath}/delete-car" method="post"
                          onsubmit="return confirm('⚠ Are you sure you want to DELETE this car?');">
                        <input type="hidden" name="carId" value="${car.carid}">
                        <button type="submit" class="btn-delete mt-2">
                            <i class="fa-solid fa-trash"></i> Delete
                        </button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>

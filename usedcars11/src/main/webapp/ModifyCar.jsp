<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Modify Used Cars</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>
body {
    background: linear-gradient(135deg,#fffde7,#e8f5e9);
    min-height:100vh;
}
.search-box {
    background:#fff;
    padding:25px;
    border-radius:18px;
    box-shadow:0 8px 20px rgba(0,0,0,0.15);
}
.car-card {
    background: linear-gradient(135deg,#1565c0,#ff8f00);
    color:#fff;
    border-radius:20px;
    box-shadow:0 10px 25px rgba(0,0,0,0.25);
}
.car-header {
    background:rgba(0,0,0,0.25);
    padding:12px;
    text-align:center;
    font-weight:bold;
}
.car-body { padding:15px; }
.label { color:#ffeb3b; font-weight:bold; }
.car-footer {
    background:rgba(0,0,0,0.25);
    padding:12px;
    text-align:center;
}
</style>
</head>

<body>
<div class="container mt-5">

<h2 class="text-center mb-4">🚗 Modify Used Cars</h2>

<!-- SEARCH FORM -->
<div class="search-box mb-4">
<form id="searchForm" action="${pageContext.request.contextPath}/modify-cars" method="get">
<div class="row g-3">

    <div class="col-md-3">
        <input type="number" name="carid" class="form-control"
               placeholder="Search by Car ID"
               value="${param.carid != null ? param.carid : ''}">
    </div>

    <div class="col-md-3">
        <input type="text" name="ownername" class="form-control"
               placeholder="Search by Owner Name"
               value="${param.ownername != null ? param.ownername : ''}">
    </div>

    <div class="col-md-3">
        <select name="fueltype" class="form-select">
            <option value="">Fuel Type</option>
            <option value="Petrol" ${param.fueltype=='Petrol'?'selected':''}>Petrol</option>
            <option value="Diesel" ${param.fueltype=='Diesel'?'selected':''}>Diesel</option>
            <option value="CNG" ${param.fueltype=='CNG'?'selected':''}>CNG</option>
            <option value="Electric" ${param.fueltype=='Electric'?'selected':''}>Electric</option>
        </select>
    </div>

    <div class="col-md-3 d-flex gap-2">
        <button type="submit" class="btn btn-primary flex-fill">
            <i class="bi bi-search"></i> Search
        </button>
        <button type="button" class="btn btn-secondary flex-fill" onclick="resetForm()">
            <i class="bi bi-x-circle"></i> Reset
        </button>
    </div>

</div>
</form>
</div>

<!-- NO DATA FOUND -->
<c:if test="${empty carList}">
<div class="alert alert-warning text-center">
    No cars found
</div>
</c:if>

<!-- CAR LIST -->
<c:if test="${not empty carList}">
<div class="row g-4">
<c:forEach var="c" items="${carList}">
    <div class="col-lg-4 col-md-6">
        <div class="car-card">
            <div class="car-header">
                ${c.brand} ${c.model} (ID: ${c.carid})
            </div>

            <div class="car-body">
                <p><span class="label">Year:</span> ${c.mfgyear}</p>
                <p><span class="label">KMs:</span> ${c.kilometers}</p>
                <p><span class="label">Fuel:</span> ${c.fueltype}</p>
                <p><span class="label">Color:</span> ${c.color}</p>
                <p><span class="label">Price:</span> ₹${c.price}</p>
                <p><span class="label">Owner:</span> ${c.ownername}</p>
                <p><span class="label">Mobile:</span> ${c.mobile}</p>
                <p><span class="label">Status:</span> ${c.status}</p>
            </div>

            <div class="car-footer d-flex justify-content-center gap-2">

                <!-- EDIT -->
                <a href="${pageContext.request.contextPath}/edit-car?carid=${c.carid}"
                   class="btn btn-warning btn-sm">
                    <i class="bi bi-pencil"></i> Edit
                </a>

                <!-- DELETE -->
                <form action="${pageContext.request.contextPath}/delete-car"
                      method="post" style="display:inline-block;">

                    <!-- CSRF TOKEN (IMPORTANT) -->
                    <input type="hidden"
                           name="${_csrf.parameterName}"
                           value="${_csrf.token}" />

                    <input type="hidden" name="carid" value="${c.carid}" />

                    <button type="submit"
                            class="btn btn-danger btn-sm"
                            onclick="return confirm('Delete this car?');">
                        <i class="bi bi-trash"></i> Delete
                    </button>
                </form>

            </div>
        </div>
    </div>
</c:forEach>
</div>
</c:if>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
function resetForm() {
    const form = document.getElementById('searchForm');
    form.carid.value = '';
    form.ownername.value = '';
    form.fueltype.value = '';
    form.submit();
}
</script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Car Added Successfully</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #05080f, #0d6efd);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .success-card {
            background: #0b0f19;
            border-radius: 22px;
            box-shadow: 0 12px 45px rgba(0, 0, 0, 0.85);
            padding: 45px;
            text-align: center;
            color: #eaeaea;
        }

        .icon-success {
            font-size: 4.5rem;
            color: #0d6efd;
        }

        h2 {
            color: #0d6efd;
        }

        .lead {
            color: #cfd8ff;
        }

        strong {
            color: #0d6efd;
        }

        hr {
            border-color: rgba(255, 255, 255, 0.15);
        }
    </style>
</head>

<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-7">
            <div class="card success-card p-5 text-center">

                <i class="bi bi-check-circle-fill icon-success"></i>

                <h2 class="fw-bold mt-3">
                    Car Added Successfully!
                </h2>

                <p class="lead mt-3">
                    The new used car details have been saved in the database.
                </p>

                <hr class="my-4">

                <!-- Dynamic values -->
                <p><strong>Brand:</strong>
                    <c:out value="${car.brand}" default="N/A"/>
                </p>

                <p><strong>Model:</strong>
                    <c:out value="${car.model}" default="N/A"/>
                </p>

                <p><strong>Price:</strong>
                    ₹<c:out value="${car.price}" default="0"/>
                </p>

                <p>
                    <strong>Status:</strong>
                    <span class="badge bg-primary px-3 py-2">
                        <c:out value="${status}" default="ACTIVE"/>
                    </span>
                </p>

                <div class="d-flex justify-content-center gap-3 mt-4 flex-wrap">
                    <a href="${contextPath}/newcar" class="btn btn-primary px-4">
                        <i class="bi bi-plus-circle"></i> Add Another Car
                    </a>

                    <a href="${contextPath}/admin/dashboard" class="btn btn-outline-light px-4">
                        <i class="bi bi-speedometer2"></i> Dashboard
                    </a>

                    <a href="${contextPath}/admin/cars" class="btn btn-outline-primary px-4">
                        <i class="bi bi-list-ul"></i> View Cars
                    </a>
                </div>

            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

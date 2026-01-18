<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Enquiry Submitted Successfully</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #ff6a00, #ff9100, #1e40af, #2563eb);
            background-size: 300% 300%;
            animation: bgFlow 8s ease infinite;

            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', sans-serif;
            padding: 20px;
            color: #e5e7eb;
        }

        @keyframes bgFlow {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .success-card {
            background-color: #020617;
            border-radius: 22px;
            padding: 40px;
            width: 100%;
            max-width: 560px;
            box-shadow: 0 20px 45px rgba(0,0,0,0.85);
            border: 1px solid #1e293b;
            animation: zoomIn 0.6s ease-in-out;
        }

        @keyframes zoomIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
        }

        .success-icon {
            font-size: 4.8rem;
            color: #22c55e;
        }

        .info-box {
            background: #020617;
            border: 1px solid #1e293b;
            border-radius: 14px;
            padding: 18px;
            margin-top: 25px;
            text-align: left;
        }

        .info-box p {
            margin-bottom: 10px;
            font-size: 15px;
        }

        .label {
            color: #93c5fd;
            font-weight: 600;
        }

        .btn-custom {
            background: linear-gradient(135deg, #2563eb, #1e40af);
            border: none;
            font-weight: 600;
            color: #ffffff;
        }

        .btn-custom:hover {
            background: linear-gradient(135deg, #1d4ed8, #1e3a8a);
        }
    </style>
</head>

<body>

<div class="success-card text-center">

    <!-- ICON -->
    <div class="mb-3">
        <i class="bi bi-check-circle-fill success-icon"></i>
    </div>

    <!-- TITLE -->
    <h2 class="fw-bold text-success mb-2">
        Enquiry Submitted Successfully!
    </h2>
    <p class="text-secondary mb-4">
        Your enquiry has been saved in the system.
    </p>

    <!-- ENQUIRY DETAILS -->
    <div class="info-box">
        <p><span class="label">Enquiry ID:</span> ${enquiry.enquiryId}</p>
        <p><span class="label">Customer Name:</span> ${enquiry.customerName}</p>
        <p><span class="label">Mobile:</span> ${enquiry.mobile}</p>
        <p><span class="label">Enquiry Date:</span> ${enquiry.enquiryDate}</p>
        <p><span class="label">Remarks:</span> ${enquiry.remarks}</p>
    </div>

    <!-- ACTION BUTTONS -->
    <div class="mt-4 d-flex justify-content-center gap-3 flex-wrap">
        <a href="/enquiry/new" class="btn btn-custom px-4">
            <i class="bi bi-plus-circle"></i> New Enquiry
        </a>

        <a href="/" class="btn btn-outline-primary px-4">
            <i class="bi bi-house-door"></i> Home
        </a>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Enquiry List | Admin Panel</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>
body { 
    background: linear-gradient(135deg, #ff512f, #dd2476);
    color: #fff;
    font-family: 'Segoe UI', sans-serif; 
    min-height: 100vh; 
}

.container { margin-top: 40px; }

#searchContainer input {
    background: #fff;
    color: #000;
}

.enquiry-card {
    background: #ffffff;
    border-radius: 16px;
    border: 3px solid #ffeb3b;
    color: #000;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.enquiry-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 14px 30px rgba(255,235,59,0.6);
}

.enquiry-card h5 {
    color: #f57f17;
    font-weight: 600;
}

.btn-delete {
    background: #b71c1c;
    border: none;
    color: #fff;
}
.btn-delete:hover {
    background: #7f0000;
}

.card-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
}
</style>
</head>

<body>

<div class="container">
    <h2 class="text-center mb-4">📋 Enquiry List</h2>

    <!-- DELETE ALL -->
    <div class="text-end mb-4">
        <form action="${pageContext.request.contextPath}/delete-all-enquiries"
              method="post"
              onsubmit="return confirm('⚠ Are you sure you want to DELETE ALL enquiries?');">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <button type="submit"
                    class="btn btn-dark"
                    ${empty enquiryList ? "disabled" : ""}>
                <i class="bi bi-trash-fill"></i> Delete All Enquiries
            </button>
        </form>
    </div>

    <!-- SEARCH BAR -->
    <div id="searchContainer" class="row g-2 mb-4">
        <div class="col-md-3">
            <input type="text" id="searchName"
                   class="form-control"
                   placeholder="Search by Customer Name">
        </div>

        <div class="col-md-3">
            <input type="text" id="searchMobile"
                   class="form-control"
                   placeholder="Search by Mobile">
        </div>

        <div class="col-md-3">
            <input type="date" id="searchDate"
                   class="form-control">
        </div>

        <div class="col-md-3 d-grid gap-2">
            <button class="btn btn-success" onclick="filterCards()">
                <i class="bi bi-search"></i> Search
            </button>
            <button class="btn btn-warning" onclick="resetSearch()">
                <i class="bi bi-x-circle"></i> Reset
            </button>
        </div>
    </div>

    <!-- ENQUIRY LIST -->
    <div class="card-grid">
        <c:forEach var="e" items="${enquiryList}">
            <div class="enquiry-card"
                 data-name="${fn:toLowerCase(e.customerName)}"
                 data-mobile="${e.mobile}"
                 data-date="${e.enquiryDate}">
                <div class="card-body">
                    <h5>${e.customerName}</h5>
                    <p><i class="bi bi-calendar-event"></i> ${e.enquiryDate}</p>
                    <p><i class="bi bi-telephone-fill"></i> ${e.mobile}</p>
                    <p><i class="bi bi-chat-left-text-fill"></i> ${e.remarks}</p>

                    <button type="button"
                            class="btn btn-delete btn-sm w-100 mt-2"
                            onclick="deleteEnquiry(${e.enquiryId}, this)">
                        <i class="bi bi-trash-fill"></i> Delete
                    </button>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
const cards = document.querySelectorAll(".enquiry-card");

function filterCards() {
    const name   = document.getElementById("searchName").value.toLowerCase();
    const mobile = document.getElementById("searchMobile").value.toLowerCase();
    const date   = document.getElementById("searchDate").value;

    cards.forEach(c => {
        const match =
            c.dataset.name.includes(name) &&
            c.dataset.mobile.includes(mobile) &&
            (date === "" || c.dataset.date === date);

        c.style.display = match ? "block" : "none";
    });
}

function resetSearch() {
    document.getElementById("searchName").value = "";
    document.getElementById("searchMobile").value = "";
    document.getElementById("searchDate").value = "";
    cards.forEach(c => c.style.display = "block");
}

function deleteEnquiry(id, btn) {
    if (!confirm("Are you sure you want to delete this enquiry?")) return;

    fetch("${pageContext.request.contextPath}/delete-enquiry/" + id, {
        method: "POST",
        headers: { "X-CSRF-TOKEN": "${_csrf.token}" }
    }).then(res => {
        if (res.ok) btn.closest(".enquiry-card").remove();
        else alert("Delete failed");
    });
}
</script>

</body>
</html>

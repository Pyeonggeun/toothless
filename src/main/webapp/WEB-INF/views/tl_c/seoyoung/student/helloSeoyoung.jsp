<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>

<%
    String formattedDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(new Date());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <title>AJDKS TEMPLATE FOR STUDENT</title>
    <style>
        /* Styles here */
    </style>
    <script>
    
    
    
    
    
    document.addEventListener('DOMContentLoaded', function () {
        // Add your AJAX logic here
        fetchCompanyData(); // Initial fetch on page load

        // Function to fetch company data
        function fetchCompanyData() {
            // You can customize the URL and parameters as per your server-side implementation
            fetch('/your-server-endpoint')
                .then(response => response.json())
                .then(data => {
                    // Handle the data and update the UI
                    updateCompanyList(data);
                })
                .catch(error => {
                    console.error('Error fetching data:', error);
                });
        }

        // Function to update the company list in the UI
        function updateCompanyList(data) {
            // Update the DOM with the fetched data
            // You can modify this part based on your specific requirements
            const tbody = document.querySelector('#companyTableBody');
            tbody.innerHTML = ''; // Clear existing rows

            data.forEach(company => {
                const row = document.createElement('tr');
                // Create and append cells for each column
                // Modify this part based on your data structure
                row.innerHTML = `
                    <td>${company.INTERNSHIP_COURSE_PK}</td>
                    <td>${company.COMPANY_CATEGORY_NAME}</td>
                    <td>${company.COMPANY_NAME}</td>
                    <!-- Add other columns as needed -->
                    <td>
                        <button class="btn btn-light" data-bs-toggle="modal"
                            data-bs-target="#exampleModalToggle${company.INTERNSHIP_COURSE_PK}">
                            상세보기
                        </button>
                    </td>
                `;
                tbody.appendChild(row);
            });
        }
    });
</script>

</head>
<body>
    <div class="container-fluid">
        <!-- Rest of your HTML content -->

        <div class="row text-center">
            <table class="table text-center align-middle ">
                <thead class="table-primary">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">업종</th>
                        <th scope="col">회사명</th>
                        <!-- Add other columns as needed -->
                        <th scope="col">&nbsp;지원</th>
                    </tr>
                </thead>
                <tbody id="companyTableBody">
                    <!-- Company data rows will be dynamically added here -->
                </tbody>
            </table>
        </div>

    </div>
    <!-- Rest of your HTML content -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>

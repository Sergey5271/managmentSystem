<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head><%@ page isELIgnored="false" %>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>javaguides.net</title>
</head>
<body>
<div class="container">
    <div class="col-md-offset-1 col-md-10">

        <br/><br/>
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Student List</div>
            </div>
            <div class="panel-body">
                <table class="table table-striped table-bordered">
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Age</th>
                        <th>Date Of Birthday</th>
                        <th>Faculty</th>
                    </tr>

                    <!-- loop over and print our customers -->
                    <c:forEach var="tempCustomer" items="${students}">
                        <tr>
                            <td>${tempCustomer.firstName}</td>
                            <td>${tempCustomer.lastName}</td>
                            <td>${tempCustomer.age}</td>
                            <td>${tempCustomer.dateOfBirthday}</td>
                            <td>${tempCustomer.faculty}</td>
                        </tr>
                    </c:forEach>

                </table>

            </div>

            <div align="center">
                <h1>Spring MVC Excel View(Apache POI)</h1>
                <h3><a href="/report">Download Excel Document</a></h3>
            </div>
        </div>
    </div>

</div>
</body>
</html>
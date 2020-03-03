<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>

<head><%@ page isELIgnored="false" %>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Main</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</head>

<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand">Managment System</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
            aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-item nav-link" href="showForm">Add Student</a>
                <a class="nav-item nav-link" href="/report">Download Excel Document</a>
            </div>
        </div>
    </nav>
    <c:set value="${userList}" var="userPageList" />
    <div class="container">
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Surname</th>
                    <th scope="col">Age</th>
                    <th scope="col">Date of birthday</th>
                    <th scope="col">Faculty</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>

                <c:forEach items="${userPageList.pageList}" var="tempStudent">

                    <c:url var="updateLink" value="/student/updateForm">
                        <c:param name="studentId" value="${tempStudent.id}" />
                    </c:url>

                    <c:url var="deleteLink" value="/student/delete">
                        <c:param name="studentId" value="${tempStudent.id}" />
                    </c:url>

                    <tr>
                        <td>${tempStudent.firstName}</td>
                        <td>${tempStudent.lastName}</td>
                        <td>${tempStudent.age}</td>
                        <td>${tempStudent.dateOfBirthday}</td>
                        <td>${tempStudent.faculty}</td>
                        <td>
                            <a href="${updateLink}">Edit</a>
                            <a href="${deleteLink}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <c:choose>
            <%-- Show Prev as link if not on first page --%>
            <c:when test="${userPageList.firstPage}">
                <span>Prev</span>
            </c:when>
            <c:otherwise>
                <c:url value="/student/prev" var="url" />
                <a href='<c:out value="${url}" />'>Prev</a>
            </c:otherwise>
        </c:choose>
        <c:forEach begin="1" end="${userPageList.pageCount}" step="1" varStatus="tagStatus">
            <c:choose>
                <%-- In PagedListHolder page count starts from 0 --%>
                <c:when test="${(userPageList.page + 1) == tagStatus.index}">
                    <span>${tagStatus.index}</span>
                </c:when>
                <c:otherwise>
                    <c:url value="/student/${tagStatus.index}" var="url" />
                    <a href='<c:out value="${url}" />'>${tagStatus.index}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:choose>
            <%-- Show Next as link if not on last page --%>
            <c:when test="${userPageList.lastPage}">
                <span>Next</span>
            </c:when>
            <c:otherwise>
                <c:url value="/student/next" var="url" />
                <a href='<c:out value="${url}" />'>Next</a>
            </c:otherwise>
        </c:choose>


        <div id="pagination">
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">Previous</a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

</body>

</html>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head xmlns:form="http://www.w3.org/1999/html">
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

    <h2 align="center">Add or Edit student</h2>
    <div class="container">
        <form:form action="saveStudent" method="POST" modelAttribute="student">

            <form:hidden path="id" />

            <div class="form-group">
                <label>Name</label>
                <td>
                    <form:input path="firstName" class="form-control" maxlength="20" size="20"/>
                </td>
            </div>

            <div class="form-group">
                <label>Surname</label>
                <td>
                    <form:input path="lastName" class="form-control" maxlength="20" size="20"/>
                </td>
            </div>

            <div class="form-group">
                <label>Age</label>
                <td>
                    <form:input path="age" class="form-control" type="number" min="1" max="150"/>
                </td>
            </div>

            <div class="form-group">
                <label>Date of birthday </label>
                <td>
                    <form:input path="dateOfBirthday" class="form-control" type="date" />
                </td>
            </div>

            <div class="form-group">
                <label>faculty</label>
                <td>
                    <form:input path="faculty" class="form-control" maxlength="20" size="20" />
                </td>
            </div>

            <button type="submit" class="btn btn-primary" value="submit">Submit</button>
        </form:form>
    </div>

</body>

</html>
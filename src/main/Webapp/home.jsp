<!--
*
*  JSP Assignment 2
*  Wyatt LeMaster
*  5/2/2023
*  JSP to display the home page and handle displaying the book data as well as reservations
*
*
-->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.UserModel" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <link href="<c:url value="css/sign-in.css" />" rel="stylesheet">
    <link href="<c:url value="css/headers.css" />" rel="stylesheet">
    <link href="<c:url value="css/dropdowns.css" />" rel="stylesheet">

    <link href="headers.css" rel="stylesheet">
    <link href="<c:url value="css/bootstrap.min.css" />" rel="stylesheet">

    <link href="<c:url value="css/Style.css" />" rel="stylesheet">
    <title>Sessions and Cookies</title>


</head>
<body>

<main>

    <style>
        th, td {
            padding: 15px;
        }

        tr:nth-child(even) {
            background-color: #D6EEEE;
        }

        .dropdown:hover .dropdown-content {display: block;}
    </style>

    <%
        boolean isLoggedIn = false;
        UserModel user = null;
        session.setAttribute("file", "home.jsp");
        try {
            isLoggedIn = (boolean) session.getAttribute("loggedIn");
        }
        catch(Exception e) {

        }

        String message = "";
        if (isLoggedIn) {

            user = (UserModel) session.getAttribute("user");
            message = user.getUsername();
        }
        else {
            message = "logged out";
        }
    %>


    <div class = "fixed-top">
        <div class="container">
            <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
                <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                    <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
                    <span class="fs-4">Hobby Helper</span>
                </a>

                <ul class="nav nav-pills">
                    <li class="nav-item"><a href="#" class="nav-link active" aria-current="page">Home</a></li>
                    <li class="nav-item"><a href="register.jsp" class="nav-link" aria-current="page">register</a></li>
                    <li class="nav-item"><a href="Login.jsp" class="nav-link" aria-current="page">Login</a></li>
                    <li class="nav-item"><a href="LogoutServlet" action="LogoutServlet" method="post" onclick="return validate()" class="nav-link" aria-current="page">Logout</a></li>
                    <li class="nav-item"><a href="ReserveNavServlet" action="ReserveNavServlet" method="post" onclick="return validate()" class="nav-link" aria-current="page">Reservations</a></li>

                </ul>
                <p><h2><%=message%></h2></p>
            </header>
        </div>
    </div>
</main>

<div class="px-4 pt-5 my-5 text-center border-bottom justify-content-center  flex-fill">
    <h1 class="display-4 fw-bold text-body-emphasis">Find a friend</h1>
    <div class="col-lg-6 mx-auto">
        <p class="lead mb-4">Find a friend</p>
        <div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">
<!--
            <form action="FetchBookServlet" method="post" onsubmit="return validate()">
                <h1 class="h3 mb-3 fw-normal">Search</h1>

                <select name="topic_id">
                    <option value="999">All</option>
                    <c:forEach var="each_topic" items="${list_of_Topics}">

                        <option value="${each_topic.getTopic_id()}">${each_topic.getTopic_name()}</option>

                    </c:forEach>
                </select>
                <input type="submit" value="Filter" />

                <input type="Button" value="Reserve Book" action="ReserveNavServlet" onclick="document.location='ReserveNavServlet'"/>
            </form>
-->
        </div>
    </div>

    <div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">
        <div class="container px-5">
            <form action ="FetchRecommendedFriends" method="post">
                <div class="form-floating">
                   <!-- <input id="Res_Book_ID" name="Res_Book_ID" type="text" placeholder="Res_Book_ID"/> <br/>-->
                    <input type="submit" value="Find" />
                </div>
            </form>
        </div>
    </div>
        <div class="d-grid gap-2 d-sm-flex justify-content-sm-center mb-5">

        <div class="overflow-scroll" style="max-height: 30vh;">

            <div class="container px-5">
            <table>
                    <tr>
                        <th>Friend name </th>
                        <th>email </th>
                        <th># of activities shared  </th>

                    </tr>
                <c:forEach var="each_friend" items="${list_of_friends}">
                    <tr>
                        <td>${each_friend.getFname()}, ${each_friend.getLname()}</td>

                        <td>${each_friend.getEmail()}</td>
                        <td>${each_friend.getActivity_list().size()}</td>

                    </tr>
                </c:forEach>
                </table>

            </div>
        </div>
    </div>
</div>




<p>${error}</p>

</body>

</html>

<!-- Sources:
https://mkyong.com/spring-mvc/spring-mvc-how-to-include-js-or-css-files-in-a-jsp-page/
https://www.w3schools.com/howto/howto_css_dropdown.asp
-->
<!doctype html>
<%@ page import="com.service.VerifySession" %>
<%--<%@ page errorPage="../error_pages/error_page1.jsp" %>--%>
<html lang="en" >
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="resources/css/user.css">
    <title>Document</title>
</head>
<body>
<%
if(VerifySession.verifySession(request, response)){
return;
}%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@ include file='../header.jsp' %>
    <%@ include file='../categoryBar.jsp' %>
    <div class="inline-list inline-wrap block-margin inline-margin">
    <%@ include file="../productDisplay.jsp" %>
    </div>

</body>
</html>
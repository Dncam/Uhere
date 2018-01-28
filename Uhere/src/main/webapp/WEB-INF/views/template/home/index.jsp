<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta charset="ISO-8859-1">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title><fmt:message key="home.title" /></title>
		<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet">
		<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		      <script src="https://oss.maxcdn.com/htm l5shiv/3.7.3/html5shiv.min.js"></script>
		      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		      <![endif]-->
	</head>
	<body>
		<tiles:insertAttribute name="menu-superior" />
		<tiles:insertAttribute name="body"/>
		<tiles:insertAttribute name="footer" />
	</body>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/scripts.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/resources/js/jUhereAuto.js"/>"></script>
</html>
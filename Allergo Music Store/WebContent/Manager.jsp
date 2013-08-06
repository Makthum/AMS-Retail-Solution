<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<f:view>
<h1 align="center"> Manager Main Menu </h1><br><br><br>
<h:form><center>
			<h:commandButton value="Add Item" style="width: 125px; " action="addItem"></h:commandButton><br>
			<br>
			<br>
			<h:commandButton value="Process Set" style="width: 125px; " action="processDelivery"></h:commandButton><br>
			<br>
			<br>
			<h:commandButton value="Sales Report" style="width: 125px; " action="dailySalesReport"></h:commandButton><br>
			<br>
			<br><h:commandButton value="Selling Items" style="width: 125px; " action="topSellingReport"></h:commandButton>
		</center></h:form></f:view>
</body>
</html>
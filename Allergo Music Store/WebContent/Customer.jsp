<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="style.css"></link>

<title>Insert title here</title>
</head>
<body>
<f:view>
<br>
<br>
<h:form>
   <h:commandLink id="logout" action="#{student.logout }" styleClass="logout">
			<h:outputText value="Logout"></h:outputText>
		</h:commandLink></h:form>
<h1 align="center"> Customer Main Menu </h1>
<br>

<br>
<br>
<br>
<h:form><center>
			<h:commandButton value="Register" style="width: 135px; " action="registerCustomer"></h:commandButton><br>
			<br>
			<br>
			<h:commandButton value="Purchase Item" style="width: 135px; " action="checkout"></h:commandButton><br>
			
		</center></h:form></f:view>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css"></link>
</head>
<body bgcolor="FFFF34">
<f:view>
        <br>
        <br>
		<h1 align="center"> Allegro Music Store</h1>
		<br>
		<br>
		<br>
		<br>
		<h:form>
			<center>
			<h:panelGrid border="0" columns="2" style="width: 295px; ">
				<h:outputText value="Username"></h:outputText>
				<h:inputText value="#{student.userId}"></h:inputText>
				<h:outputText value="password"></h:outputText>
				<h:inputSecret value="#{student.password}"></h:inputSecret>
				
			</h:panelGrid>
			<br>
			New Customers click <h:commandLink action="registerCustomer">
				<h:outputText value="Here" ></h:outputText>
			</h:commandLink>
			<br>
			<br>
			<h:commandButton action="#{student.login}" value="Login" style="width: 106px; "/><br><br><h:outputLabel
					value="#{student.errorMessage }"></h:outputLabel>
			</center>
			


			</h:form></f:view>
</body>
</html>
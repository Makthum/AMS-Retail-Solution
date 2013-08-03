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
<h1 align="center">Customer Registration Form</h1>
<f:view>
<center>
<br>
<br>
<br>
<h:form>
		<h:panelGrid border="0" columns="2" style="height: 407px; width: 338px; ">
			<h:outputLabel value="UserId"></h:outputLabel>
			
				<h:inputText ></h:inputText>
			
			<h:outputLabel value="Name"></h:outputLabel>
				
			<h:inputText ></h:inputText>
			<h:outputLabel value="Address"></h:outputLabel>
				<h:inputText></h:inputText>
			
			<h:outputLabel value="Phone Number"></h:outputLabel>
				<h:inputText></h:inputText>
		
			<h:outputLabel value="Password"></h:outputLabel>
			
				<h:inputText></h:inputText>
			
			
			
		</h:panelGrid>
			<h:commandButton value="Register"></h:commandButton>
		</h:form></center>
	</f:view>
</body>
</html>
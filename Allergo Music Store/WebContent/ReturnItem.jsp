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
<h1 align="center">Return Item Menu</h1>
<f:view>
<h:form><br><br><br>
		<center><h:panelGrid border="0" columns="2" style="height: 123px; width: 326px; ">
			

				<h:outputLabel value="Receipt ID"></h:outputLabel>
			
			
			
				<h:inputText></h:inputText>
			
			<h:outputLabel value="UPC"></h:outputLabel>
			
			
				<h:inputText></h:inputText>
			
		</h:panelGrid><br>
		<br>
			<h:commandButton value="Return Item"></h:commandButton>
		</center></h:form>
	</f:view>
</body>
</html>
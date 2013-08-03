<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Item Page </title>
</head>
<body>
<h1 align="center"> Add Items to Store</h1><br>
<br><br>
<f:view>
<center><h:form>
		<h:panelGrid border="0" columns="2" style="width: 363px; height: 306px">
			<h:outputLabel value="UPC"></h:outputLabel>
			
				<h:inputText></h:inputText>
			
			<h:outputLabel value="TITLE"></h:outputLabel>
			
				<h:inputText></h:inputText>
			
			<h:outputLabel value="TYPE"></h:outputLabel>
		
				<h:inputText></h:inputText>
		
			<h:outputLabel value="CATEGORY"></h:outputLabel>
		
				<h:inputText></h:inputText>
			
			<h:outputLabel value="COMPANY"></h:outputLabel>
			
				<h:inputText></h:inputText>
		
			<h:outputLabel value="PRICE"></h:outputLabel>
				<h:inputText></h:inputText>
		
			
			<h:outputLabel value="STOCK"></h:outputLabel>
			
				<h:inputText></h:inputText>
			
			
			
		</h:panelGrid> <br><br>
			<h:commandButton value="Add Item"></h:commandButton></h:form>
		</center>
	</f:view>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Item Page </title>
<link rel="stylesheet" type="text/css" href="style.css"></link>

</head>
<body>

<f:view>
 		<h:form>
   <h:commandLink id="logout" action="#{student.logout }" styleClass="logout">
			<h:outputText value="Logout"></h:outputText>
		</h:commandLink></h:form>
<br>
<br>
<h1 align="center"> Add Items to Store</h1><br>
<br><br>
	
<center><h:form>

		<h:panelGrid border="0" columns="2" style="width: 363px; height: 306px">
			<h:outputLabel value="UPC"></h:outputLabel>
			
				<h:inputText value="#{item.UPC }"></h:inputText>
			
			
			
				
			
			
		
				
		
			
		
				
			
			
			
				
		
			<h:outputLabel value="PRICE"></h:outputLabel>
				<h:inputText value="#{item.price }"></h:inputText>
		
			
			<h:outputLabel value="STOCK"></h:outputLabel>
			
				<h:inputText value="#{item.quantity }"></h:inputText>
			
			
			
		</h:panelGrid> <br><br>
			<h:commandButton value="Add Item" action="#{item.updateItem }"></h:commandButton>
			
			<br>
			<br>
				<h:outputLabel value="#{item.errorMessage }"></h:outputLabel>
			</h:form>
		</center>
	</f:view>
</body>
</html>
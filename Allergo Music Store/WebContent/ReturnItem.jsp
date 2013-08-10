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
<body>
<f:view><h:form>
   <h:commandLink id="logout" action="#{student.logout }" styleClass="logout">
			<h:outputText value="Logout"/>
		</h:commandLink></h:form><br><br>
<h1 align="center">Return Item Menu</h1>
<h:form><br><br><br>
		<center><h:panelGrid border="0" columns="2" style="height: 123px; width: 326px; ">
			

				<h:outputLabel value="Receipt ID"></h:outputLabel>
			
			
			
				<h:inputText value="#{returnItem.receiptid}"></h:inputText>
			
			<h:outputLabel value="UPC"></h:outputLabel>
			
			
				<h:inputText value="#{returnItem.upc}"></h:inputText>
					<h:outputLabel value="Quantity"></h:outputLabel>
					<h:inputText value="#{returnItem.quantity}"></h:inputText>

				</h:panelGrid><br>
		<br>
			<h:commandButton value="Return Item" action="#{returnItem.saveReturn}"></h:commandButton>
		</center></h:form>
	</f:view>
</body>
</html>
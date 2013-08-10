<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Card Payment</title>
<link rel="stylesheet" type="text/css" href="style.css"></link>

</head>
<body>
<f:view>
<h:form>
   <h:commandLink id="logout" action="#{student.logout }" styleClass="logout">
			<h:outputText value="Logout"></h:outputText>
		</h:commandLink></h:form><h:form>
<br>
<br>
<h1 align="center"> Credit Card Information</h1>
<br>
<br>
		<h:panelGrid border="0" columns="2" style="height: 97px; width: 312px; ">
			<h:outputLabel value="Card No"></h:outputLabel>
			
				<h:inputText value="#{purchase.cardNo }"></h:inputText>
		
			
				<h:outputLabel value="Expiry Date"></h:outputLabel>
			
			<h:inputText value="#{purchase.expiryDate}">  </h:inputText>
			
			
		</h:panelGrid><br>
		<br>
			<h:commandButton value="continue" action="#{purchase.generateOrder }" ></h:commandButton>
		</h:form>
	</f:view>
</body>
</html>
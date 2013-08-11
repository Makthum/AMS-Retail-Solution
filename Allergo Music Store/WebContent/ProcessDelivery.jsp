<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Process Order</title>
<link rel="stylesheet" type="text/css" href="style.css"></link>

</head>
<body>
<f:view><h:form>
   <h:commandLink id="logout" action="#{student.logout }" styleClass="logout">
			<h:outputText value="Logout"/>
		</h:commandLink>
<br><br>
<h1 align="center">Process Orders</h1><br>
<br><br>
<center>
			<h:panelGrid border="0" columns="2" style="height: 139px; width: 337px; ">
				<h:outputLabel value="ReceiptId"></h:outputLabel>
					<h:inputText value="#{item.receiptId }"></h:inputText>
			
				<h:outputLabel value="Delivered Date"></h:outputLabel>
					<h:inputText value="#{item.deliveryDate }"></h:inputText>
				
				
			
			</h:panelGrid>	<br>
				<br>
				<br>
				<h:commandButton  value="Set Delivery Date" action="#{item.setDelDate }"></h:commandButton>
				<br>
				<br>
				<h:outputLabel value="#{item.errorMessage }"></h:outputLabel>

			</center>
</h:form></f:view>
</body>
</html>
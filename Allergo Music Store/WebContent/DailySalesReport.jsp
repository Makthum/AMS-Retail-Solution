<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Daily sales Report</title>
<link rel="stylesheet" type="text/css" href="style.css"></link>

</head>
<body>

<f:view>
<h:form>
   <h:commandLink id="logout" action="#{student.logout }" styleClass="logout">
			<h:outputText value="Logout"></h:outputText>
		</h:commandLink></h:form>
<h:form><br> <br> <br>
<h1 align="center"> Daily Sales Report</h1><br>
<br>
		<center><h:panelGrid border="0" columns="3" style="width: 590px; ">
			<h:outputText value="Sales Report on"></h:outputText>
		
				<h:inputText value="#{report.date }"></h:inputText>
			
					<h:commandButton value="Generate Report" action="#{report.dailySalesReport }"></h:commandButton>
				
			
			
		</h:panelGrid>
		
		<br>
		<br>
		<br>
		
		<h:dataTable border="1" value="#{report.dailyReport}" var="items" styleClass="CSSTableGenerator">
				<h:column id="column1">
					<f:facet name="header">
						<h:outputText value="UPC"/>
					</f:facet>
					<h:outputLabel value="#{items.UPC} "/>
				</h:column>
				<h:column id="column2">
					<f:facet name="header">
						<h:outputText value="Category"/>
					</f:facet>
					<h:outputLabel value="#{items.category} "/>
				</h:column>
				<h:column id="column3">
					<f:facet name="header">
						<h:outputText value="Price"/>
					</f:facet>
					<h:outputLabel value="#{items.price} "/>
				</h:column>

<h:column id="column5">
					<f:facet name="header">
						<h:outputText value="Quantity"/>
					</f:facet>
					<h:outputLabel value="#{items.quantity} "/>
				</h:column>	
				
				<h:column id="column4">
					<f:facet name="header">
						<h:outputText value="Total Value"/>
					</f:facet>
					<h:outputLabel value="#{items.totalPrice} "/>
				</h:column>	
						</h:dataTable>
				<h:outputLabel value="Total"></h:outputLabel>    
				<h:inputText value="#{report.dailySalesTotal }"></h:inputText>
			</center>
</h:form>
	</f:view>

</body>
</html>
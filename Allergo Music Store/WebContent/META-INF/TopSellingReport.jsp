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

<f:view><h:form>
   <h:commandLink id="logout" action="#{student.logout }" styleClass="logout">
			<h:outputText value="Logout"/>
		</h:commandLink></h:form>
<h:form><br>
<br>
<h1 align="center"> Top Sales Report</h1><br>
<br>
		<center><h:panelGrid border="0" columns="3" style="width: 590px; ">
			<h:outputText value="Sales Report on"></h:outputText>
		
				<h:inputText value="#{report.date }"></h:inputText>
			
					<h:commandButton value="Generate Report" action="#{report.TopnNSalesReport }"></h:commandButton>
					<h:outputLabel value="Top n Items"></h:outputLabel>
					<h:inputText value="#{report.number_items }"></h:inputText>



				</h:panelGrid>
		
		<br>
		<br>
		<br>
		
		<h:dataTable border="1" value="#{report.topItem_Report }" var="items" styleClass="CSSTableGenerator">
				<h:column id="column1">
					<f:facet name="header">
						<h:outputText value="Title"/>
					</f:facet>
					<h:outputLabel value="#{items.title} "/>
				</h:column>
				<h:column id="column2">
					<f:facet name="header">
						<h:outputText value="Company"/>
					</f:facet>
					<h:outputLabel value="#{items.company} "/>
				</h:column>
				<h:column id="column3">
					<f:facet name="header">
						<h:outputText value="Quantity"/>
					</f:facet>
					<h:outputLabel value="#{items.quantity} "/>
				</h:column>

<h:column id="column4">
					<f:facet name="header">
						<h:outputText value="No of Copies Sold"/>
					</f:facet>
					<h:outputLabel value="#{items.qtySold} "/>
				</h:column>	
				
				
						</h:dataTable>
		</center>
</h:form>
	</f:view>

</body>
</html>
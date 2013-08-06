<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Daily sales Report</title>
</head>
<body>
<h1 align="center"> Daily Sales Report</h1>
<f:view>
<h:form><br>
<br>
		<center><h:panelGrid border="0" columns="3" style="width: 590px; ">
			<h:outputText value="Sales Report on"></h:outputText>
		
				<h:inputText></h:inputText>
			
					<h:commandButton value="Generate Report"></h:commandButton>
				
			
			
		</h:panelGrid>
		
		<br>
		<br>
		<br>
		
		<h:dataTable border="1" value="#{shoppingCart.shoppingcart }" var="item">
				<h:column id="column1">
					<f:facet name="header">
						<h:outputText value="UPC"/>
					</f:facet>
					<h:outputLabel value="#{} "/>
				</h:column>
				<h:column id="column2">
					<f:facet name="header">
						<h:outputText value="Category"/>
					</f:facet>
					<h:outputLabel value="#{} "/>
				</h:column>
				<h:column id="column3">
					<f:facet name="header">
						<h:outputText value="Price"/>
					</f:facet>
					<h:outputLabel value="#{} "/>
				</h:column>

<h:column id="column5">
					<f:facet name="header">
						<h:outputText value="Quantity"/>
					</f:facet>
					<h:outputLabel value="#{} "/>
				</h:column>	
				
				<h:column id="column4">
					<f:facet name="header">
						<h:outputText value="Total Value"/>
					</f:facet>
					<h:outputLabel value="#{} "/>
				</h:column>	
						</h:dataTable>
		</center>
</h:form>
	</f:view>

</body>
</html>
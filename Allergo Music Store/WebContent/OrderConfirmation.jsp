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
<f:view>

<center><h1> Order Confirmation </h1><br>
<br><br>
			<h:panelGrid border="0" columns="4" style="width: 641px; ">
				<h:outputLabel value="Receipt Id "></h:outputLabel>
				<h:form>
					<h:inputText readonly="false" value="#{purchase.receiptId} "></h:inputText>
				</h:form>
				<h:outputLabel value="Date Purchased"></h:outputLabel>
				<h:form>
					<h:inputText readonly="false" value="#{purchase.purchasedDate }"></h:inputText>
				</h:form>
				<h:outputLabel value="Customer Id"></h:outputLabel>
				<h:form>
					<h:inputText readonly="false" value="#{purchase.customerId }"></h:inputText>
				</h:form>
				<h:outputLabel value="Total Amount"></h:outputLabel>
				<h:form>
					<h:inputText readonly="false" value="#{purchase.totalprice }"></h:inputText>
				</h:form>
				
				
				
			</h:panelGrid>
			
			<br>
			<br>
			<br>
			<h:dataTable border="1" value="#{shoppingCart.shoppingcart }" var="item">
				<h:column id="column1">
					<f:facet name="header">
						<h:outputText value="Title"/>
					</f:facet>
					<h:outputLabel value="#{item.title} "/>
				</h:column>
				<h:column id="column2">
					<f:facet name="header">
						<h:outputText value="UPC"/>
					</f:facet>
					<h:outputLabel value="#{item.UPC} "/>
				</h:column>
				<h:column id="column3">
					<f:facet name="header">
						<h:outputText value="Category"/>
					</f:facet>
					<h:outputLabel value="#{item.category} "/>
				</h:column>

<h:column id="column4">
					<f:facet name="header">
						<h:outputText value="Quantity"/>
					</f:facet>
					<h:outputLabel value="#{item.quantity} "/>
				</h:column>			</h:dataTable>
		</center>
</f:view>
</body>
</html>
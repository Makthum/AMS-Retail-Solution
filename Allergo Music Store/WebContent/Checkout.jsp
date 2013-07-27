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



		<h:form id="myform">
			
			
			<h:outputLabel value="UPC"></h:outputLabel><h:inputText value="#{shoppingCart.item.UPC}"></h:inputText>
			<h:outputLabel value="Title"></h:outputLabel>
			<h:inputText value="#{shoppingCart.item.title }"></h:inputText>
			<h:outputLabel value="Cateogry"></h:outputLabel>
			<h:inputText  value="#{shoppingCart.item.category }"></h:inputText>
			<h:outputLabel value="Quantity"></h:outputLabel>
			<h:inputText value="#{shoppingCart.item.quantity }"></h:inputText>
			<h:commandButton value="AddtoCart" action="#{shoppingCart.AddCart }" ></h:commandButton>
			<h:commandButton value="Search" action="#{shoppingCart.search}"  ></h:commandButton>
			
			<h:dataTable border="1" value="#{shoppingCart.shoppingcart }" var="item">
				<h:column id="column1">
					<f:facet name="header">
						<h:outputText value="Title"></h:outputText>
					</f:facet>
					<h:outputLabel value="#{item.title} "></h:outputLabel>
				</h:column>
				<h:column id="column2">
					<f:facet name="header">
						<h:outputText value="UPC"></h:outputText>
					</f:facet>
					<h:outputLabel value="#{item.UPC} "/>
				</h:column>
				<h:column id="column3">
					<f:facet name="header">
						<h:outputText value="Category"></h:outputText>
					</f:facet>
					<h:outputLabel value="#{item.category} "/>
				</h:column>

<h:column id="column4">
					<f:facet name="header">
						<h:outputText value="Quantity"></h:outputText>
					</f:facet>
					<h:outputLabel value="#{item.quantity} "/>
				</h:column>			</h:dataTable>
			

			<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
			<h:outputText value="Total"></h:outputText>
			<h:inputText ></h:inputText>
			<h:commandButton value="Pay" action="#{shoppingCart.validateShoppingCart }"></h:commandButton>

		</h:form>
		
	</f:view>
</body>
</html>
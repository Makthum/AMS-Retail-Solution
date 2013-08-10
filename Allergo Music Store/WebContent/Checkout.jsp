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

<h1 align="center"> Order Menu </h1>

<f:view>



		<h:form id="myform">


<center>
			<h:panelGrid border="0" columns="3" style="width: 1001px; ">
				<h:outputLabel value="Title"></h:outputLabel><h:inputText value="#{shoppingCart.item.title }"></h:inputText><h:commandButton value="AddtoCart" action="#{shoppingCart.AddCart }" style="width: 136px; "></h:commandButton><h:outputLabel value="Cateogry"></h:outputLabel><h:inputText value="#{shoppingCart.item.category }"></h:inputText><h:commandButton value="Search" action="#{shoppingCart.search}" style="width: 137px; "></h:commandButton><h:outputLabel value="Quantity"></h:outputLabel><h:inputText value="#{shoppingCart.item.quantity }"></h:inputText>
					<h:outputText ></h:outputText><h:outputText value="LeadSinger"></h:outputText><h:inputText value="#{shoppingCart.item.leadSinger }"></h:inputText>
					
					
					



				</h:panelGrid></center>
			
			
			
			
			
			
			
			
			
			<br><br>
			
			<h:outputText value="#{shoppingCart.errorMessage}"></h:outputText><br><br>
			<center><h:dataTable border="1" value="#{shoppingCart.shoppingcart }" var="item">
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
				</h:column>			</h:dataTable></center>
			

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
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<h:outputText value="Total"></h:outputText> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
			<h:inputText value="#{shoppingCart.totalprice }" ></h:inputText><br>
			<br>
			<br>

		<center>	<h:panelGrid border="0" columns="2">
				<h:commandButton value="Pay" action="#{purchase.generateOrder }" style="width: 96px; ">
				<f:setPropertyActionListener value="#{shoppingCart.shoppingcart }" target="#{purchase.shoppingCart }"/>
				<f:setPropertyActionListener value="#{shoppingCart.totalprice }" target="#{purchase.totalprice }"/>
				<f:setPropertyActionListener value="#{userId}" target="#{purchase.customerId }"/>
				
				</h:commandButton>
				<h:selectOneRadio id="payment"value="#{shoppingCart.paymentMethod }" style="width: 315px; ">
					<f:selectItem itemValue="false" itemLabel="Pay by Cash"/>
   	<f:selectItem itemValue="true" itemLabel="Pay by Credit"/>
   	  <f:ajax render="payment" />
					</h:selectOneRadio>
			
			</h:panelGrid>
				<h:panelGrid border="1" columns="2" rendered="#{shoppingCart.paymentMethod}" id="payment" >
					<h:outputLabel value="Card No "></h:outputLabel>
					<h:inputText value="#{purchase.cardNo }"></h:inputText>
					<h:outputLabel value="Expiry Date"></h:outputLabel>
					<h:inputText value="#{purchase.expiryDate }"></h:inputText>
					
					
					
					
				</h:panelGrid>
			</center>
			

		</h:form>
		
	</f:view>
</body>
</html>
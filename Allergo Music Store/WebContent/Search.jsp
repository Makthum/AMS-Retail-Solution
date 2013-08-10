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
		</h:commandLink></h:form>
<h:form>
<br><br>
<center><h1>Item Search</h1>
<br>

<h:panelGrid border="0" columns="3" style="width: 1001px; ">
				<h:outputLabel value="Title"/><h:inputText value="#{shoppingCart.item.title }"/><h:commandButton value="Search" action="#{shoppingCart.search}" style="width: 137px; " /><h:outputLabel value="Cateogry"/><h:inputText value="#{shoppingCart.item.category }"/>
					<br><h:outputLabel value="Quantity" /><h:inputText value="#{shoppingCart.item.quantity }" /><br><h:outputText value="LeadSinger" /><h:inputText value="#{shoppingCart.item.leadSinger }" /><h:outputText/>
					
					
					



				</h:panelGrid>
				<h:outputText value="#{shoppingCart.errorMessage}"/>
<br>
<br>


		<h:dataTable border="1" value="#{shoppingCart.searchList }" var="item">
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
					<h:outputLabel value="#{item.UPC} "></h:outputLabel>
				</h:column>
				<h:column id="column3">
					<f:facet name="header">
						<h:outputText value="Category"></h:outputText>
					</f:facet>
					<h:outputLabel value="#{item.category} "></h:outputLabel>
				</h:column>

<h:column id="column4">
					<f:facet name="header">
						<h:outputText value="Quantity"></h:outputText>
					</f:facet>
					<h:outputLabel value="#{item.quantity} "></h:outputLabel>
				</h:column>	
<h:column id="column5">
					<f:facet name="header">
						<h:outputText value="Select"></h:outputText>
					</f:facet>
			
					<h:selectBooleanCheckbox value="#{shoppingCart.checked[item.UPC] }"></h:selectBooleanCheckbox>
			
				</h:column>			</h:dataTable>
				<br>
				<br>
				<br>
			<h:commandButton value="Add to Cart" action="#{shoppingCart.AddSearchedItems }" onclick="openWin()"></h:commandButton>
		<script type="text/javascript" language = "JavaScript"> 
function openWin()
{
	
    window.opener.location.reload();
	window.close();


}
</script>
		</center></h:form>
	</f:view>
</body>
</html>
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

		<h:panelGrid border="1" columns="2">
			<h:outputLabel value="UPC"></h:outputLabel>
			<h:form>
				<h:inputText></h:inputText>
			</h:form>
			<h:outputLabel value="TITLE"></h:outputLabel>
			<h:form>
				<h:inputText></h:inputText>
			</h:form>
			<h:outputLabel value="TYPE"></h:outputLabel>
			<h:form>
				<h:inputText></h:inputText>
			</h:form>
			<h:outputLabel value="CATEGORY"></h:outputLabel>
			<h:form>
				<h:inputText></h:inputText>
			</h:form>
			<h:outputLabel value="COMPANY"></h:outputLabel>
			<h:form>
				<h:inputText></h:inputText>
			</h:form>
			<h:outputLabel value="PRICE"></h:outputLabel><h:form>
				<h:inputText></h:inputText>
			</h:form>
			
			<h:outputLabel value="STOCK"></h:outputLabel>
			<h:form>
				<h:inputText></h:inputText>
			</h:form>
			
			
		</h:panelGrid><h:form>
			<h:commandButton value="Add Item"></h:commandButton>
		</h:form>
	</f:view>
</body>
</html>
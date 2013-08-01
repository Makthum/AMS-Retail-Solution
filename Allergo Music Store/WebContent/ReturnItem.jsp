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
			<h:form>

				<h:outputLabel value="Receipt ID"></h:outputLabel>
			</h:form>
			
			<h:form>
				<h:inputText></h:inputText>
			</h:form>
			<h:outputLabel value="UPC"></h:outputLabel>
			
			<h:form>
				<h:inputText></h:inputText>
			</h:form>
		</h:panelGrid><h:form>
			<h:commandButton value="Return Item"></h:commandButton>
		</h:form>
	</f:view>
</body>
</html>
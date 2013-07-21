<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsf/core"%>
<%@ taglib prefix="h"  uri="http://java.sun.com/jsf/html"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to AMS</title>
</head>
<body>
<f:view>



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
	<center>	<h:panelGrid border="0" columns="1" style="height: 263px; width: 324px; ">
		<h:form>	<h:commandButton type="submit" action="instore" value="In-Store checkout" style="width: 274px; height: 44px"></h:commandButton><h:commandButton value="On-Line check out" style="width: 274px; height: 44px"></h:commandButton><h:commandButton value="Logout" style="width: 274px; height: 44px"></h:commandButton>
				
				



			</h:form>	</h:panelGrid></center>
	</f:view>
</body>
</html>
<!-- This page is displayed when the mean of the numbers is greater than 90 -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.util.HashMap"%>
    <%@page import=" java.util.Iterator"%>
    <%@page import=" java.util.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib prefix="s" uri="/struts-tags" %>
</head>
<body bgcolor = #eeeeee>
<center><h1><strong><em>Thank You for filling out the form</em></strong></h1></center>
<center><h2>Congratulations!!!!!!!! You have just now won two movie tickets</h2></center>


<br><br>
<center>
	<table cellpadding="12" cellspacing="12" border="12">
		<tr><td><strong>Mean :</strong><s:property value="wr.getMean()"/></td></tr><br/>
		<tr><td><strong>Standard Deviation :</strong><s:property value="wr.getStdDev()"/></td></tr>
		<tr><td><strong><em>Data is stored successfully</em></strong></td></tr>
	</table>
</center>
<br><br>
<center><h3>Select a student to get the entire details</h3></center>
<br/>
<center>
<s:iterator value="idlist" >
<table align="center">
<ul>
<tr><td><li><a href="/Assign4/id?studentId=<s:property/>"><s:property/></a></li></td></tr>
</ul>
</table>
</s:iterator>
</center>
</body>
</html>
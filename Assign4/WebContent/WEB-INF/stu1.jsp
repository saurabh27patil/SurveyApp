<!-- This jsp is used to display the details of the student as selected by the user -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body bgcolor = #eeeeee>
<s:form name = "display" theme="simple" >
<center><h1><strong><em>Student Details</em></strong></h1></center>
<center>
	<table  border="10" width = "90%">
	<tr>	
	<td><strong>Student ID :<br/></strong><s:property value="studbean1.getStudentId()"/></td>
	<td><strong>Username :<br/></strong><s:property value="studbean1.getUserName()"/></td>
	<td><strong>Street Address :<br/></strong><s:property value="studbean1.getStreetAddress()"/></td>
	</tr>
	
	<tr>
	<td><strong>ZIP :<br/></strong><s:property value="studbean1.getZip()"/></td>
	<td><strong>City :<br/></strong><s:property value="studbean1.getCity()"/></td>
	<td><strong>State :<br/></strong><s:property value="studbean1.getState()"/></td>
	</tr>
	
	<tr>
	<td><strong>Telephone :<br/></strong><s:property value="studbean1.getTelephone()"/></td>
	<td><strong>Email id :<br/></strong><s:property value="studbean1.getEmail()"/></td>
	<td><strong>Date of Survey :<br/></strong><s:property value="studbean1.getDateofsurvey()"/></td>
	</tr>
	
	<tr>
	<td><strong>URL :<br/></strong><s:property value="studbean1.getUrl()"/></td>	
	<td><strong>Graduation Month :<br/></strong><s:property value="studbean1.getGradDate()"/></td>
	<td><strong>Year :<br/></strong><s:property value="studbean1.getYear()"/></td>
	</tr>
	
	<tr>
	
	<td><strong>What did you like  about the University:<br/></strong><s:property value="studbean1.getCheckbox()"/></td>
	<td><strong>How did you get interested in the university :<br/></strong><s:property value="studbean1.getRadio()"/></td>
	<td><strong>How likely is it that you will recommend this university to others?:<br/></strong><s:property value="studbean1.getLikelihood()"/></td>
	</tr>
	
	<tr>
	<td><strong>Additional comments :<br/></strong><s:property value="studbean1.getText()"/></td>
	</tr>
</table>
</center>
</s:form>
</body>
</html>
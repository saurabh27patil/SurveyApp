<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Document</title>
   
  <link rel="stylesheet" href="jquery-ui.css">
  <script src="jquery.js"></script>
   <script src="jquery-ui.js"></script>


  <script>
  $(function(){
	  $("#tabs").tabs();
  });
  </script>
 </head>
 <body style=" background-color:grey">
  <div id="tabs">
  <ul>
    <li><a href="#tab-1">Tab-1</a></li>
    <li><a href="info.jsp">Tab-2</a></li>
	<li><a href="#tab-3">Tab-3</a></li>
  </ul>
  <div id="tab-1"> 
<h1 ><b>Welcome to the homepage of SWE 642</b></h1>
  </div>
  <div id = "tab-3">
  <h3><a href="survey1.jsp">Please click here if you wish to fill in the George Mason Survey form....</a></h3>
</div>
  </div>
 </body>
</html>
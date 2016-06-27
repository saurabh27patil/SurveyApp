<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<head> 
<title>GMU Computer Science</title> 
<link rel= "stylesheet" type ="text/css" href = "styles.css">
  <link rel="stylesheet" href="jquery-ui.css">

<script src="jquery.js"></script>
  <script src="jquery-ui.js"></script>
 <script>
  $(function() {
    $( document ).tooltip({
      items: "img",
      content: function() {
        var element = $( this );
        if ( element.is( "img" ) ) {
          return element.attr( "alt" );
        }
      }
	      });
  });
  </script>
  <style>
  .ui-tooltip {
    max-width: 500px;
  }
  </style>
</head>
<body>
<img src="top.png" width = "100%" height ="150"alt="Computer Science HomePage" >
  <p>  Welcome to the <b>Department of Computer Science</b>. The department offers BS, MS, and PhD programs in Computer Science; MS programs in Software Engineering, Information Systems, and Information Security and Assurance; and a BS program in Applied Computer Science with various concentrations.The department also offers concentrations in the inter-disciplinary MS in Data Analytics Engineering and the PhD in Information Technology offered by the Volgenau School of Engineering.  </p>
<h4>Below is the list of MS Degrees with their required courses:</h4>
<ul>
    <li><h4>Masters of Science in Computer Science</h4></li>
	         <ul>
			 <li>CS 583 - Analysis of Algorithms Credits: 3 </li> 
			 <li>At least four courses (12 credits) must be chosen from the advanced courses in the list of preapproved courses from at least three different areas.</li>
			 <li>At least six courses, including two advanced courses, must be designated CS.</li>
			 <li>At least eight courses must be taken from the list of preapproved courses</li>
			 </ul>
	<li><h4>Masters of Science in Information Security and Assurance</h4></li>
	        <ul>
			 <li>ISA 562 Information Security Theory and Practice</li>
			 <li>ISA 656 Network Security</li>
			 <li>INFS 612 Principles and Practice of Communication Networks OR CS 555 - Computer Communications and Networking</li>
			 </ul>
	<li><h4>Masters of Science in Information Systems</h4></li>
	         <ul>
			  <li>INFS 612   Principles and Practices of Communication Networks </li>
              <li>INFS 614   Database Management</li>
              <li>INFS 622   Information Systems Analysis and Design</li>
              <li>ISA 562     Information Security Theory and Practice</li>
			 </ul>
	<li><h4>Masters of Science in Software Engineering</h4></li>
	           <ul>
			            <li>SWE 619   Object-Oriented Software Specification and Construction</li>
						<li>SWE 621   Software Modeling and Architectural Design</li>
						<li>SWE 622   Distributed Software Engineering</li>
						<li>SWE 637   Software Testing</li>
			   </ul>
</ul>
<p>Faculty in the department have research interests in networking, architecture, parallel and distributed computing, performance evaluation, software engineering, multimedia, graphics and visualization, databases, software engineering, data mining, security, information systems, artificial intelligence, computer vision, and robotics.</p>
<hr>
<hr>
<b><a href="survey1.jsp">Click here for a link to the take the student survey</a></b>
<div class="ui-widget photo">
<a href = "https://www2.gmu.edu/"><img src = "mason.jpeg" width = "400" height = "300" class="gmuimg" align="right" alt="Please visit http://www.gmu.edu for more 
information" class="ui-corner-all"></a>
</div>
<footer><p>-Saurabh Patil</p>
</footer>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

 <head>
  <title>Survey Form</title>
  <link rel= "stylesheet" type ="text/css" href = "styles.css"/>
   <link rel="stylesheet" href="jquery-ui.css"/>

   <script src="jquery.js"></script>
   <script src="jquery-ui.js"></script>
 
  <script type = "text/javascript">
  <!--
  var now = new Date(); // current date and time
   var hour = now.getHours(); // current hour (0-23)
  var name;
 
 if ( hour < 12) // determine whether it is morning
  document.write( "<h2>Good Morning, ");
  else
  {
    hour = hour - 12; // convert from 24-hour clock to PM time
 
  // determine whether it is afternoon or evening 
  if ( hour < 6)
 document.write( "<h2>Good Afternoon, " );
 else
 document.write( "<h2>Good Evening, ");
 } // end else
 if(document.cookie)
 {
	 var  myCookie = unescape(document.cookie);
	 var cookieTokens = myCookie.split("=");
	 name = cookieTokens[1];
 }
 else
 {
    name = window.prompt("Please enter your name?","");
	var date= new Date();
	date.setTime(date.getTime()+(15*365*24*60*60*1000));
	var expires=";expires="+date.toGMTString();	
	
	document.cookie = "name=" + escape( name )+expires+"; path=/"; 

 }
  document.writeln(name + ", welcome to Assignment#4</h2>" );
  document.writeln( "<a href = 'javascript:wrongPerson()'> " + "Click here if you are not "+ name +"</a>" );
  function wrongPerson()
 {
 name = window.prompt( "Please enter your name", "" );
var date= new Date();
	date.setTime(date.getTime()+(15*365*24*60*60*1000));
	var expires=";expires="+date.toGMTString();	
 document.cookie= "name=" +escape( name )+expires+"; path=/";

  // reload the page to get a new name after removing the cookie
 location.reload(); 
  }
  // -->
  
  function zipCode()
  {
     var zipFile = "zipFile.json";
     var http_request = new XMLHttpRequest();
     try{
        
           request = new XMLHttpRequest();
        }
     catch (e)
        {
        
        try
  	  {
            request = new ActiveXObject("Msxml2.XMLHTTP");
        }
  	  catch (e)
  	   {
           try
  		 {
             request = new ActiveXObject("Microsoft.XMLHTTP");
           }
  		 catch (e)
  		 {
              
              alert("Your browser broke!");
              return false;
           }
        }
     }
        request.onreadystatechange  = function(){
        if (request.readyState == 4  )
        {
          var flag=0;
          var jsObj = JSON.parse(request.responseText);
  		var zipc = document.getElementById("zip").value;
  		
  		for(var i=0;i<20;i++)
  		{
  		
  		 
  		 if(zipc==jsObj.zipcodes[i].zip)
           {
  	     document.getElementById("city").value =jsObj.zipcodes[i].city;
  		 document.getElementById("state").value =jsObj.zipcodes[i].state;
  		 flag =1;
  		 }
  		}
          if(flag==0)
  		{
          	 $( "#dialog" ).text("invalid zipcode");
         	  $( "#dialog" ).dialog();
  		}
        }
     }
     request.open("GET", zipFile, true);
     request.send();
  }

  function validate()
	  {
		  var msg = "";
	var patt = /^[A-Za-z]+$/;
	var n = document.getElementById("userName").value;
	if(patt.test(n)==false)
	{
		msg= msg + "\nThe username should contain only Alphabets";
		// $( "#dialog" ).text("The username should contain only Alphabets");
	 // $( "#dialog" ).dialog();
		document.getElementById("userName").value = "";
	
	}
	
	
	var patt1 = /^[A-Za-z0-9\s]+$/;
	var a = document.getElementById("streetAddress").value;
	if(patt1.test(a)==false)
	{
		msg= msg + "\nThe Address should contain only appropriate numeric, alphabet and alphanumeric characters";
		// $( "#dialog" ).text("\nThe Address should contain only appropriate numeric,alphabet and alphanumeric characters");
		//  $( "#dialog" ).dialog();
		document.getElementById("streetAddress").value = "";
	}
	

	//var cbox = document.forms['Survey'].elements['checkbox'];
	var cbox= document.getElementsByName("checkbox");
	var cflag=0;
	
	for(var i=0;i<cbox.length;i++)
	{
		if(cbox[i].checked==true)
		cflag++;
	}
	
	if(cflag<2)
	{
	msg= msg +"\nPlease make sure you check atleast two checkboxes";
	// $( "#dialog" ).text("\nPlease make sure you check atleast two checkboxes");
	 // $( "#dialog" ).dialog();
	
	}
	
	
	//var rbutton = document.forms['Survey'].elements['radio'];
	var rbutton = document.getElementsByName("radio");
	var rflag=0;
	
	for(var i=0;i<rbutton.length;i++)
	{
		if(rbutton[i].checked==true)
		rflag++;
	}
	
	if(rflag<1)
	{
	msg+="\nPlease make sure you check atleast one radio button";
	// $( "#dialog" ).text("\nPlease make sure you check atleast one radio button");
	//  $( "#dialog" ).dialog();
	
	}
	
	
	var patt2 = /^[A-Za-z0-9._-]+@[A-Za-z.-]+\.[A-Za-z]{2,4}$/;
	var e = document.getElementById("email").value;
	if(patt2.test(e)==false)
	{
		msg+="\nPlease enter a valid email Id";
		// $( "#dialog" ).text("\nPlease enter a valid email Id");
		//  $( "#dialog" ).dialog();
		document.getElementById("email").value = "";
	}
	
	
	 var studid = document.getElementById("studentId").value;
	 if(studid=="")
    {
		 msg+="\nStudent-id cannot be left empty ";
		
    }
	
	 var d = document.getElementById("data").value;
	 var s = d.split(",");
	 var flag=0;
	 for(var i=0;i<s.length;i++)
	 {
	 if(s[i]<1||100< s[i] || s.length < 10)
	 {
	 	 
	 flag=1;
	 }
	 }
	 if (flag ==1)
		 {
	 msg+="\nPlease Enter atleast 10 numbers between 1 and 100 ";
		 }
	
	if(msg!="")
	{
		 $( "#dialog" ).text(msg);
		  $( "#dialog" ).dialog();
	  return false;
		  
	}
	else return true;
	//	{
		//document.getElementById("Survey").submit();
//	}return false;
	}

 
 </script>
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
 <h1>  Survey </h1>
 <s:form name = "Survey" id  = "Survey"  autocomplete="on" theme="simple" action ="TestAction"  >
 <fieldset >
<legend>Survey Form:</legend>
 
   <br/>
  <table id="external" border="1" width="100%" >
  <tbody>
  <tr>
    <td>Student Id<br/><s:textfield  name="studentId" size="20" placeholder="ID" id="studentId"/></td>    
	<td>Username<br/><s:textfield  name="userName" maxlength = "15" placeholder="Username"  id ="userName"/></td>
	<td>Street Address<br/><s:textfield  name="streetAddress" maxlength = "50"  id="streetAddress" /> </td>
  </tr>
  <tr>
        <td>Zip<br/><s:textfield label="Zip:" name="zip" maxlength="5" placeholder="Zip Code" id = "zip" onblur ="zipCode()" /></td>
        <td>City<br/><s:textfield label="City:" id="city" name = "city"/> </td>
        <td>State<br/><s:textfield label="State:" id="state" name = "state"/></td>
   </tr>
    
   <tr>
        <td>Telephone<br/><s:textfield label="Telephone Number:" name="telephone"  maxlength="10" placeholder="(###) ###-####" id ="telephone" /></td>   
        <td>E-mail<br/><s:textfield label="E-Mail:" type = "email" name="email" maxlength="25" placeholder="user@domain.com"  autocomplete="off" id = "email" /></td>
        <td>Date of Survey<br/><s:textfield label="Date of Survey:" type="date" name="dateofsurvey" id = "dateofsurvey"/> </td>
  </tr>
  <tr>
       <td>URL<br/><s:textfield label="URL" type="url" name="url" maxlength="25" placeholder="url" id = "url" /></td> 
       <td>What did you like most about the Campus?<br/><s:checkboxlist label="What did you like most about the Campus" name="checkbox" id = "checkbox" key="user.checkbox" list="{'Students','Location','Campus','Atmosphere','Dorm','Sports'}" /></td>
       <td>How did you become interested in the University?<br/><s:radio label="How did you become interested in the University" name="radio" id= "radio" key="user.radio" list="{'Friends','Televison','Internet','Other'}" /></td>
</tr>
<tr>
       <td>Additional Comments:<br/><s:textarea  label="Please Leave your comments for us." key="user.comments" name="text"  />

       <td>How likely are you to recommend this university to others?<br/><s:select label="How likely are you to recommend this university to others" name="likelihood"  key="user.likelihood"
         headerValue="Please Select"
         headerKey="-1"
         list="%{{'Very Likely','Likely','Unlikely'}}"/></td>
        <td>High-School Graduation Date:<br/><s:select label="High-School Graduation: " key="user.gradDate" name="gradDate" placeholder="month"
         headerValue="Month"
         headerKey="-1"
         list="%{{'January','February','March','April','May','June','July','August','September','October','November','December'}}"/>
           Year <s:textfield label="Year: " type="text" name="year" key="user.year" placeholder="Year"/></td>
            
</tr>

 <tr><td>Enter any 10 number between 1 to 100 separated with , and you may win a movie ticket<br/><s:textfield name="data" id="data"  /></td></tr>      

<tr>
<td colspan = "3"><center><input  type="submit" name ="submit" value="Submit" onclick="return validate()" /><input type="reset" value="Reset"/></center></td>
</tr>
</tbody>
</table>
<br/><br/>
</fieldset>
<a href = "https://www2.gmu.edu/"><img src = "mason.jpeg" width = "400" height = "300" class="gmuimg" align = "right"alt ="Please visit http://www.gmu.edu for more information."/></a>


</s:form>

<div id="dialog" title="Model window error"> 
</div>

 </body>

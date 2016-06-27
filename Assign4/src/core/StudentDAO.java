package core;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



import bean.StudentBean;

public class StudentDAO  {
	 public void save(StudentBean studentBean) throws SQLException{
	       
	        
	       
	        
	        String userName = studentBean.getUserName();
            System.out.println(userName);
            String studentId = studentBean.getStudentId();
	        System.out.println(studentId);
	        String streetAddress = studentBean.getStreetAddress();
	        String zip = studentBean.getZip();
	        String city =studentBean.getCity();
	        String state =studentBean.getState();
	        
	        String telephone = studentBean.getTelephone();
	        String email = studentBean.getEmail();
	        String url = studentBean.getUrl();
	        String[] checkbox = studentBean.getCheckbox();
	        String likelihood = studentBean.getLikelihood();
	        String text = studentBean.getText();
			//studentBean.setcollege(college);
			//studentBean.setMonth(Month);
	        String gradDate = studentBean.getGradDate();
	        String year = studentBean.getYear();
	        String data = studentBean.getData();
	        String dateofsurvey = studentBean.getDateofsurvey();
	        String radio = studentBean.getRadio();
            System.out.println(radio);


            String temp="";
    		
    		for(int i=0;i<checkbox.length;i++)
    			temp = temp + checkbox[i] + " ";
 		
            System.out.println(temp);
            System.out.println(data);
	 		try {
	 			
	 				Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
	 			    Connection con ;
	 				con = DriverManager.getConnection("jdbc:oracle:thin:@apollo.ite.gmu.edu:1521:ite10g","spatil6","Bhiwandi43");
	 				 String query = "insert into studentinfo values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";	           
	 				PreparedStatement addEntry = con.prepareStatement(query);
	 				System.out.println("Connection established.");
	 			addEntry.setString(1, userName);
	 			addEntry.setString(2, studentId);
	 			addEntry.setString(3, streetAddress);
	 			addEntry.setString(4, zip);
	 			addEntry.setString(5, city);
	 			addEntry.setString(6, state);
	 			addEntry.setString(7, telephone);
	 			addEntry.setString(8, email);
	 			addEntry.setString(9, url);
	 			addEntry.setString(10,dateofsurvey);
	 			addEntry.setString(11, radio); 		
	 		
	 			addEntry.setString(12, temp);
	 			addEntry.setString(13, likelihood);
	 			addEntry.setString(14, data);
	 			addEntry.setString(15, text);
	 			addEntry.setString(16, gradDate);
                addEntry.setString(17, year);
	 			addEntry.executeUpdate(); 			
	 			addEntry.close();
	 			
	 			if(con!=null) {
	 				con.close();
	 				System.out.println("connection closed");
	 			}}
			catch(ClassNotFoundException ex) {
				   System.out.println("Error: unable to load driver class!");
				   System.exit(1);
				}
				catch(IllegalAccessException e) {
				   System.out.println("Error: access problem while loading!");
				   System.exit(2);
				}
				catch(InstantiationException exx) {
				   System.out.println("Error: unable to instantiate driver!");
				   System.exit(3);
				}
				catch(SQLException exxx){
					System.out.println("Error:SQLEXCEPTION");
					System.exit(4);
				}
			}
	 		
	 		//WinningResult wr=new WinningResult();
	 	
	
	public StudentBean retrieve(String studentId) {
 		StudentBean studentBean = new StudentBean();
 			try {
 				Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
                Connection con;
 				con = DriverManager.getConnection("jdbc:oracle:thin:@apollo.ite.gmu.edu:1521:ite10g","spatil6", "Bhiwandi43");
 			
 			

 		   Statement stmt = con.createStatement();
 	        studentId="'"+studentId+"'";

 			ResultSet rs = stmt.executeQuery("Select * from studentinfo where studentId =" + studentId);

 			while (rs.next()) {
 			//	DateFormat dateFormat = new SimpleDateFormat("E MMM dd HH:mm:ss Z yyyy");

 
 				studentBean.setUserName(rs.getString(1));
 	            
 		        studentBean.setStudentId(rs.getString(2));
 		        
 		        studentBean.setStreetAddress(rs.getString(3));
 		        studentBean.setZip(rs.getString(4));
 		        studentBean.setCity(rs.getString(5));
 		        studentBean.setState(rs.getString(6));
 		        
 		        studentBean.setTelephone(rs.getString(7));
 		        studentBean.setEmail(rs.getString(8));
 		        studentBean.setUrl(rs.getString(9));
 		       studentBean.setDateofsurvey(rs.getString(10));
 		       studentBean.setRadio(rs.getString(11));
 		      String tmp1 = rs.getString(12);
			   String[] tmp2 = tmp1.split(" ");
 		        studentBean.setCheckbox(tmp2);
 		        studentBean.setLikelihood(rs.getString(13));
 		       studentBean.setData(rs.getString(14));
 				studentBean.setText(rs.getString(15));
 				 
 				
 				
 				studentBean.setGradDate(rs.getString(16));
 				studentBean.setYear(rs.getString(17));
 		        
 				
 			}
 			con.close();

 	

 		} catch(ClassNotFoundException ex) {
			   System.out.println("Error: unable to load driver class!");
			   System.exit(1);
			}
			catch(IllegalAccessException e) {
			   System.out.println("Error: access problem while loading!");
			   System.exit(2);
			}
			catch(InstantiationException exx) {
			   System.out.println("Error: unable to instantiate driver!");
			   System.exit(3);
			}
			catch(SQLException exxx){
				System.out.println("Error:SQLEXCEPTION");
				System.exit(4);
			}
		
 		return studentBean;
 	}
    
}

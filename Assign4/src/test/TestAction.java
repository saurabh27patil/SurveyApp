package test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//import javax.servlet.http.HttpServletRequest;


import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import bean.StudentBean;
import bean.WinningResult;
import core.DataProcessor;
import core.StudentDAO;


public class TestAction extends ActionSupport implements ModelDriven<StudentBean> {
	private static final long serialVersionUID = 1L;
	//private HttpServletRequest servletRequest;
	private String data;
	private String[] idlist;
	private String studentId;
	private StudentBean studbean = new StudentBean();
	private StudentBean studbean1=new StudentBean();
	private WinningResult wr = new WinningResult();
	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String[] getIdlist() {
		return idlist;
	}

	public StudentBean getStudbean() {
		return studbean;
	}

	public void setStudbean(StudentBean studbean) {
		this.studbean = studbean;
	}

	public StudentBean getStudbean1() {
		return studbean1;
	}

	public void setStudbean1(StudentBean studbean1) {
		this.studbean1 = studbean1;
	}

	public WinningResult getWr() {
		return wr;
	}

	public void setWr(WinningResult wr) {
		this.wr = wr;
	}

	public void setIdlist(String[] idlist) {
		this.idlist = idlist;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	


	public String execute() throws SQLException{
	
		StudentDAO stu_dao = new StudentDAO();
		stu_dao.save(studbean);
		DataProcessor dp = new DataProcessor();
		 float mean;
		 mean= dp.meanCal(studbean.getData());
		 
		 double sd;
		 sd=dp.stdDevCal(studbean.getData(), mean);
		 
		 wr.setMean(mean);
		 wr.setStdDev(sd);

		String id_string = "";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@apollo.ite.gmu.edu:1521:ite10g","spatil6", "bhiwandi43");
			Statement stmt = con.createStatement();
			ResultSet result = stmt.executeQuery("Select studentId from studentinfo");
			while (result.next()) {
				id_string = id_string + result.getString(1) + ",";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		idlist = id_string.split(",");
		 
		 if (mean>90)
		 {
			 System.out.println("Mean greater than 90");
			 return "winner";
		 }
		 else
		 {
			 System.out.println("Mean less than 90");
			 return "simple";
		 }
	}
	public StudentBean getModel() {
		// TODO Auto-generated method stub
		return studbean;
	}
	public String getInfo() throws IOException { 
		System.out.println("Entering get method!!");
		
		StudentDAO stud_dao1=new StudentDAO();
		System.out.println(studentId);
	    studentId=	studbean.getStudentId();
		studbean1=stud_dao1.retrieve(studentId);
		if(studbean1 == null)
		 return "failure";
		
		System.out.println("Id:"+studbean1.getStudentId());
		return "student";
	}
}

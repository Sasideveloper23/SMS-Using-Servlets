package sms;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns = "/register")
public class RegisterServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String rollnum=req.getParameter("rollnum");
		String name=req.getParameter("name");
		String classs=req.getParameter("classs");
		String password=req.getParameter("password");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","root");
			PreparedStatement ps=con.prepareStatement("insert into sms values(?,?,?,?)");
			ps.setInt(1, Integer.parseInt(rollnum));
			ps.setString(2, name);
			ps.setInt(3, Integer.parseInt(classs));
			ps.setString(4, password);
			int  row=ps.executeUpdate();
			System.out.println(row+" row is updated successfully");
			ps.close();
			con.close();
			PrintWriter pw=resp.getWriter();
//			pw.write("<html><body><h1>Registered Successfully</h1></body></html>");
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			rd.include(req, resp);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}

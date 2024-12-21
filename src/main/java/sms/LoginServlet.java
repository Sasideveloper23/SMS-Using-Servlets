package sms;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(urlPatterns = "/login")
public class LoginServlet extends HttpServlet{
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String name=req.getParameter("name");
			String password=req.getParameter("password");
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","root");
				PreparedStatement ps=con.prepareStatement("select * from sms where name=? and password=?");
				ps.setString(1, name);
				ps.setString(2, password);
				ResultSet rs=ps.executeQuery();
				
				PrintWriter pw=resp.getWriter();
			
				if(rs.next())
				{
					try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","root");
					Statement s=con1.createStatement();
					ResultSet rs1=s.executeQuery("select * from sms");
					pw.write("<html><body><h1 style='color:red;'>Login Successfull.....</h1></body></html>");
					req.setAttribute("rs", rs1);
					RequestDispatcher rd=req.getRequestDispatcher("allstd.jsp");
					rd.include(req, resp);
					rs1.close();
					s.close();
					con1.close();
					}
					catch (ClassNotFoundException | SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				else {
					PrintWriter pw1=resp.getWriter();
					pw1.write("<html><body><h1>Invalid Creditionals</h1></body></html>");
					RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
					rd.include(req, resp);
				}
				ps.close();
				con.close();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
}

<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Records</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #000;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            margin-bottom: 20px;
        }

        button:hover {
            background-color: #ddd;
        }

        #msg {
            display: none;
        }
    </style>
</head>
<body>
    <a href="register.jsp">
        <button>Create New Record</button>
    </a>
    <table>
        <thead>
            <tr>
                <th>Roll Number</th>
                <th>Name</th>
                <th>Class</th>
                <th>Password</th>
            </tr>
        </thead>
        <tbody>
            <%
            ResultSet rs = (ResultSet)request.getAttribute("rs");
            while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString(1) %></td>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(4) %></td>
            </tr>
            <%
             } 
            %>  
        </tbody>
    </table>
    <script type="text/javascript">
        const msgEle = document.getElementById("msg");
        setTimeout(() => {
            if (msgEle) {
                msgEle.style.display = "none";
            
        	}, 2000);
        }
    </script>

</body>
</html>

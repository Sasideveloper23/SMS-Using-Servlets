<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #eef2f3;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 20px;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
            font-weight: 600;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            color: #555;
            font-weight: 500;
        }
        input[type="number"],
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 15px;
            font-size: 16px;
            transition: border-color 0.3s;
        }
        input:focus {
            border-color: #5cb85c;
            outline: none;
        }
        button {
            background-color: #5cb85c;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #4cae4c;
        }
        @media (max-width: 600px) {
            .container {
                padding: 20px;
                width: 90%;
            }
            h2 {
                font-size: 1.5em;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Register</h2>
        <form action="register" method="post">
            <label for="rollnum">Enter Roll Number:</label>
            <input type="number" id="rollnum" placeholder="Enter roll number" name="rollnum" required>
            
            <label for="name">Enter Name:</label>
            <input type="text" id="name" placeholder="Enter name" name="name" required>
            
            <label for="classs">Enter Class:</label>
            <input type="number" id="classs" placeholder="Enter class" name="classs" required>
            
            <label for="password">Enter Password:</label>
            <input type="password" id="password" placeholder="Enter Password" name="password" required>
            
            <button type="submit">Register</button>
        </form>
    </div>
</body>
</html>

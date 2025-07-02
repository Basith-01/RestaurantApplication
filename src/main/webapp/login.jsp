<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

<style>
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #f7f7f7, #ffffff);
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        
        background: linear-gradient(to right, #fffaf0, #ffe5b4);
     
    }

    form {
        background-color: #ffffff;
        padding: 30px 35px;
        border-radius: 20px;
        box-shadow: 0 6px 25px rgba(0, 0, 0, 0.1);
        width: 350px;
    }

    form h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    label {
        display: block;
        font-weight: 500;
        margin-bottom: 5px;
        color: #555;
    }

    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 10px 12px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 8px;
        font-size: 1rem;
        transition: border-color 0.3s ease;
    }

    input[type="text"]:focus,
    input[type="password"]:focus {
        outline: none;
        border-color: #fc8019;
    }

    input[type="submit"] {
        width: 100%;
        padding: 12px;
        background-color: #fc8019;
        color: white;
        font-weight: bold;
        border: none;
        border-radius: 8px;
        font-size: 1rem;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #e76b00;
    }

    .error-message {
        color: red;
        font-size: 0.9rem;
        margin-top: 10px;
        text-align: center;
    }
    
    .toast {
    position: fixed;
    top: 50px;
    left: 50%;
    transform: translateX(-50%);
    background-color: #ff4d4d;
    color: white;
    padding: 15px 30px;
    border-radius: 5px;
    font-size: 16px;
    box-shadow: 0 0 10px rgba(0,0,0,0.2);
    z-index: 9999;
    opacity: 1;
    animation: fadeout 4s ease forwards;
}

@keyframes fadeout {
    0%   { opacity: 1; }
    80%  { opacity: 1; }
    100% { opacity: 0; display: none; }
}
    
</style>

</head>
<body>



    <form action="login" method="get">
        <h2>Login</h2>
        <label>User Name</label>
        <input type="text" name="username" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <input type="submit" value="Login">

    </form>
    
   <%
    String status = (String) request.getAttribute("status");
    if ("invalid_password".equals(status)) {
%>
    <div class="toast">Invalid password. Please try again.</div>
<%
    } else if ("failed".equals(status)) {
%>
    <div class="toast">User not found. Please check your username.</div>
<%
    } else if ("error".equals(status)) {
%>
    <div class="toast">Something went wrong. Please try again.</div>
<%
    }
%>

    

</body>
</html>

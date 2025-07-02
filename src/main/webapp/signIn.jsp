<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>

<style>
    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(to right, #fffaf0, #ffe5b4);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    form {
        background-color: #ffffff;
        padding: 35px 30px;
        width: 360px;
        border-radius: 18px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
    }

    form h2 {
        text-align: center;
        margin-bottom: 25px;
        color: #333;
    }

    label {
        display: block;
        font-weight: 500;
        margin-bottom: 6px;
        color: #444;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
        width: 100%;
        padding: 10px 12px;
        margin-bottom: 18px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 1rem;
        transition: border-color 0.3s ease;
    }

    input[type="text"]:focus,
    input[type="email"]:focus,
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
        background-color: #e46a06;
    }

    a {
        display: block;
        text-align: center;
        margin-top: 20px;
        text-decoration: none;
        color: #fc8019;
        font-weight: 500;
        transition: color 0.3s;
    }

    a:hover {
        color: #d35400;
    }

    .message {
        text-align: center;
        color: red;
        margin-bottom: 15px;
        font-size: 0.9rem;
    }
</style>

</head>
<body>

<%
    String status = (String) request.getAttribute("status");
    if ("success".equals(status)) {
%>
    <script>
        alert("Sign-Up Successful!");
        window.parent.location.href = "index.html#featured";
    </script>
<%
    } else if ("password_mismatch".equals(status)) {
%>
    <script>
        alert("Password and Confirm Password do not match.");
    </script>
<%
    } else if ("failed".equals(status)) {
%>
    <script>
        alert("Sign-Up failed. Try again.");
    </script>
<%
    } else if ("error".equals(status)) {
%>
    <script>
        alert("An error occurred during registration.");
    </script>
<%
    }
%>

    <form action="singin" method="get">
        <h2>Sign Up</h2>
        <label>User Name</label>
        <input type="text" name="username" required>

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <label>Confirm Password</label>
        <input type="password" name="confirmPassword" required>

        <input type="submit" value="Sign In">
        <a href="login.jsp">Already have an account? Login</a>
    </form>

</body>
</html>

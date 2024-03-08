<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Change Password</title>
</head>
<body>
    <h2>Change Password</h2>
    <form action="changePassword" method="post">
        <label for="password">Enter new password:</label>
        <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="Change Password">
    </form>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>shop_login</title></head>
<body>
<center>
<h1>登陆操作</h1>
<hr>
	<form action="login_check.jsp" method="post">
		<table border="1">
			<tr>
				<td colspan="2">
					用户登陆
				</td>
			</tr>
			<tr>
				<td>登陆ID：</td>
				<td><input type="text" name="user_name"></td>
			</tr>
			<tr>
				<td>登陆密码：</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="登陆">
					<input type="reset" value="重置">
				</td>
			</tr>
		</table>
	</form>
</center>
</body>
</html>
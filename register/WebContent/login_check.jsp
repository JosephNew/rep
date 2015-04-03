<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head><title>shop_login</title></head>
<body>
<center>
<h1>登陆操作</h1>
<hr>
<%!	// 定义若干个数据库的连接常量
	public static final String DBDRIVER = "com.mysql.jdbc.Driver" ;
	public static final String DBURL = "jdbc:mysql://localhost:3306/purchase?useUnicode=true&characterEncoding=gbk" ;
	public static final String DBUSER = "shop" ;
	public static final String DBPASS = "shopadmin" ;
%>
<%
	Connection conn = null ;		// 数据库连接
	PreparedStatement pstmt = null ;	// 数据库预处理操作
	ResultSet rs = null ;		// 查询要处理结果集
	boolean flag = false ;	// 保存标记
	String name = null ;	// 保存真实姓名
%>
<%
try{
%>
<%
	Class.forName(DBDRIVER) ;
	conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS) ;
	String sql = "SELECT user_name FROM user WHERE user_id=? AND password=?" ;
	pstmt = conn.prepareStatement(sql) ;
	pstmt.setString(1,request.getParameter("user_name")) ;
	pstmt.setString(2,request.getParameter("password")) ;
	rs = pstmt.executeQuery() ;	// 查询
	if(rs.next()){	// 如果有数据，则可以执行
		flag = true ;	//  表示登陆成功
		name = rs.getString(1) ;
	}	
%>
<%
}catch(Exception e)	{
	e.printStackTrace() ;
}
finally{
	try{
		rs.close() ;
		pstmt.close() ;
		conn.close() ;
	} catch(Exception e){}
}
%>
<%
	if(flag){	// 登陆成功
%>
		<jsp:forward page="login_success.jsp">
			<jsp:param name="uname" value="<%=name%>"/>
		</jsp:forward>
<%
	} else {		// 登陆失败
%>
		<jsp:forward page="login_failure.jsp"/>
<%
	}
%>
</center>
</body>
</html>
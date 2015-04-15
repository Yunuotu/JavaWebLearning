package ex5pro2;
import java.sql.*;
public class UserDAO {
	public static void update(User user) {
		Connection conn=null;
		Statement stmt=null;
		String url = "jdbc:mysql://localhost:3306/newsdb";
		String sql="update newsdb.user set lastLoginTime=now() where username='"+user.getUsername()+"'";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url,"root","root");
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.print(e.toString());
		}
	}
	
	public static User searchByUsername(String username) {
		User user=new User();
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String url = "jdbc:mysql://localhost:3306/newsdb";
		String sql="select * from user where username = '"+username+"'";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url,"root","root");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next())
			{
				user.setId(rs.getInt("id"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setLastLoginTime(rs.getString("lastLoginTime"));
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch(Exception e) {
			System.out.print(e.toString());
		}
		return user;
	}
}

import java.sql.*;
import javax.naming.*;
import javax.sql.*;
public class UserDao {
	public static DataSource getDataSource() throws NamingException{
		Context initCtx = null;
		Context envCtx=null;
		
		initCtx=new InitialContext();
		envCtx=(Context)initCtx.lookup("java:comp/env");
		
		return (DataSource)envCtx.lookup("jdbc/wp");
	}
	public static boolean update(User users) throws SQLException, NamingException{
		int result;
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		DataSource ds = getDataSource();
		
		try{
			conn=ds.getConnection();
			stmt=conn.prepareStatement(
					"UPDATE users"+
					"SET userid=?, address=?, phone=?"+"WHERE id=?"
							);
			stmt.setString(1,users.userid);
			stmt.setString(2,users.address);
			stmt.setInt(3,users.phone);
			
			result=stmt.executeUpdate();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){}
			if(stmt!=null)try{stmt.close();}catch(SQLException e){}
			if(conn!=null)try{conn.close();}catch(SQLException e){}
		}
		return (result==1);
			
		}
	public static boolean remove(int id) throws NamingException, SQLException{
		int result;
		Connection conn =null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		
		DataSource ds=getDataSource();
		try{
			conn=ds.getConnection();
			stmt=conn.prepareStatement("DELETE FROM users WHERE id=?");
			stmt.setInt(1,id);
			
			result=stmt.executeUpdate();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){}
			if(stmt!=null)try{stmt.close();}catch(SQLException e){}
			if(conn!=null)try{conn.close();}catch(SQLException e){}
		}
		return (result==1);
	}
	public static boolean create(User users) throws SQLException, NamingException{
		int result;
		Connection conn = null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		DataSource ds =getDataSource();
		try{
			conn=ds.getConnection();
			stmt=conn.prepareStatement(
					"INSERT INTO users(id, pwd, address, phone)"+
					"VALUES(?,?,?,?)"
							);
			stmt.setString(1,users.id);
			stmt.setString(2,users.pwd);
			stmt.setString(3,users.address);
			stmt.setInt(4, users.phone);
			
			result=stmt.executeUpdate();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){}
			if(stmt!=null)try{stmt.close();}catch(SQLException e){}
			if(conn!=null)try{conn.close();}catch(SQLException e){}
		}
		return (result==1);
	}
	public static User findById(int id) throws NamingException, SQLException{
		User users=null;
		
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		
		DataSource ds = getDataSource();
		try{
			conn=ds.getConnection();
			
			stmt=conn.prepareStatement("SELECT * FROM users WHERE id=?");
			stmt.setInt(1,id);
			
			rs=stmt.executeQuery();
			
			if(rs.next()){
				users=new User(rs.getString("id"),
					rs.getString("pwd"),
					rs.getString("address"),
					rs.getString("phone"));
			}
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){}
			if(stmt!=null)try{stmt.close();}catch(SQLException e){}
			if(conn!=null)try{conn.close();}catch(SQLException e){}
		}
		return users;
	}
	public static PageResult<User> getPage(int page, int numIntemsInpage) throws SQLException , NamingExceptino{
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		if(page<=0){
			page=1;
		}
		DataSource ds=getDataSource();
		PageResult<User> result=new PageResult<User>(numItemsInpage, page);
		
		int strartPos=(page-1)*numItemsInPage;
		try{
			conn=ds.getConnection();
			stmt=conn.createStatement();
			
			rs=stmt.executeQuery("SELECT COUNT(*) FROM users ODERED BY name");
			rs.next();
			
			result.setNumItems(rs.getInt(1));
			
			rs.close();
			rs=null;
			stmt.close();
			stmt=null;
			
			stmt=conn.createStatement();
			rs=stmt.executeQuery("SELECT * FROM users ORDER BY name LIMIT " +startPos+", "+numItemsInpage);
			
			while(rs.next()){
				result.getList().add(new User(rs.getString("id")),
						rs.getString("pwd"),
						rs.getString("address"),
						rs.getInt("phone")
						);
			}
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){}
			if(stmt!=null)try{stmt.close();}catch(SQLException e){}
			if(conn!=null)try{conn.close();}catch(SQLException e){}
		}
		return result;
	}
}
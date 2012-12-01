import java.util.*;
import java.sql.SQLException;
import java.io.IOException;
import org.apache.commons.lang3.StringUtils; 
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class UserServlet extends HttpServlet {
	private static final long serialVersionUID=1L;
	public UserServlet(){
		super();
	}
	private int getIntFromParameter(String str, int defaultValue){
		int id;
		
		try{
			id=Integer.parseInt(str);
		}catch(Exception e){
			id=defaultValue;
		}
		return id;
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException{
		String op=request.getParameter("op");
		String actionUrl="";
		boolean ret;
		
		int id=getIntFromParameter(request.getParameter("id"),-1);
		if(op==null && id>0){
			op="";
		}
		try{
			if(op==null || op.equals("index")){
			}
			else if(op.equals()){
			}
			else if(op.equals("update")){
				User user=UserDao.FindByID(id);
				request.setAttribute("user",user);
				request.setAttribute("method","PUT");
				actionUrl="update.jsp";
			}
		}catch(SQLException | NamingException e){
			request.setParameter("error",e.getMessage());
			e.printStackTrace();
			actionUrl="error.jsp";
		}
	}
	private boolean isRegisterMode(HttpServletRequest request){
		String method=request.getParameter("_method");
		return method==null || method.equals("POST");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException{
		boolean ret=false;
		String actionUrl="";
		String msg;
		User user=new User();
		
		request.setCharacterEncoding("utf-8");
		
		String userid=request.getParameter("id");
		String userpwd=request.getParameter("pwd");
		String pwd_conf=request.getParameter("pwd2");
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String phone1=request.getParameter("phone1");
		String phone2=request.getParameter("phone2");
		String phone3=request.getParameter("phone3");
		String agree=request.getParameter("agree");
		
		List<String> errorMsgs=new ArrayList<String>();
		
		if(userid==null || userid.trim().length()==0){
			errorMsgs.add("반드시 ID를 입력해주세요.");
		}
		if(userpwd==null || userpwd.length()<5){
			errorMsgs.add("비밀번호를 5자리 이상 입력해주세요.");
		}
		if(!userpwd.equals(pwd_conf)){
			errorMsgs.add("비밀번호가 일치하지 않습니다.");
		}
		if(agree==null){
			errorMsgs.add("약관에 동의하셔야 합니다.");
		}
		if(phone2==null && phone3==null){
			errorMsgs.add("전화번호를 입력해주세요.");
		}
		if(phone2!=null && phone3!=null){
				if((phone2.length()>0&&phone2.length()<3)||(phone3.length()>0&&phone3.length()<3)){
					errorMsgs.add("정화번호를 제대로 입력해주세요.");
				}
		}	
	}
}
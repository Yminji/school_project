package festival;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/festival/*")
public class FestivalController extends HttpServlet{
	FestivalDAO festivalDAO;
	
	public void init() throws ServletException{
		festivalDAO = new FestivalDAO();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doHandle(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doHandle(request, response);
	}
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String nextPage = "";
		String action = request.getPathInfo();
		System.out.println("action : "+action);
		try {
			Map<String, Object> Festival = new HashMap<String, Object>();
			List<FestivalVO> festivalList = festivalDAO.listFestival();
			Festival.put("festivalList", festivalList);
			if(action.equals("/listFestival.do")) {
			List<SeasonVO> springList = festivalDAO.listSpring();
			Festival.put("springList", springList);
			request.setAttribute("Festival", Festival);
			nextPage ="/Festival/listFestival.jsp";
			}else if(action.equals("/springFestival.do")) {
				List<SeasonVO> springList = festivalDAO.listSpring();
				Festival.put("springList", springList);
				request.setAttribute("Festival", Festival);
				nextPage ="/Festival/listFestival.jsp";
			}else if(action.equals("/summerFestival.do")) {
				List<SeasonVO> summerList = festivalDAO.listSummer();
				Festival.put("summerList", summerList);
				request.setAttribute("Festival", Festival);
				nextPage ="/Festival/SummerFe.jsp";
			}else if(action.equals("/fallFestival.do")) {
				List<SeasonVO> fallList = festivalDAO.listFall();
				Festival.put("fallList", fallList);
				request.setAttribute("Festival", Festival);
				nextPage ="/Festival/FallFe.jsp";
			}else if(action.equals("/winterFestival.do")) {
				List<SeasonVO> winterList = festivalDAO.listWinter();
				Festival.put("winterList", winterList);
				request.setAttribute("Festival", Festival);
				nextPage ="/Festival/WinterFe.jsp";
			}
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}

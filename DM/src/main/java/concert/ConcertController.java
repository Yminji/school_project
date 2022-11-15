package concert;

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

@WebServlet("/concert/*")
public class ConcertController extends HttpServlet{
ConcertDAO concertDAO;
	
	public void init() throws ServletException{
		concertDAO = new ConcertDAO();
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
			Map<String, Object> Concert = new HashMap<String, Object>();
			List<ConcertVO> concertList = concertDAO.listConcert();
			Concert.put("concertList", concertList);
			if(action.equals("/listConcert.do")) {
			List<SeasonVO> springList = concertDAO.listSpring();
			Concert.put("springList", springList);
			request.setAttribute("Concert", Concert);
			nextPage ="/Concert/listConcert.jsp";
			}else if(action.equals("/springConcert.do")) {
				List<SeasonVO> springList = concertDAO.listSpring();
				Concert.put("springList", springList);
				request.setAttribute("Concert", Concert);
				nextPage ="/Concert/listConcert.jsp";
			}else if(action.equals("/summerConcert.do")) {
				List<SeasonVO> summerList = concertDAO.listSummer();
				Concert.put("summerList", summerList);
				request.setAttribute("Concert", Concert);
				nextPage ="/Concert/SummerCo.jsp";
			}else if(action.equals("/fallConcert.do")) {
				List<SeasonVO> fallList = concertDAO.listFall();
				Concert.put("fallList", fallList);
				request.setAttribute("Concert", Concert);
				nextPage ="/Concert/FallCo.jsp";
			}else if(action.equals("/winterConcert.do")) {
				List<SeasonVO> winterList = concertDAO.listWinter();
				Concert.put("winterList", winterList);
				request.setAttribute("Concert", Concert);
				nextPage ="/Concert/WinterCo.jsp";
			}
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}

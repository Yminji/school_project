package musical;

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

@WebServlet("/musical/*")
public class MusicalController extends HttpServlet{
	MusicalDAO musicalDAO;
	
	public void init() throws ServletException{
		musicalDAO = new MusicalDAO();
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
			Map<String, Object> Musical = new HashMap<String, Object>();
			List<MusicalVO> musicalList = musicalDAO.listMusical();
			Musical.put("musicalList", musicalList);
			if(action.equals("/listMusical.do")) {
			List<SeasonVO> springList = musicalDAO.listSpring();
			Musical.put("springList", springList);
			request.setAttribute("Musical", Musical);
			nextPage ="/Musical/listMusical.jsp";
			}else if(action.equals("/springMusical.do")) {
				List<SeasonVO> springList = musicalDAO.listSpring();
				Musical.put("springList", springList);
				request.setAttribute("Musical", Musical);
				nextPage ="/Musical/listMusical.jsp";
			}else if(action.equals("/summerMusical.do")) {
				List<SeasonVO> summerList = musicalDAO.listSummer();
				Musical.put("summerList", summerList);
				request.setAttribute("Musical", Musical);
				nextPage ="/Musical/SummerMu.jsp";
			}else if(action.equals("/fallMusical.do")) {
				List<SeasonVO> fallList = musicalDAO.listFall();
				Musical.put("fallList", fallList);
				request.setAttribute("Musical", Musical);
				nextPage ="/Musical/FallMu.jsp";
			}else if(action.equals("/winterMusical.do")) {
				List<SeasonVO> winterList = musicalDAO.listWinter();
				Musical.put("winterList", winterList);
				request.setAttribute("Musical", Musical);
				nextPage ="/Musical/WinterMu.jsp";
			}
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}

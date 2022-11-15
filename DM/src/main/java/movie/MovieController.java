package movie;

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


@WebServlet("/movie/*")
public class MovieController extends HttpServlet{
	MovieDAO movieDAO;
	
	public void init() throws ServletException{
		movieDAO = new MovieDAO();
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
			Map<String, Object> Movie = new HashMap<String, Object>();
			List<MovieVO> movieList = movieDAO.listMovie();
			Movie.put("movieList", movieList);
			if(action.equals("/listMovie.do")) {
			List<SeasonVO> springList = movieDAO.listSpring();
			Movie.put("springList", springList);
			request.setAttribute("Movie", Movie);
			nextPage ="/Movie/listMovie.jsp";
			}else if(action.equals("/springMovie.do")) {
				List<SeasonVO> springList = movieDAO.listSpring();
				Movie.put("springList", springList);
				request.setAttribute("Movie", Movie);
				nextPage ="/Movie/listMovie.jsp";
			}else if(action.equals("/summerMovie.do")) {
				List<SeasonVO> summerList = movieDAO.listSummer();
				Movie.put("summerList", summerList);
				request.setAttribute("Movie", Movie);
				nextPage ="/Movie/SummerMo.jsp";
			}else if(action.equals("/fallMovie.do")) {
				List<SeasonVO> fallList = movieDAO.listFall();
				Movie.put("fallList", fallList);
				request.setAttribute("Movie", Movie);
				nextPage ="/Movie/FallMo.jsp";
			}else if(action.equals("/winterMovie.do")) {
				List<SeasonVO> winterList = movieDAO.listWinter();
				Movie.put("winterList", winterList);
				request.setAttribute("Movie", Movie);
				nextPage ="/Movie/WinterMo.jsp";
			}
			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}

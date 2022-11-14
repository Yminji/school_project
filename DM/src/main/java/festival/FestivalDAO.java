package festival;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FestivalDAO {
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	
	public FestivalDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<FestivalVO> listFestival(){
		List<FestivalVO> festivalList = new ArrayList<FestivalVO>();
		try {
			conn = dataFactory.getConnection();
			String query = "select * from t_festival order by no";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String tag = rs.getString("tag");
				String title = rs.getString("title");
				String link = rs.getString("link");
				FestivalVO festivalVO = new FestivalVO(no, tag, title, link);
				festivalList.add(festivalVO);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return festivalList;
	}
	
	public List<SeasonVO> listSpring(){
		List<SeasonVO> springList = new ArrayList<SeasonVO>();
		
		try {
			conn=  dataFactory.getConnection();
			String query = "select * from f_spring order by no";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String mon = rs.getString("mon");
				String ydt = rs.getString("ydt");
				SeasonVO seasonVO = new SeasonVO(no, title, mon, ydt);
				springList.add(seasonVO);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return springList;
	}
	
	public List<SeasonVO> listSummer(){
		List<SeasonVO> summerList = new ArrayList<SeasonVO>();
		
		try {
			conn=  dataFactory.getConnection();
			String query = "select * from f_summer order by no";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String mon = rs.getString("mon");
				String ydt = rs.getString("ydt");
				SeasonVO seasonVO = new SeasonVO(no, title, mon, ydt);
				summerList.add(seasonVO);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return summerList;
	}

	public List<SeasonVO> listFall(){
		List<SeasonVO> fallList = new ArrayList<SeasonVO>();
		
		try {
			conn=  dataFactory.getConnection();
			String query = "select * from f_fall order by no";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String mon = rs.getString("mon");
				String ydt = rs.getString("ydt");
				SeasonVO seasonVO = new SeasonVO(no, title, mon, ydt);
				fallList.add(seasonVO);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return fallList;
	}
	
	public List<SeasonVO> listWinter(){
		List<SeasonVO> winterList = new ArrayList<SeasonVO>();
		
		try {
			conn=  dataFactory.getConnection();
			String query = "select * from f_winter order by no";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String mon = rs.getString("mon");
				String ydt = rs.getString("ydt");
				SeasonVO seasonVO = new SeasonVO(no, title, mon, ydt);
				winterList.add(seasonVO);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return winterList;
	}
}

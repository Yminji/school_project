package concert;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConcertDAO {
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	
	public ConcertDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<ConcertVO> listConcert(){
		List<ConcertVO> concertList = new ArrayList<ConcertVO>();
		try {
			conn = dataFactory.getConnection();
			String query = "select * from t_Concert order by no";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String tag = rs.getString("tag");
				String title = rs.getString("title");
				String link = rs.getString("link");
				ConcertVO concertVO = new ConcertVO(no, tag, title, link);
				concertList.add(concertVO);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return concertList;
	}
	
	public List<SeasonVO> listSpring(){
		List<SeasonVO> springList = new ArrayList<SeasonVO>();
		
		try {
			conn=  dataFactory.getConnection();
			String query = "select * from CONCERTSPRING order by no";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String address = rs.getString("address");
				SeasonVO seasonVO = new SeasonVO(no, title, address);
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
			String query = "select * from CONCERTSUMMER order by no";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String address = rs.getString("address");
				SeasonVO seasonVO = new SeasonVO(no, title, address);
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
			String query = "select * from CONCERTFALL order by no";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String address = rs.getString("address");
				SeasonVO seasonVO = new SeasonVO(no, title, address);
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
			String query = "select * from CONCERTWINTER order by no";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String address = rs.getString("address");
				SeasonVO seasonVO = new SeasonVO(no, title, address);
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

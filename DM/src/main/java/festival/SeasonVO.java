package festival;

public class SeasonVO {
	private int no;
	private String title;
	private String mon;
	private String ydt;
	
	public SeasonVO(int no, String title, String mon, String ydt) {
		this.no = no;
		this.title = title;
		this.mon = mon;
		this.ydt = ydt;
	}
	
	public void setNo(int no) {this.no = no;}
	public void setTitle(String title) {this.title = title;}
	public void setMon(String mon) {this.mon = mon;}
	public void setYdt(String ydt) {this.ydt = ydt;}
	
	public int getNo() {return no;}
	public String getTitle() {return title;}
	public String getMon() {return mon;}
	public String getYdt() {return ydt;}
}

package musical;

public class SeasonVO {
	private int no;
	private String title;
	private String address;
	
	public SeasonVO(int no, String title, String address) {
		this.no = no;
		this.title = title;
		this.address = address;
	}
	
	public void setNO(int no) {this.no = no;}
	public void setTitle(String title) {this.title = title;}
	public void setAddress(String address) {this.address = address;}
	
	public int getNO() {return no;}
	public String getTitle() {return title;}
	public String getAddress() {return address;}
}

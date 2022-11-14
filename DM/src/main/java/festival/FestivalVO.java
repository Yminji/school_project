package festival;

public class FestivalVO {
	private int no;
	private String tag;
	private String title;
	private String link;
	
	public FestivalVO(int no, String tag, String title, String link) {
		this.no = no;
		this.tag = tag;
		this.title = title;
		this.link = link;
	}
	
	public void setNo(int no) {this.no = no;}
	public void setTag(String tag) {this.tag = tag;}
	public void setTitle(String title) {this.title = title;}
	public void setLink(String link) {this.link = link;}
	
	public int getNo() {return no;}
	public String getTag() {return tag;}
	public String getTitle() {return title;}
	public String getLink() {return link;}
}

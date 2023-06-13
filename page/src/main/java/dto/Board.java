package dto;

public class Board {
	public Board() {

	}
	private String num;
	private String title;
	private String content;
	private String id;
	private String postdate;
	private String visicount;
	
	public Board(String num, String title, String content, String id, String postdate, String visicount) {
		this.num = num;
		this.title = title;
		this.content = content;
		this.id = id;
		this.postdate = postdate;
		this.visicount = visicount;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPostdate() {
		return postdate;
	}

	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}

	public String getVisicount() {
		return visicount;
	}

	public void setVisicount(String visicount) {
		this.visicount = visicount;
	}



}

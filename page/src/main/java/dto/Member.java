package dto;

//데이터베이스로부터 조회된 결과를 담는 객체 = Member (dto) 	
public class Member {

	private String id;
	private String pass;
	private String name;
	private String regigdate;
	
	public Member() {
	}
	
	public Member(String id, String pass, String name, String regigdate) {
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.regigdate = regigdate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegigdate() {
		return regigdate;
	}

	public void setRegigdate(String regigdate) {
		this.regigdate = regigdate;
	}

}

package el;
/*[예제 10-11] EL로 호출할 메서드를 담은 클래스
 * 
	① getGender( ) 메서드는 주민번호를 매개변수로 받아 성별을 판단
	② 주민번호 뒤 7 자리의 첫 번째 숫자가 1이나 3이면 남자로
	③ 2나 4면 여자로 판단
	④ isNumber( ) 메서드는 문자열을 매개변수로 받아 숫자인지 판단하는 정적 메서드
    	- 전체가 숫자일 때만 true를 반환
	⑤ 매개변수로 전달된 정수만큼의 구구단을 출력하는 정적 메서드
    	- 5가 전달되면 5단까지 출력
 * 
 * */
public class myElClass {

	public myElClass() {
	}
	
	/*
	 * 주민번호를 입력받아 성별을 반환하는 메서드 
	 * 주민번호 뒤 7 자리의 첫 번째 숫자가 1이나 3이면 남자로
	 	 						2나 4면 여자로 판단
	 * */

	public String getGender(String jumin) {
			
		/*	
		 * 		시작인덱스(포함) 끝인덱스(불포함)
		 *  System.out.println(str.substring(7,8));
		 *  System.out.println(jumin.indexOf("-")+1);
		 */		
		String res = "";
		
		try {
			int startIndex = jumin.indexOf("-")+1; 
			int endIndex = startIndex + 1;
			String gender = jumin.substring(startIndex, endIndex);
			
			if(gender.equals("1") || gender.equals("3")) {
				res = "남자";
			}else if(gender.equals("2") || gender.equals("4")) {
				res = "여자";
			}else {
				throw new Exception();
			}
		} catch (Exception e) {
			res = "주민등록 번호를 확인해주세욥!";
		}
		return res;
	}
	
	// 입력받은 문자열이 숫자인지 판단하는 정적메서드
	public static boolean isNumber(String value) {
		try {
			Integer.parseInt(value);
			Double.parseDouble(value);
			return true;
			
		} catch (NumberFormatException e) {
			return false;
		}
		
		/*
		 *  입력받은 문자열의 각 문자가 0~9 ascii 코드값 사이에 있는 char인지 판별하는 방법
		 *    0~9의 ascii 코드값은 십진수로 48~57 
		 * 	-> String을 char[]로 변환한 다음 반복문을 돌면서 각 char가 48~57 사이의 값인지 판단 -> 숫자인지 판별 
		 * 
		 * String str = "1234";
		 * 
		 * char c = '0'; char cc = '9'; 
		 * System.out.println("0 : " + (int)c);  // 48
		 * System.out.println("9 : " + (int)cc); // 57
		 * 
		 * // 문자열을 char 배열로 받아 하나씩 비교 (0보다 작거나 같고 9보다 크거나 같으면 문자가 아님!) char[] arr =
		 * str.toCharArray();
		 * 
		 * for(int i=0; i<arr.length; i++) { if(!(arr[i] >= '0' && arr[i] <= '9')) {
		 * 		System.out.println("문자가 포함되어있습니다."); 
		 *  }else { 
		 * 		System.out.println("숫자입니다."); }
		 * }
		 */
	}
	
	// 입력받은 정수까지 구구단을 HTML 테이블로 출력
	public static String showGugudan(int limitDan) {
		StringBuffer sb = new StringBuffer();
		sb.append("");
		
		sb.append("<table border='1'>");
		for(int dan = 2; dan <=limitDan; dan++) {
			sb.append("<tr>");
			for(int i=1; i<=9; i++) {
				sb.append("<td>");
				sb.append(dan + "*" + i + "=" + (dan*i));
				sb.append("</td>");
			}
			sb.append("</tr>");
	}
		sb.append("</table>");
		return sb.toString();
	}
	
	public static void main(String[] args) {
		myElClass el = new myElClass();
		
		System.out.println(el.getGender("990322-2121245"));

		// 입력받은 문자열이 정수인지 아닌지 판단 (static은 정적메서드 : 클래스이름.메서드명();
		System.out.println(myElClass.isNumber("100"));
		System.out.println(myElClass.isNumber("200303"));
		
		System.out.println(myElClass.showGugudan(5));
		
	}
}

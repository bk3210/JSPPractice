import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class Iterator2 {
	public static void main(String[] args) {
		List<String> list = new ArrayList<String>();
		list.add("사과");
		list.add("포도");
		list.add("멜론");
		list.add("딸기");
		list.add("바나나");
		list.add("귤");
		list.add("키위");
		
		Iterator<String> it = list.iterator();
		while(it.hasNext()) {		// 다음 요소가 있다면 true
			System.out.println(it.next());
			// .next : 현재 요소를 반환하고 다음 요소로 이동
			// for문 대신 사용
			// 모든 컬렉션 구조들은 다 이렇게 접근 가능하다
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("one", "일");
		map.put("two", "이");
		map.put("three", "삼");
		map.put("four", "사");
		map.put("five", "오");
		
		Iterator<String> key = map.keySet().iterator();
		while(key.hasNext()) {
			String k = key.next();
			System.out.println(key + "===>" + map.get(k));
		}
		
	}
}

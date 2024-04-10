//컴퓨터학과 20190936 고지수
package jspbook.pr35;

import java.util.*;

public class LectureManager {
	List<LectureBean> lectureList = new ArrayList<LectureBean>();
		
		public void add(LectureBean lbean) {
			lectureList.add(lbean);
		}
		
		public List<LectureBean> getLectureList() {
			return lectureList;
		}
		
	
}

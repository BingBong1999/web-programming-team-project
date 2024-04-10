//컴퓨터학과 20190936 고지수
package jspbook.pb03;

import java.util.*;

public class LectureManager {
	List<LectureBean> lectureList = new ArrayList<LectureBean>();
	private static final int times = 6; //행
	private static final int days = 5; //열
	private int[][] typeMatrix = new int[times][days];
	private int[][] titleMatrix = new int[times][days];
	private int[][] spanMatrix = new int[times][days];
	
	private int[][] flagMatrix = new int[times][days]; //시간표에 과목이 채워졌는지 체크하는 행렬
	
	private int[] credits = {3, 3, 2, 3}; //타입별 학점
	private int totalCredit = 0; //학점
	ArrayList<Integer> creditCheckList = new ArrayList<Integer>();
	
	public int getTotalCredit() {
		return totalCredit;
	}

	public void setTotalCredit(int totalCredit) {
		this.totalCredit = totalCredit;
	}

	public int[][] getTypeMatrix() {
		return typeMatrix;
	}

	public void setTypeMatrix(int[][] typeMatrix) {
		this.typeMatrix = typeMatrix;
	}

	public int[][] getTitleMatrix() {
		return titleMatrix;
	}

	public void setTitleMatrix(int[][] titleMatrix) {
		this.titleMatrix = titleMatrix;
	}

	public int[][] getSpanMatrix() {
		return spanMatrix;
	}

	public void setSpanMatrix(int[][] spanMatrix) {
		this.spanMatrix = spanMatrix;
	}

	public void add(LectureBean lbean) {
		lectureList.add(lbean);
	}
	
	public int[][] getFlagMatrix() {
		return flagMatrix;
	}

	public void setFlagMatrix(int[][] flagMatrix) {
		this.flagMatrix = flagMatrix;
	}

	public List<LectureBean> getLectureList() {
		return lectureList;
	}
	
	//lectureList에 저장된 내용을 바탕으로 타입, 과목명, 연강 여부의 2차원 배열 생성
	public void buildMatrix() {
		int num;
		
		//titleMatrix의 모든 index값을 -1로 초기화
		for (int i = 0; i < times; i++)
			for (int j = 0; j < days; j++) 
				titleMatrix[i][j] = -1; 
			
		//spanMatrix의 모든 index값을 1로 초기화
		for (int i = 0; i < times; i++)
			for (int j = 0; j < days; j++) 
				spanMatrix[i][j] = 1; 
			
		
		for (LectureBean list : getLectureList()) {
			int i = list.getTime();
			int j = list.getDay();
	
			num = list.getConsecutive();
			spanMatrix[i][j] = num;
			typeMatrix[i][j] = list.getType() + 1; //0이 기본값, 1부터 전공필수
			titleMatrix[i][j] = list.getTitle();
			flagMatrix[i][j] = 1;
			
			//2교시 이상의 연강이라면 그 다음교시의 배열에는 0을 채워줌
			if (spanMatrix[i][j] >= 2) {
				 while (num != 1) {
					i++;
					num--;
					spanMatrix[i][j]--;
					flagMatrix[i][j] = 1;
				 }	
			}
			
		}
		
	}
	
	//연강을 포함하여 시간표가 이미 존재하면 true 반환
	public boolean duplicateCheck(int i, int j, int count) { 
		
		if (flagMatrix[i][j] == 1)
			return true;
		while (count != 1) {
			i++;
			count--;
			
			if (flagMatrix[i][j] == 1)
				return true;
		 }	
		return false;
	}
	
	//학점 계산
	public int calcCredit(LectureBean lbean) {
		
		int i = lbean.getTitle();
		int flag = 0;
		
		for (int c : creditCheckList) {
			if (i == c) {//이미 과목이 존재하면 학점을 추가하지 않음
				flag = 1;
				break;
			}
		}
		if (flag == 0) {
			creditCheckList.add(i);
			totalCredit += credits[lbean.getType()];
		}
		
		return totalCredit;
	}
	
	

		
	
}


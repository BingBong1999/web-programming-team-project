//컴퓨터학과 20190936 고지수
package jspbook.pr34;

public class Calculator {
	private int op1;
	private int op2;
	private String operator;
	
	public int getOp1() {
		return op1;
	}
	public void setOp1(int op1) {
		this.op1 = op1;
	}
	public int getOp2() {
		return op2;
	}
	public void setOp2(int op2) {
		this.op2 = op2;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	
	public int calc() {
		String op = getOperator();
		int n1 = getOp1();
		int n2 = getOp2();
		int result = 0;
		
		switch (op) {
		case "+": 
			result = add(n1, n2);
			break;
		case "-": 
			result = sub(n1, n2);
			break;
		case "*": 
			result = mult(n1, n2);
			break;
		case "/": 
			result = div(n1, n2);
			break;
		}
	
		return result;
	}
	
	private int add(int a, int b) {
		return a + b;
	}
	
	private int sub(int a, int b) {
		return a - b;
	}
	
	private int mult(int a, int b) {
		return a * b;
	}
	
	private int div(int a, int b) {
		return a / b;
	}
}

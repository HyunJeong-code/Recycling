package a.b.c.dto;

public class Test {
	
	private String test;
	
	public Test() {}

	public Test(String test) {
		this.test = test;
	}

	@Override
	public String toString() {
		return "Test [test=" + test + "]";
	}

	public String getTest() {
		return test;
	}

	public void setTest(String test) {
		this.test = test;
	}
}

package recycling.dto.manager;

public class Department {
	
	private int deptNo;
	private String dname;
	
	public Department() {}

	public Department(int deptNo, String dname) {
		this.deptNo = deptNo;
		this.dname = dname;
	}

	@Override
	public String toString() {
		return "Department [deptNo=" + deptNo + ", dname=" + dname + "]";
	}

	public int getDeptNo() {
		return deptNo;
	}

	public void setDeptNo(int deptNo) {
		this.deptNo = deptNo;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}
}
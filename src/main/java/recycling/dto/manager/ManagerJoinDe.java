package recycling.dto.manager;

public class ManagerJoinDe {
	
<<<<<<< HEAD
	 //Manager
	   private String mgrCode;
	   private int deptno;
	   private String mgrId;
	   private String mgrPw;
	   private String mgrName;
	   private String mgrPhone;
	   private String mgrEmail;
	   private String mgrBirth;
	   private String mgrGender;
	   private String mgrEntDate;
	   private String mgrOut;
	   private String mgrOutDate;
	   
	   //Department
	   private String dname;
	   
	   public ManagerJoinDe() {
	   }
	   
	   @Override
	   protected Object clone() throws CloneNotSupportedException {
	      // TODO Auto-generated method stub
	      return super.clone();
	   }
	
	   @Override
	   public String toString() {
	      return "ManagerJoinDe [mgrCode=" + mgrCode + ", deptno=" + deptno + ", mgrId=" + mgrId + ", mgrPw=" + mgrPw
	    + ", mgrName=" + mgrName + ", mgrPhone=" + mgrPhone + ", mgrEmail=" + mgrEmail + ", mgrBirth="
	    + mgrBirth + ", mgrGender=" + mgrGender + ", mgrEntDate=" + mgrEntDate + ", mgrOut=" + mgrOut
	    + ", mgrOutDate=" + mgrOutDate + ", dname=" + dname + "]";
	   }
	
	   public ManagerJoinDe(String mgrCode, int deptno, String mgrId, String mgrPw, String mgrName, String mgrPhone,
	         String mgrEmail, String mgrBirth, String mgrGender, String mgrEntDate, String mgrOut, String mgrOutDate,
	         String dname) {
	      super();
	      this.mgrCode = mgrCode;
	      this.deptno = deptno;
	      this.mgrId = mgrId;
	      this.mgrPw = mgrPw;
	      this.mgrName = mgrName;
	      this.mgrPhone = mgrPhone;
	      this.mgrEmail = mgrEmail;
	      this.mgrBirth = mgrBirth;
	      this.mgrGender = mgrGender;
	      this.mgrEntDate = mgrEntDate;
	      this.mgrOut = mgrOut;
	      this.mgrOutDate = mgrOutDate;
	      this.dname = dname;
	   }
	
	   public String getMgrCode() {
	      return mgrCode;
	   }
	
	   public void setMgrCode(String mgrCode) {
	      this.mgrCode = mgrCode;
	   }
	
	   public int getDeptno() {
	      return deptno;
	   }
	
	   public void setDeptno(int deptno) {
	      this.deptno = deptno;
	   }
	
	   public String getMgrId() {
	      return mgrId;
	   }
	
	   public void setMgrId(String mgrId) {
	      this.mgrId = mgrId;
	   }
	
	   public String getMgrPw() {
	      return mgrPw;
	   }
	
	   public void setMgrPw(String mgrPw) {
	      this.mgrPw = mgrPw;
	   }
	
	   public String getMgrName() {
	      return mgrName;
	   }
	
	   public void setMgrName(String mgrName) {
	      this.mgrName = mgrName;
	   }
	
	   public String getMgrPhone() {
	      return mgrPhone;
	   }
	
	   public void setMgrPhone(String mgrPhone) {
	      this.mgrPhone = mgrPhone;
	   }
	
	   public String getMgrEmail() {
	      return mgrEmail;
	   }
	
	   public void setMgrEmail(String mgrEmail) {
	      this.mgrEmail = mgrEmail;
	   }
	
	   public String getMgrBirth() {
	      return mgrBirth;
	   }
	
	   public void setMgrBirth(String mgrBirth) {
	      this.mgrBirth = mgrBirth;
	   }
	
	   public String getMgrGender() {
	      return mgrGender;
	   }
	
	   public void setMgrGender(String mgrGender) {
	      this.mgrGender = mgrGender;
	   }
	
	   public String getMgrEntDate() {
	      return mgrEntDate;
	   }
	
	   public void setMgrEntDate(String mgrEntDate) {
	      this.mgrEntDate = mgrEntDate;
	   }
	
	   public String getMgrOut() {
	      return mgrOut;
	   }
	
	   public void setMgrOut(String mgrOut) {
	      this.mgrOut = mgrOut;
	   }
	
	   public String getMgrOutDate() {
	      return mgrOutDate;
	   }
	
	   public void setMgrOutDate(String mgrOutDate) {
	      this.mgrOutDate = mgrOutDate;
	   }
	
	   public String getDname() {
	      return dname;
	   }
	
	   public void setDname(String dname) {
	      this.dname = dname;
	   }

=======
	//Manager
	private String mgrCode;
	private int deptno;
	private String mgrId;
	private String mgrPw;
	private String mgrName;
	private String mgrPhone;
	private String mgrEmail;
	private String mgrBirth;
	private String mgrGender;
	private String mgrEntDate;
	private String mgrOut;
	private String mgrOutDate;
	   
	//Department
	private String dname;
	
	public ManagerJoinDe() {}

	public ManagerJoinDe(String mgrCode, int deptno, String mgrId, String mgrPw, String mgrName, String mgrPhone,
			String mgrEmail, String mgrBirth, String mgrGender, String mgrEntDate, String mgrOut, String mgrOutDate,
			String dname) {
		this.mgrCode = mgrCode;
		this.deptno = deptno;
		this.mgrId = mgrId;
		this.mgrPw = mgrPw;
		this.mgrName = mgrName;
		this.mgrPhone = mgrPhone;
		this.mgrEmail = mgrEmail;
		this.mgrBirth = mgrBirth;
		this.mgrGender = mgrGender;
		this.mgrEntDate = mgrEntDate;
		this.mgrOut = mgrOut;
		this.mgrOutDate = mgrOutDate;
		this.dname = dname;
	}

	@Override
	public String toString() {
		return "ManagerJoinDe [mgrCode=" + mgrCode + ", deptno=" + deptno + ", mgrId=" + mgrId + ", mgrPw=" + mgrPw
				+ ", mgrName=" + mgrName + ", mgrPhone=" + mgrPhone + ", mgrEmail=" + mgrEmail + ", mgrBirth="
				+ mgrBirth + ", mgrGender=" + mgrGender + ", mgrEntDate=" + mgrEntDate + ", mgrOut=" + mgrOut
				+ ", mgrOutDate=" + mgrOutDate + ", dname=" + dname + "]";
	}

	public String getMgrCode() {
		return mgrCode;
	}

	public void setMgrCode(String mgrCode) {
		this.mgrCode = mgrCode;
	}

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public String getMgrId() {
		return mgrId;
	}

	public void setMgrId(String mgrId) {
		this.mgrId = mgrId;
	}

	public String getMgrPw() {
		return mgrPw;
	}

	public void setMgrPw(String mgrPw) {
		this.mgrPw = mgrPw;
	}

	public String getMgrName() {
		return mgrName;
	}

	public void setMgrName(String mgrName) {
		this.mgrName = mgrName;
	}

	public String getMgrPhone() {
		return mgrPhone;
	}

	public void setMgrPhone(String mgrPhone) {
		this.mgrPhone = mgrPhone;
	}

	public String getMgrEmail() {
		return mgrEmail;
	}

	public void setMgrEmail(String mgrEmail) {
		this.mgrEmail = mgrEmail;
	}

	public String getMgrBirth() {
		return mgrBirth;
	}

	public void setMgrBirth(String mgrBirth) {
		this.mgrBirth = mgrBirth;
	}

	public String getMgrGender() {
		return mgrGender;
	}

	public void setMgrGender(String mgrGender) {
		this.mgrGender = mgrGender;
	}

	public String getMgrEntDate() {
		return mgrEntDate;
	}

	public void setMgrEntDate(String mgrEntDate) {
		this.mgrEntDate = mgrEntDate;
	}

	public String getMgrOut() {
		return mgrOut;
	}

	public void setMgrOut(String mgrOut) {
		this.mgrOut = mgrOut;
	}

	public String getMgrOutDate() {
		return mgrOutDate;
	}

	public void setMgrOutDate(String mgrOutDate) {
		this.mgrOutDate = mgrOutDate;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}
>>>>>>> TEST
}

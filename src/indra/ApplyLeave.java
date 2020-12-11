package indra;

public class ApplyLeave {
	protected int id;
	protected String college_id;
	protected String applied_from;
	protected String applied_till;
	protected String leavetype;
	protected String purpose;
	protected String status;
	protected String faculty;
	
	public ApplyLeave() {
		
	}
	
	public ApplyLeave(int id) {
		this.id = id;
	}
	
	public ApplyLeave(int id, String college_id, String applied_from, String applied_till, String leavetype, String reason, String status,String faculty) {
		this(college_id, applied_from, applied_till, leavetype, reason, status,faculty);
		this.id = id;
	}
	
	public ApplyLeave(String college_id, String applied_from, String applied_till, String leavetype, String purpose, String status,String faculty) {
		this.college_id = college_id;
		this.applied_from = applied_from;
		this.applied_till = applied_till;
		this.leavetype = leavetype;
		this.purpose = purpose;
		this.status = status;
		this.faculty=faculty;
	}
	
	public int getID() {
		return id;
	}
	
	public void setID(int id) {
		this.id = id;
	}
	
	public String getCollegeId() {
		return college_id;
	}
	
	public void setCollegeId(String college_id) {
		this.college_id = college_id;
	}
	
	public String getAppliedFrom() {
		return applied_from;
	}
	
	public void setAppliedFrom(String applied_from) {
		this.applied_from = applied_from;
	}
	
	public String getAppliedTill() {
		return applied_till;
	}
	
	public void setAppliedTill(String applied_till) {
		this.applied_till = applied_till;
	}
	
	public String getLeaveType() {
		return leavetype;
	}
	
	public void setLeaveType(String leavetype) {
		this.leavetype = leavetype;
	}
	
	public String getPurpose() {
		return purpose;
	}
	
	public void setReason(String purpose) {
		this.purpose = purpose;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFaculty() {
		return faculty;
	}

	public void setFaculty(String faculty) {
		this.faculty = faculty;
	}
	
}

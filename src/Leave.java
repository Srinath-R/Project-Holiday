public class Leave {
    protected int id;
    protected String applied_from;
    protected String applied_till;
    protected String type;
    protected String purpose;
    protected String status;
    protected String user_id;
    protected String faculty;
    public Leave() {
    }
 
    public Leave(int id) {
        this.id = id;
    }
 
    public Leave(int id,  String applied_from, String applied_till, String type, String purpose, String status) {
        this(applied_from, applied_till, type, purpose, status);
        this.id = id;
    }
   
     
    public Leave(String applied_from, String applied_till, String type, String purpose, String status) {
        this.applied_from = applied_from;
        this.applied_till = applied_till;
        this.type = type;
        this.purpose = purpose;
        this.status = status;
//        this.user_id = user_id;
//        this.faculty = faculty;
    }
 
    public int getId() {
        return id;
    }
 
    public void setId(int id) {
        this.id = id;
    }
 
    public String getApplied_from() {
        return applied_from;
    }
 
    public void setApplied_from(String applied_from) {
        this.applied_from = applied_from;
    }
 
    public String getApplied_till() {
        return applied_till;
    }
 
    public void setApplied_till(String applied_till) {
        this.applied_till = applied_till;
    }
 
    public String getType() {
        return type;
    }
 
    public void setType(String type) {
        this.type = type;
    }
    
    public String getPurpose() {
        return purpose;
    }
 
    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }
    public String getStatus() {
        return status;
    }
 
    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getUserId() {
		return user_id;
	}
	
	public void setUserId(String user_id) {
		this.user_id = user_id;
	}
    
    public String getFaculty() {
		return faculty;
	}

	public void setFaculty(String faculty) {
		this.faculty = faculty;
	}
}
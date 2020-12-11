package net.javaguides.admin.model;
import java.io.Serializable;

public class aadmin implements Serializable {
	private String username;
	private String firstname;
	private String lastname;
	private String contact;
	private String email;
	private String password;
	//private String confirmpassword;
	private String dob;
	private String collegeid;
	private String Profession;
	
	public String getusername() {
		return username;
	}
	public void setusername(String username) {
		this.username = username;
	}
	
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	/*public String getConfirmpassword() {
		return confirmpassword;
	}
	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}*/
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getCollegeid() {
		return collegeid;
	}
	public void setCollegeid(String collegeid) {
		this.collegeid = collegeid;
	}
	public String getProfession() {
		return Profession;
	}
	public void setProfession(String Profession) {
		this.Profession = Profession;
	}
	
	
	
	

}

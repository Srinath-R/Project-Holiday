package indra;

public class Absentees_table {

    protected String id;
    protected String rollno;
    protected String name;
    protected String date;
    protected String class_year;

    protected String faculty;
    protected int no_of_hrs;

    public Absentees_table(String id,String rollno,String name,String date,String class_year,String faculty,int no_of_hrs){
        this.id=id;
        this.rollno=rollno;
        this.name=name;
        this.date=date;
        this.class_year=class_year;
        this.no_of_hrs=no_of_hrs;
        this.faculty=faculty;
    }

    public String getid(){
        return id;
    }
    public String getRollno(){
        return rollno;
    }
    public String getName(){
        return name;
    }
    public String getDate(){
        return date;
    }
    public String getClass_year(){
        return class_year;
    }
    public String getFaculty(){
        return faculty;
    }
    public int getno_of_hrs(){
        return no_of_hrs;
    }





}

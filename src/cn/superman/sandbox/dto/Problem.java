package cn.superman.sandbox.dto;

public class Problem {
	private String classPath;
	private String classFileName;
	private String userId;
	private String Id;
	private String inputDataFilePath;
	private int Num;

	public String getClassPath() {
		return classPath;
	}

	public void setClassPath(String classPath) {
		this.classPath = classPath;
	}

	public String getClassFileName() {
		return classFileName;
	}

	public void setClassFileName(String classFileName) {
		this.classFileName = classFileName;
	}

	public String getuserId() {
		return userId;
	}

	public void setuserId(String userId) {
		this.userId = userId;
	}

	public String getInputDataFilePath() {
		return inputDataFilePath;
	}

	public void setInputDataFilePath(String inputDataFilePath) {
		this.inputDataFilePath = inputDataFilePath;
	}

	public int getNum(){ return this.Num; }

	public void setNum(int Num){ this.Num = Num; }

	public String getId() {
		return Id;
	}

	public void setId(String id) {
		this.Id = id;
	}
}

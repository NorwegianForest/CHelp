package cn.superman.sandbox.dto;

public class Response {
	private String userId;
	private String Id;
	private boolean Normal;
	private String ClassPath;

	public String getuserId() {
		return userId;
	}

	public void setuserId(String userId) {
		this.userId = userId;
	}

	public String getId() {
		return Id;
	}

	public void setId(String Id) {
		this.Id = Id;
	}

	public String getClassPath() {
		return ClassPath;
	}

	public void setClassPath(String ClassPath) {
		this.ClassPath = ClassPath;
	}

	public boolean getNormal() {
		return Normal;
	}

	public void setNormal(boolean Normal) {
		this.Normal = Normal;
	}

}

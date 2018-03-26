package cn.superman.sandbox.dto;

import java.util.ArrayList;
import java.util.List;

public class ProblemResult {
	private String userId;
	private List<ProblemResultItem> resultItems = new ArrayList<ProblemResultItem>();

	public String getuserId() {
		return userId;
	}

	public void setuserId(String userId) {
		this.userId = userId;
	}

	public List<ProblemResultItem> getResultItems() {
		return resultItems;
	}

	public void setResultItems(List<ProblemResultItem> resultItems) {
		this.resultItems = resultItems;
	}

}

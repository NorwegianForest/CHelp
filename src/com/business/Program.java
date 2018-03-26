package com.business;

public class Program {

    private int programId;
    private String programTitle;
    private String programCode;
    private String programAnswer;
    private String programAnalysis;
    private int programType;
    private int paperId;

    public Program(int programId, String programTitle, String programCode, int programType) {
        this.programId = programId;
        this.programTitle = programTitle;
        this.programCode = programCode;
        this.programType = programType;
    }

    public Program(int programId, String programTitle, String programCode, String programAnswer, String programAnalysis, int programType, int paperId) {
        this.programId = programId;
        this.programTitle = programTitle;
        this.programCode = programCode;
        this.programAnswer = programAnswer;
        this.programAnalysis = programAnalysis;
        this.programType = programType;
        this.paperId = paperId;
    }

    public int getProgramId() {
        return programId;
    }

    public void setProgramId(int programId) {
        this.programId = programId;
    }

    public String getProgramTitle() {
        return programTitle;
    }

    public void setProgramTitle(String programTitle) {
        this.programTitle = programTitle;
    }

    public String getProgramCode() {
        return programCode;
    }

    public void setProgramCode(String programCode) {
        this.programCode = programCode;
    }

    public String getProgramAnswer() {
        return programAnswer;
    }

    public void setProgramAnswer(String programAnswer) {
        this.programAnswer = programAnswer;
    }

    public String getHTMLProgramAnswer() {
        return programAnswer.replaceAll(" ", "&nbsp;")
                .replaceAll("<", "&lt;").replaceAll("\n", "<br>");
    }

    public String getProgramAnalysis() {
        return programAnalysis;
    }

    public void setProgramAnalysis(String programAnalysis) {
        this.programAnalysis = programAnalysis;
    }

    public int getProgramType() {
        return programType;
    }

    public void setProgramType(int programType) {
        this.programType = programType;
    }

    public int getPaperId() {
        return paperId;
    }

    public void setPaperId(int paperId) {
        this.paperId = paperId;
    }
}

package vo;

public class ActionForward {
	private boolean isRedirect=false;
	private String path=null;
	
	public ActionForward() {}

	public ActionForward(String path, boolean isRedirect) {
		super();
		this.isRedirect = isRedirect;
		this.path = path;
	}

	public boolean isRedirect(){
		return isRedirect;
	}
	
	public String getPath(){
		return path;
	}
	
	public void setRedirect(boolean b){
		isRedirect=b;
	}
	
	public void setPath(String string){
		path=string;
	}
}
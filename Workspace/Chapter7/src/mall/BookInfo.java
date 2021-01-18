package mall;

public class BookInfo extends ProductInfo {
	private int page;
	private String writer;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	@Override
	public String getCode() {
		// TODO Auto-generated method stub
		return super.getCode();
	}
	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return super.getName();
	}
	@Override
	public int getPrice() {
		// TODO Auto-generated method stub
		return super.getPrice();
	}	
}

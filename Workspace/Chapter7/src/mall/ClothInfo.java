package mall;

public class ClothInfo extends ProductInfo{
	private String size;
	private String color;
	
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
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

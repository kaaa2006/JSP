package dto;

import java.io.Serializable;

public class Coffee implements Serializable {

	private static final long serialVersionUID = -4274700572038677000L;

	private String id;                // 커피 ID
	private String name;              // 커피 이름
	private int unitPrice;            // 가격
	private String description;       // 설명
	private String origin;            // 원산지
	private long unitsInStock;        // 재고 수량
	private String releaseDate;       // 출시일
	private String filename;          // 이미지 파일명
	private int quantity;             // 장바구니에 담긴 수량

	// 생성자
	public Coffee() {
		super();
	}

	public Coffee(String id, String name, int unitPrice) {
		this.id = id;
		this.name = name;
		this.unitPrice = unitPrice;
	}

	// getter & setter
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public int getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}
	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "Coffee [id=" + id + ", name=" + name + ", unitPrice=" + unitPrice
				+ ", description=" + description + ", origin=" + origin
				+ ", unitsInStock=" + unitsInStock + ", releaseDate=" + releaseDate
				+ ", filename=" + filename + ", quantity=" + quantity + "]";
	}
}

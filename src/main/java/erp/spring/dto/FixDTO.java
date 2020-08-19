package erp.spring.dto;

import java.sql.Date;

public class FixDTO {
	private int seq;
	private String name;
	private String category;
	private String category_detail;
	private String code;
	private String model_name;
	private int quantity;
	private String quantity_unit;
	private String manufacture;
	private Date purchase_date;
	public FixDTO() {}
	public FixDTO(int seq, String name, String category, String category_detail, String code, String model_name,
			int quantity, String quantity_unit, String manufacture, Date purchase_date) {
		super();
		this.seq = seq;
		this.name = name;
		this.category = category;
		this.category_detail = category_detail;
		this.code = code;
		this.model_name = model_name;
		this.quantity = quantity;
		this.quantity_unit = quantity_unit;
		this.manufacture = manufacture;
		this.purchase_date = purchase_date;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCategory_detail() {
		return category_detail;
	}
	public void setCategory_detail(String category_detail) {
		this.category_detail = category_detail;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getModel_name() {
		return model_name;
	}
	public void setModel_name(String model_name) {
		this.model_name = model_name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getQuantity_unit() {
		return quantity_unit;
	}
	public void setQuantity_unit(String quantity_unit) {
		this.quantity_unit = quantity_unit;
	}
	public String getManufacture() {
		return manufacture;
	}
	public void setManufacture(String manufacture) {
		this.manufacture = manufacture;
	}
	public Date getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(Date purchase_date) {
		this.purchase_date = purchase_date;
	}
	
}

package model;

//订单类
public class OrderBean {
	
	private int id;
	private int good_id;
	private String good_name;
	private int  quantity;
	private String month_time;
	private String clock_time;
	private String corp_name;
	private String operator;
	
	
	public int getGood_id() {
		return good_id;
	}
	public void setGood_id(int good_id) {
		this.good_id = good_id;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGood_name() {
		return good_name;
	}
	public void setGood_name(String good_name) {
		this.good_name = good_name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getMonth_time() {
		return month_time;
	}
	public void setMonth_time(String month_time) {
		this.month_time = month_time;
	}
	public String getClock_time() {
		return clock_time;
	}
	public void setClock_time(String clock_time) {
		this.clock_time = clock_time;
	}
	public String getCorp_name() {
		return corp_name;
	}
	public void setCorp_name(String corp_name) {
		this.corp_name = corp_name;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	
	
	
	
}

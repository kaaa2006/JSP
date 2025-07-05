package dto;

import java.io.Serializable;
import java.sql.Date;

public class Payment implements Serializable {
    private static final long serialVersionUID = 1L;

    private int payNum;
    private String id;          // 회원ID
    private String cardNum;
    private String cvc;
    private String valide;
    private String password;
    private String address;
    private String request;
    private Date payDate;
    private int orderNum;
    private String productId;

    public Payment() {}

    public int getPayNum() {
        return payNum;
    }
    public void setPayNum(int payNum) {
        this.payNum = payNum;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getCardNum() {
        return cardNum;
    }
    public void setCardNum(String cardNum) {
        this.cardNum = cardNum;
    }
    public String getCvc() {
        return cvc;
    }
    public void setCvc(String cvc) {
        this.cvc = cvc;
    }
    public String getValide() {
        return valide;
    }
    public void setValide(String valide) {
        this.valide = valide;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getRequest() {
        return request;
    }
    public void setRequest(String request) {
        this.request = request;
    }
    public Date getPayDate() {
        return payDate;
    }
    public void setPayDate(Date payDate) {
        this.payDate = payDate;
    }
    public int getOrderNum() {
        return orderNum;
    }
    public void setOrderNum(int orderNum) {
        this.orderNum = orderNum;
    }
    public String getProductId() {
        return productId;
    }
    public void setProductId(String productId) {
        this.productId = productId;
    }

    @Override
    public String toString() {
        return "Payment [payNum=" + payNum + ", id=" + id + ", cardNum=" + cardNum + ", cvc=" + cvc +
               ", valide=" + valide + ", password=" + password + ", address=" + address + ", request=" + request +
               ", payDate=" + payDate + ", orderNum=" + orderNum + ", productId=" + productId + "]";
    }
}

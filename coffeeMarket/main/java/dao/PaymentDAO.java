package dao;

import java.sql.*;
import java.util.ArrayList;
import dto.Payment;

public class PaymentDAO {

    private Connection getConnection() throws Exception {
        String url = "jdbc:mysql://192.168.111.102:3306/coffee";
        String user = "coffee";
        String password = "2222";
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(url, user, password);
    }

    // 결제 내역 추가
    public void insertPayment(Payment payment) throws Exception {
        String sql = "INSERT INTO PAYMENT (ID, CARDNUM, CVC, VALIDE, PASSWORD, ADRESS, REQUEST, PAYDATE, ORDERNUM, PRODUCTID) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pstmt.setString(1, payment.getId());
            pstmt.setString(2, payment.getCardNum());
            pstmt.setString(3, payment.getCvc());
            pstmt.setString(4, payment.getValide());
            pstmt.setString(5, payment.getPassword());
            pstmt.setString(6, payment.getAddress());
            pstmt.setString(7, payment.getRequest());
            pstmt.setDate(8, payment.getPayDate());
            pstmt.setInt(9, payment.getOrderNum());
            pstmt.setString(10, payment.getProductId());
            pstmt.executeUpdate();

            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    payment.setPayNum(generatedKeys.getInt(1));
                }
            }
        }
    }

    // 결제번호로 조회
    public Payment getPaymentByPayNum(int payNum) throws Exception {
        Payment payment = null;
        String sql = "SELECT * FROM PAYMENT WHERE PAYNUM = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, payNum);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    payment = new Payment();
                    payment.setPayNum(rs.getInt("PAYNUM"));
                    payment.setId(rs.getString("ID"));
                    payment.setCardNum(rs.getString("CARDNUM"));
                    payment.setCvc(rs.getString("CVC"));
                    payment.setValide(rs.getString("VALIDE"));
                    payment.setPassword(rs.getString("PASSWORD"));
                    payment.setAddress(rs.getString("ADRESS"));
                    payment.setRequest(rs.getString("REQUEST"));
                    payment.setPayDate(rs.getDate("PAYDATE"));
                    payment.setOrderNum(rs.getInt("ORDERNUM"));
                    payment.setProductId(rs.getString("PRODUCTID"));
                }
            }
        }
        return payment;
    }

    // 특정 회원의 모든 결제내역 조회
    public ArrayList<Payment> getPaymentsById(String id) throws Exception {
        ArrayList<Payment> list = new ArrayList<>();
        String sql = "SELECT * FROM PAYMENT WHERE ID = ? ORDER BY PAYDATE DESC";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Payment payment = new Payment();
                    payment.setPayNum(rs.getInt("PAYNUM"));
                    payment.setId(rs.getString("ID"));
                    payment.setCardNum(rs.getString("CARDNUM"));
                    payment.setCvc(rs.getString("CVC"));
                    payment.setValide(rs.getString("VALIDE"));
                    payment.setPassword(rs.getString("PASSWORD"));
                    payment.setAddress(rs.getString("ADRESS"));
                    payment.setRequest(rs.getString("REQUEST"));
                    payment.setPayDate(rs.getDate("PAYDATE"));
                    payment.setOrderNum(rs.getInt("ORDERNUM"));
                    payment.setProductId(rs.getString("PRODUCTID"));
                    list.add(payment);
                }
            }
        }
        return list;
    }

    // 결제 삭제
    public void deletePayment(int payNum) throws Exception {
        String sql = "DELETE FROM PAYMENT WHERE PAYNUM = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, payNum);
            pstmt.executeUpdate();
        }
    }
}

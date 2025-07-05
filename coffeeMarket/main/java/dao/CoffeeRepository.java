package dao;

import java.sql.*;
import java.util.ArrayList;
import dto.Coffee;

public class CoffeeRepository {

    private ArrayList<Coffee> listOfCoffees = new ArrayList<>();
    private static CoffeeRepository instance;

    public static CoffeeRepository getInstance() throws ClassNotFoundException, SQLException {
        if (instance == null)
            instance = new CoffeeRepository();
        return instance;
    }

    private CoffeeRepository() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String url = "jdbc:mysql://192.168.111.102:3306/coffee";
        String user = "coffee";
        String password = "2222";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("1단계 성공");

            conn = DriverManager.getConnection(url, user, password);
            System.out.println("2단계 성공");

            String sql = "SELECT * FROM COFFEE";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            System.out.println("3단계 성공");

            while (rs.next()) {
                Coffee coffee = new Coffee();
                coffee.setId(rs.getString("id"));
                coffee.setName(rs.getString("name"));
                coffee.setUnitPrice(rs.getInt("unitPrice"));
                coffee.setDescription(rs.getString("description")); 
                coffee.setOrigin("origin");           
                coffee.setUnitsInStock(rs.getLong("unitsInStock"));
                coffee.setReleaseDate(rs.getString("releaseDate"));
                coffee.setFilename(rs.getString("fileName"));

                listOfCoffees.add(coffee);
                System.out.println(coffee.toString());
            }
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) {}
            if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }
    }

    public ArrayList<Coffee> getAllCoffees() {
        return listOfCoffees;
    }

    public Coffee getCoffeeById(String id) {
        for (Coffee coffee : listOfCoffees) {
            if (coffee != null && coffee.getId() != null && coffee.getId().equals(id)) {
                return coffee;
            }
        }
        return null;
    }

    public void addCoffee(Coffee coffee) {
        listOfCoffees.add(coffee);
    }
}

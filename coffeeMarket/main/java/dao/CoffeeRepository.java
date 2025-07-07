package dao;

import dto.Coffee;
import mvc.database.DBConnection;

import java.sql.*;
import java.util.*;

public class CoffeeRepository {
    private static CoffeeRepository instance = new CoffeeRepository();
    public static CoffeeRepository getInstance() {
        return instance; 
    }
    private CoffeeRepository() {}

    public List<Coffee> getAllCoffees() {
        List<Coffee> list = new ArrayList<>();
        String sql = "SELECT * FROM COFFEE";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Coffee coffee = new Coffee();
                // 실제 DB 컬럼명과 일치시키세요 (예: "ID", "NAME" 등)
                coffee.setId(rs.getString("ID"));
                coffee.setName(rs.getString("NAME"));
                coffee.setOrigin(rs.getString("ORIGIN"));
                coffee.setUnitPrice(rs.getInt("UNITPRICE"));
                coffee.setDescription(rs.getString("DESCRIPTION"));
                coffee.setFilename(rs.getString("FILENAME"));
                list.add(coffee);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Coffee getCoffee(String id) {
        Coffee coffee = null;
        String sql = "SELECT * FROM COFFEE WHERE ID=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    coffee = new Coffee();
                    coffee.setId(rs.getString("ID"));
                    coffee.setName(rs.getString("NAME"));
                    coffee.setOrigin(rs.getString("ORIGIN"));
                    coffee.setUnitPrice(rs.getInt("UNITPRICE"));
                    coffee.setDescription(rs.getString("DESCRIPTION"));
                    coffee.setFilename(rs.getString("FILENAME"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return coffee;
    }
}

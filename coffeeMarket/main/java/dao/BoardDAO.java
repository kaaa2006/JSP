package dao;

import java.sql.*;
import java.util.ArrayList;
import dto.Board;

public class BoardDAO {

    private Connection getConnection() throws Exception {
        String url = "jdbc:mysql://192.168.111.102:3306/coffee";
        String user = "coffee";
        String password = "2222";
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(url, user, password);
    }

    // 게시글 전체 조회 (최신순)
    public ArrayList<Board> getAllBoards() throws Exception {
        ArrayList<Board> list = new ArrayList<>();
        String sql = "SELECT * FROM BOARD ORDER BY NUM DESC";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Board board = new Board();
                board.setNum(rs.getInt("NUM"));
                board.setId(rs.getString("ID"));
                board.setSubject(rs.getString("SUBJECT"));
                board.setContent(rs.getString("CONTENT"));
                board.setRegistDay(rs.getString("REGIST_DAY"));
                board.setHit(rs.getInt("HIT"));
                board.setLikeButton(rs.getInt("LIKEBUTTON"));
                list.add(board);
            }
        }
        return list;
    }

    // 게시글 번호로 조회
    public Board getBoardByNum(int num) throws Exception {
        Board board = null;
        String sql = "SELECT * FROM BOARD WHERE NUM = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, num);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    board = new Board();
                    board.setNum(rs.getInt("NUM"));
                    board.setId(rs.getString("ID"));
                    board.setSubject(rs.getString("SUBJECT"));
                    board.setContent(rs.getString("CONTENT"));
                    board.setRegistDay(rs.getString("REGIST_DAY"));
                    board.setHit(rs.getInt("HIT"));
                    board.setLikeButton(rs.getInt("LIKEBUTTON"));
                }
            }
        }
        return board;
    }

    // 게시글 작성
    public void insertBoard(Board board) throws Exception {
        String sql = "INSERT INTO BOARD (ID, SUBJECT, CONTENT, REGIST_DAY, HIT, LIKEBUTTON) VALUES (?, ?, ?, ?, 0, 0)";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, board.getId());
            pstmt.setString(2, board.getSubject());
            pstmt.setString(3, board.getContent());
            pstmt.setString(4, board.getRegistDay());
            pstmt.executeUpdate();
        }
    }

    // 조회수 증가
    public void updateHit(int num) throws Exception {
        String sql = "UPDATE BOARD SET HIT = HIT + 1 WHERE NUM = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
        }
    }

    // 좋아요 수 증가
    public void updateLikeButton(int num) throws Exception {
        String sql = "UPDATE BOARD SET LIKEBUTTON = LIKEBUTTON + 1 WHERE NUM = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
        }
    }

    // 게시글 삭제
    public void deleteBoard(int num) throws Exception {
        String sql = "DELETE FROM BOARD WHERE NUM = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, num);
            pstmt.executeUpdate();
        }
    }

    // 게시글 수정
    public void updateBoard(Board board) throws Exception {
        String sql = "UPDATE BOARD SET SUBJECT = ?, CONTENT = ? WHERE NUM = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, board.getSubject());
            pstmt.setString(2, board.getContent());
            pstmt.setInt(3, board.getNum());
            pstmt.executeUpdate();
        }
    }
}

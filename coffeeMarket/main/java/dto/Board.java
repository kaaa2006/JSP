package dto;

import java.io.Serializable;

public class Board implements Serializable {

    private static final long serialVersionUID = 1L;

    private int num;            // 글 번호 (PK)
    private String id;          // 작성자 ID (FK MEMBER.ID)
    private String subject;     // 제목
    private String content;     // 내용
    private String registDay;   // 작성일
    private int hit;            // 조회수
    private int likeButton;     // 좋아요 수

    public Board() {}

    public int getNum() {
        return num;
    }
    public void setNum(int num) {
        this.num = num;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getRegistDay() {
        return registDay;
    }
    public void setRegistDay(String registDay) {
        this.registDay = registDay;
    }
    public int getHit() {
        return hit;
    }
    public void setHit(int hit) {
        this.hit = hit;
    }
    public int getLikeButton() {
        return likeButton;
    }
    public void setLikeButton(int likeButton) {
        this.likeButton = likeButton;
    }

    @Override
    public String toString() {
        return "Board [num=" + num + ", id=" + id + ", subject=" + subject + ", content=" + content +
                ", registDay=" + registDay + ", hit=" + hit + ", likeButton=" + likeButton + "]";
    }
}

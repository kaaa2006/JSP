<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
  <link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
  <script type="text/javascript">
    function checkForm() {
      if (!document.newMember.id.value) {
        alert("아이디를 입력하세요.");
        return false;
      }
      if (!document.newMember.password.value) {
        alert("비밀번호를 입력하세요.");
        return false;
      }
      if (document.newMember.password.value != document.newMember.password_confirm.value) {
        alert("비밀번호를 동일하게 입력하세요.");
        return false;
      }
      return true;
    }
  </script>
  <title>회원 가입</title>
</head>
<body>
  <div class="container py-4">
    <jsp:include page="/menu.jsp" />
    
    <div class="p-5 mb-4 bg-light rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">회원 가입</h1>
        <p class="fs-5 text-muted">Membership Joining</p>      
      </div>
    </div>

    <div class="row justify-content-center">
      <div class="col-md-8 col-lg-6">
        <form name="newMember" action="processAddMember.jsp" method="post" onsubmit="return checkForm()">
          
          <div class="mb-3">
            <label for="id" class="form-label">아이디</label>
            <input id="id" name="id" type="text" class="form-control" placeholder="id" >
          </div>

          <div class="mb-3">
            <label for="password" class="form-label">비밀번호</label>
            <input id="password" name="password" type="password" class="form-control" placeholder="password" >
          </div>

          <div class="mb-3">
            <label for="password_confirm" class="form-label">비밀번호 확인</label>
            <input id="password_confirm" name="password_confirm" type="password" class="form-control" placeholder="password confirm" >
          </div>

          <div class="mb-3">
            <label for="name" class="form-label">성명</label>
            <input id="name" name="name" type="text" class="form-control" placeholder="name" >
          </div>

          <fieldset class="mb-3">
            <legend class="col-form-label pt-0">성별</legend>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="gender" id="genderMale" value="남">
              <label class="form-check-label" for="genderMale">남</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="gender" id="genderFemale" value="여">
              <label class="form-check-label" for="genderFemale">여</label>
            </div>
          </fieldset>

          <div class="mb-3">
            <label class="form-label">생일</label>
            <div class="d-flex gap-2">
              <input type="text" name="birthyy" maxlength="4" class="form-control" placeholder="년(4자)" style="max-width: 100px;">
              <select name="birthmm" class="form-select" style="max-width: 100px;">
                <option value="">월</option>
                <option value="01">1</option>
                <option value="02">2</option>
                <option value="03">3</option>
                <option value="04">4</option>
                <option value="05">5</option>
                <option value="06">6</option>
                <option value="07">7</option>
                <option value="08">8</option>
                <option value="09">9</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
              </select>
              <input type="text" name="birthdd" maxlength="2" class="form-control" placeholder="일" style="max-width: 100px;">
            </div>
          </div>

          <div class="mb-3">
            <label class="form-label">이메일</label>
            <div class="d-flex gap-2">
              <input type="text" name="mail1" maxlength="50" class="form-control" placeholder="email" >
              <span class="align-self-center">@</span>
              <select name="mail2" class="form-select" style="max-width: 150px;">
                <option>naver.com</option>
                <option>daum.net</option>
                <option>gmail.com</option>
                <option>nate.com</option>
              </select>
            </div>
          </div>

          <div class="mb-3">
            <label for="phone" class="form-label">전화번호</label>
            <input id="phone" name="phone" type="text" class="form-control" placeholder="phone" >
          </div>

          <div class="mb-3">
            <label for="address" class="form-label">주소</label>
            <input id="address" name="address" type="text" class="form-control" placeholder="address">
          </div>

          <div class="d-flex justify-content-between">
            <button type="submit" class="btn btn-primary">등록</button>
            <button type="reset" class="btn btn-outline-secondary">취소</button>
          </div>

        </form>
      </div>
    </div>

    <jsp:include page="/footer.jsp" />
  </div>
</body>
</html>

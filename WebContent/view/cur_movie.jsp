<%@page import="vo.MovieMainVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	MovieDAO mvDAO = MovieDAO.getInstance();
	List<MovieMainVO> list = mvDAO.selectMainPoster("O");
	%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <!-- botstrap -->
    <link
      href="../common/bootstrap-3.3.2/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
      rel="stylesheet"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- botstrap -->
    <script src="../common/bootstrap-3.3.2/js/bootstrap.min.js"></script>

    <style>
      body,
      html {
        width: 100%;
        height: 100%;
        font-family: "Noto Sans KR", sans-serif;
      }
      body {
        margin: 0px;
        overflow-x: hidden;
        overflow-y: overlay;
      }
      div {
        /* border: 1px solid black; */
      }
      a {
        text-decoration: none;
        color: black;
      }
      a:hover {
        text-decoration: none;
        color: black;
      }
      #wrap {
        display: flex;
        height: 100%;
        flex-direction: column;
        justify-content: space-between;
        align-items: center;
      }
      ul {
        list-style: none;
      }
      #header {
        width: 100%;
        min-width: 950px;
        height: 122px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        margin-bottom: auto;
      }
      #header-top {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        padding: 15px 0px;
      }
      #header-bottom {
        display: flex;
        flex-direction: row;
        justify-content: center;
        width: 85%;
        border-top: 1px solid #b2b2b2;
        margin: 0 auto;
      }
      #header-bottom ul {
        text-align: center;
        margin: 0px;
        padding: 0px;
      }
      #header-bottom ul li {
        margin: 10px 0;
        font-family: "Noto Sans KR", sans-serif;
        float: left;
      }

      #left {
        width: 25%;
      }
      #title {
        font-size: 36px;
        font-family: "Noto Sans KR", sans-serif;
      }
      #login {
        width: 25%;
        text-align: center;
      }
      #login a {
        color: #656565;
        font-family: "Noto Sans KR", sans-serif;
        font-size: 12px;
      }
      #login a:hover {
        color: #656565;
      }

      #main {
        width: 100%;
        min-width: 950px;
        max-width: 1150px;
        display: flex;
        flex-direction: row;
        flex-wrap: wrap;
        justify-content: center;
      }
      #main-title {
        width: 100%;
        text-align: center;
        padding: 10px 0;
      }

      .item {
        width: 300px;
        height: 500px;
        margin: 10px;
        border: 1px solid black;
        text-align: center;
      }
      
      .item img{
      	width: 300px;
        height: 500px;
      }

      #unfold {
        width: 100%;
        padding: 25px 0;
        display: flex;
        flex-direction: row;
        justify-content: center;
      }

      #footer {
        display: flex;
        flex-direction: row;
        justify-content: space-around;
        align-items: center;
        width: 100%;
        min-width: 950px;
        min-height: 140px;
        background-color: black;
        margin-top: auto;
      }
      #footertxt {
        color: #a2a2a2;
        font-size: 12px;
      }
      #footer-right {
        width: 20%;
      }

      .header-bottom-ul li {
        float: left;
        margin-right: 5px;
      }

      .header-bottom-ul li::before {
        padding-left: 5px;
        color: #b2b2b2;
        content: "｜";
      }

      .header-bottom-ul li:first-child::before {
        content: "";
      }

      .hidden {
        display: none;
      }
    </style>
    <script>
      window.onload = function () {
        const btn = document.getElementById("btn-unfold");
        btn.addEventListener("click", () => {
          let cnt = 5;
          const items = document.querySelectorAll(".item");
          for (const item of items) {
            if (cnt) {
              if (item.classList.contains("hidden")) {
                item.classList.remove("hidden");
                cnt--;
              }
            }
          }
        });
      };
    </script>
  </head>
  <body>
    <div id="wrap">
      <%@ include file="./header.jsp" %>
      <div id="main">
        <div id="main-title">
          <h3>현재상영작</h3>
        </div>
        <%for(int i = 0; i<list.size();i++){ %>
        <div class="item"><a href="movie_info.jsp?mvNo=<%= list.get(i).getMvNo() %>"><img src="<%= list.get(i).getMvPoster() %>"/></a></div>
        <% } %>
        
        <!-- <div class="item hidden">11</div> -->
        
        <div id="unfold">
          <input
            type="button"
            class="btn btn-default"
            id="btn-unfold"
            value="펼쳐보기"
          />
        </div>
      </div>
        <%@ include file="./footer.jsp" %>
    </div>
  </body>
</html>
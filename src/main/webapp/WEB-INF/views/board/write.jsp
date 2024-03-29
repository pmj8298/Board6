<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/ico" href="/img/favicon.ico" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/css/common.css" />
<style>
input:not(input[type=submit]){width:100%;}
input[type=submit]{width:100px;}
#goList{width:100px;}

 td{padding: 10px; 
 width: 700px;
 text-align: center;}
 
 td:nth-of-type(1) {
	width: 200px;
}

td:not([colspan]):first-child {
	background: black;
	color: white;
	font-weight: bold; 
}
input[readonly]{
background-color: #D0D0D0;}

textarea{
  height: 300px; 
  width: 100%;
}

</style>
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
 <main>
   
   <%@include file="/WEB-INF/include/menus.jsp" %>
   
   <h2>게시글 등록</h2>
   <form action="/Board/Write" method="POST">
   <input type="hidden" name="menu_id" value="${menu_id}"/>
    <table>
     <tr>
     <td>제목</td>
     <td><input type="text" name="title" /></td>
     </tr>
     <tr>
     <td>작성자</td>
     <td><input type="text" name="writer" /></td>
     </tr>
     <tr>
     <td>내용</td>
     <td><textarea name="content"></textarea></td>
     </tr>
     <tr>
     <td colspan="2">
     <input type="submit" value="저장" />
     <input type="button" value="목록" id="goList"/>
     </td>
     </tr>
    </table>
   </form>
 </main>
 
  <script>
    const goListEl = document.getElementById('goList');
    goListEl.addEventListener('click', function(e){
    	location.href='/Board/List';
    	
    })
  </script>	
</body>
</html>
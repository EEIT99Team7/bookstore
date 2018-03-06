<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>測試Ajax讀取二進制圖片檔</title>
</head>
<body>
	<div id="content">
		<h1>使用ajax讀取圖片測試</h1>		
		<div id="imgdiv"></div>		
		<input type="button" id="btnget" value="取得一張圖片">	
	</div>
	
<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript">

//當整個body讀取完時執行function
		$(document).ready(function() {
			//當btnget按鈕按下時，執行function
			$('#btnget').click(function() {
				//此為假設id 可由controller傳入的bean.getId自行帶入
				var id = 1;
				//呼叫model.RetrieveImageServlet透過bookid和型態抓取圖片
				var url = '${pageContext.request.contextPath}/getImage?id='+id+'&type=BOOK';
				//1.建造一個Ajax物件
	            var xhr = new XMLHttpRequest();
				//2.發出Get非同步請求至URL
	            xhr.open('GET', url, true);
				//設定response取回的資料型態
	            xhr.responseType = "blob";
				//成功完成呼叫時 才執行function
	            xhr.onload = function() {
	                if (this.status == 200) {
	                    var blob = this.response;
	                    var img = document.createElement("img");
	                    img.onload = function(e) {
	                        window.URL.revokeObjectURL(img.src); 
	                    };
	                    img.src = window.URL.createObjectURL(blob);
	                    $("#imgdiv").html(img);    
	                }
	            }
				//3.接收伺服器回送的資料
	            xhr.send();

			})

		})
</script>
</body>
</html>
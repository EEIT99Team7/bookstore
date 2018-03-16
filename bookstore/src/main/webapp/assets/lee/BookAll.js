$(document).ready(function() {
	$.get("${pageContext.request.contextPath}/book.controller?bookNo=2",function(data) {
		//console.log(data);
		myDiv = document.getElementById("show");
		while(myDiv.hasChildNodes()){
			myDiv.removeChild(myDiv.lastChild);
  				}
		var docFrag = document.createDocumentFragment();
		
			for(var i = 0; i < data.length; i++){
                    //alert(data[i].bookId);
                    
                    var eleImg = document.createElement("img");
                    var eleDiv1 = document.createElement("div");//外
                    var eleDiv2 = document.createElement("div");//內
                    var eleSpan1= document.createElement("span");//選取特效
                    var eleSpan2= document.createElement("span");//內容
                    var eleA= document.createElement("a");//超連結
                    //eleImg.setAttribute("src","${pageContext.request.contextPath}/bookimg.controller?bookId="+data[i].bookId);
                    $(eleImg).attr("src","${pageContext.request.contextPath}/bookimg.controller?bookId="+data[i].bookId);
                    //$(eleImg).css("height","200");
                    eleSpan1.className ="icon-focus";
                    eleSpan2.className="mbr-gallery-title"
                    eleSpan2.appendChild(document.createTextNode(data[i].title));
                    //$(eleSpan2).css("font-size","12px")//字大小
                    eleDiv1.className="mbr-gallery-item mbr-gallery-item__mobirise3 mbr-gallery-item--p1"
                    eleDiv1.setAttribute("data-tags","各國旅遊");
                    eleDiv2.setAttribute("data-toggle","modal");
                    eleDiv2.setAttribute("data-slide-to","2");
                    eleA.setAttribute("href","${pageContext.request.contextPath}/bookPages.controller?bookId="+data[i].bookId);
                    eleDiv2.append(eleImg);//內
                    eleDiv2.append(eleSpan1);//內
                    eleDiv2.append(eleSpan2);//內
                    eleDiv1.append(eleDiv2);//外 
                    
                    //eleA.appendChild(eleDiv1);
                    eleA.append(eleDiv1);
                    docFrag.append(eleA);
	 				         
				}
			$("#show").append(docFrag);
			
		 
		
		
		
		
  });	
	
	
})


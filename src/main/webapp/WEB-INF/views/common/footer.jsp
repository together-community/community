<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%-- JSTL c태그 사용을 위한 taglib 추가 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Footer -->
<footer>
	 <div id="footer">

     </div>
</footer>



<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<c:if test="${!empty sessionScope.message }">
	<script>
	$(function(){ // readey() 함수로 페이지 로딩 완료 후 alert 출력
		alert("${message}")
	})
		// EL 작성 시 scope를 지정하지 않으면
		// page -> reuest -> session -> application 순서로 검색하여
		// 일치하는 속성이 있으면 출력
	</script>
	
	<%-- message 1회 출력 후 session에서 제거 --%>
	<c:remove var="message" scope="session"/>
</c:if>

<script>
	
	// 마이페이지 반려동물 등록 모달창 제이쿼리
	const modal = document.getElementById("modal");
	
	document.getElementById("plus").addEventListener("click",function(){
	    modal.style.display = "flex";
	});
	
	modal.addEventListener("click", e => {
	    const evTarget = e.target;
	
	    if(evTarget.classList.contains("modal")) {
	        modal.style.display = "none";
	    }
	
	});


	
	// 헤더 검색창 서브 메뉴 제이쿼리
	$("#search").on("click",function(){
	     if($("#search-wrap").css("display") == "none"){// #img4가 화면에 안보이는 상태
	         $(this).addClass("borderhover");
	         $("#search-wrap").show();
	     }else{
	         //$("#search-wrap").hide();
	         $(this).removeClass("borderhover");
	     }
	 });

	// 서브바 누르면 밑에 게시판 리스트 나오게 하는 제이쿼리
	$(document).ready(function(){

		$('.btn').each(function(i){

			$(this).click(function(){
				
				$('.sub').hide();
				$('.sub').eq(i).show();
			});

		});

	});
	
	// 수정모달창 제이쿼리
	function updateModal(){
		
		   $(".updateModal").css("display", "flex");
		    
		    $(".updateModal").on("click", function(e){
		    	const evTarget = e.target;
		    	
		    	
		    	
		    	if(evTarget.classList.contains("modal")) {
		            this.style.display = "none";
		        }
		    })
				
		}


</script>

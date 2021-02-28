<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

	$(document).ready(function()
	{
		$(".btnDelete").click(function()
		{
			// 확인
			//alert($(this).val());
			
			var mid = $(this).val();
			
			if(confirm(mid + "번 데이터를 삭제하시겠습니까?"))
			{
				//$(location).attr("href","memberdelete.action?mid="+mid);
				$(location).attr("href","memberdelete.action?mid="+$(this).val());
			}
			//$(location).attr("href","memberdelete.action?mid="+$(this).val());
			//$(location).attr("href","memberdelete.action");
		});
	
		$(".btnUpdate").on("click", function()
		{
			$("#title").text("회원 정보 수정").css({"color":"red", "font-weight":"bold"});
			$("#mid").val($(this).val())
			//$("#mid").val($(this).parents("tr").find("td:eq(0)").text());
			$("#name").val($(this).parents("tr").find("td:eq(1)").text());
			$("#telephone").val($(this).parents("tr").find("td:eq(2)").text());
			
			$("#memberForm").attr("action","memberupdate.action");
		});
		
		$(".btnCancel").on("click", function()
		{
			$("#title").text("회원 정보 등록").css({"color":"black", "font-weight":"normal"});
			
			$("#mid").val("");
			$("#name").val("");
			$("#telephone").val("");
			
			$("#memberForm").attr("action","memberinsert.action");
			
			$("#name").focus();
			
		});
	});

</script>

<style>

	div h1 {
		margin-left: 20px;
	}

</style>

</head>
<body>

<div>
	<h1>회원 정보</h1>
	<hr />
</div>

<div class="container">
	<div class="panel-group">
		<div class="panel panel-default">
			<div class="panel-heading" id="title">
				회원 정보 등록
			</div>
			
			<div class="panel-body">
				<form action="memberinsert.action" method="post" role="form" id="memberForm">
					<input type="hidden" id="mid" name="mid"/>
					<div class="form-group">
						<label for="name">
							NAME :
						</label>
						<input type="text" id="name" name="name" class="form-control">
					</div>
					
					<div class="form-group">
						<label for="telephone">
							TELEPHONE :
						</label>
						<input type="tel" id="telephone" name="telephone" class="form-control">
						
						
						
					</div>
					
					<button type="submit" class="btn btn-default btn-sm">SUBMIT</button>
					<button type="button" class="btn btn-default btn-sm btnCancel">CANCEL</button>
				</form>
			</div>
		</div><!-- end. panel .panel-default -->
		
		
		<div class="panel panel-default">
			<div class="panel-heading">
				회원 정보 출력
			</div>
			
			<div class="panel-body">
				<table class="table">
					<thead>
						<tr>
							<th>MID</th>
							<th>NAME</th>
							<th>TELEPHONE</th>
							<th>삭제 / 수정</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dto" items="${list }">
						<tr> 
							<td>${dto.mid }</td>
							<td>${dto.name }</td>
							<td>${dto.telephone }</td>
							<td>
								<button type="button"
								 class="btn btn-default btn-xs btnDelete" value="${dto.mid }">삭제</button>
								<button type="button"
								 class="btn btn-default btn-xs btnUpdate" value="${dto.mid }">수정</button>
							</td>
						</tr>
						</c:forEach>
						
						
					</tbody>
				</table>
				
				<button type="button" class="btn btn-default btn-sm" disabled="disabled">
					Count <span class="badge">${count }</span>
				</button>
				
				
			</div>
		</div>
		
		
	</div>
</div>

</body>
</html>
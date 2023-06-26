<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>input</title>
    <!-- Datatable -->
    <link href="/resources/admin/vendor/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
    <!-- Custom Stylesheet -->
    <link href="/resources/admin/css/style.css" rel="stylesheet">
</head>

<body>
<div class="content-body">
<!-- row -->
	<div class="row">
       <div class="col-lg-12">
          <div class="card">
             <div class="card-body">
                 <div class="form-validation">
                     <form class="form-valide" name="formList">
                                     <div class="col-xl-6">
                                        <div class="form-group row">
                                            <div class="col-lg-6">
                                                <select class="select-form" name="shOption">
                                                	<option value="0" selected>--선택하세요--</option>
                                                	<option value="1">제목</option>
                                                	<option value="2">이름</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="shKey" name="shKey" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-lg-8 ml-auto">
                                                <button type="button" class="btn btn-primary" id="btn">Submit</button>
                                            </div>
                                        </div>
                                    </div>
                            </form>
                          <c:choose>
							<c:when test="${fn:length(list) eq 0}">
								<tr>
									<td class="text-center" colspan="9">There is no data!</td>
								</tr>	
							</c:when>
							<c:otherwise> <%-- ${list} 자바에서 넘겨준 객체 이름 --%> <!-- var="list" jstl 블럭에서 사용할 변수 이름 -->
								<c:forEach items="${list}" var="list" varStatus="status">
									<a href="/cgform?cgSeq=<c:out value="${list.cgSeq}"></c:out>"><c:out value="${list.cgSeq}"></c:out>
									<c:out value="${list.cgName}"></c:out></a>
									<br>
								</c:forEach>
							</c:otherwise>
						</c:choose>	  
                        </div>
                    </div>
                </div>
            </div>
    	</div>
	</div>
	

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <script src="/resources/admin/vendor/global/global.min.js"></script>
    <script src="/resources/admin/js/quixnav-init.js"></script>
    <script src="/resources/admin/js/custom.min.js"></script>
    


    <!-- Datatable -->
    <script src="/resources/admin/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/resources/admin/js/plugins-init/datatables.init.js"></script>
    
    <script type="text/javascript">

		$("#btn").on("click", function() {
			// 자기 자신을 다시 한 번 호출해준다.
			$("form[name=formList]").attr("method", "post");
			$("form[name=formList]").attr("action", "/cglist").submit();
			
			
			
			/* alert("adada"); */
		});
	
	</script>

</body>


</html>






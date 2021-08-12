<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<%@include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Modify</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board Modify
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<form role="form" action="/board/modify" method="post">
                        		<input type="hidden" name="pageNum" value="${cri.pageNum}"/>
	                        	<input type="hidden" name="amount" value="${cri.amount}"/>
	                        	<input type="hidden" name="keyword" value="${cri.keyword}" />
				            	<input type="hidden" name="type" value="${cri.type}" />
	                           	<div class="form-group">
	                           		<label>bno</label> <input class="form-control" name="bno" value="${board.bno}" readonly>
	                           	</div>
	                           	<div class="form-group">
	                           		<label>Title</label> <input class="form-control" name="title" value="${board.title}" >
	                           	</div>
	                           	<div class="form-group">
	                           		<label>Text Area</label> <input class="form-control" name="content" value="${board.content}" >
	                           	</div>
	                           	<div class="form-group">
	                           		<label>Writer</label> <input class="form-control" name="writer" value="${board.writer}" readonly>
	                           	</div>
	                           	<div class="form-group">
	                           		<label>RegDate</label> 
	                           		<input class="form-control" name='regDate' value='<fmt:formatDate pattern='yyyy/MM/dd' value="${board.regdate}"/>' readonly>
	                           	</div>
	                           	<div class="form-group">
	                           		<label>updateDate</label> 
	                           		<input class="form-control" name='updateDate' value='<fmt:formatDate pattern='yyyy/MM/dd' value="${board.updateDate}"/>' readonly>
	                           	</div>
							</form>
							                           	
                      		<button type='submit' data-oper='modify' class='btn btn-default'>Modify</button>
                      		<button type='submit' data-oper='remove' class='btn btn-default'>Remove</button>
                      		<button data-oper='list' class='btn btn-default'>list</button>
                           	
                        </div>
                        <!-- end panel-body -->
                    </div>
                    <!-- end panel-body -->
                </div>
                <!-- end panel-body -->
            </div>
           <!-- ./row -->
           
           <script type="text/javascript">
				$(document).ready(function() {
					var formObj = $('form');
					
					$('button').on('click', function(e) {
						e.preventDefault();
						
						var oper = $(this).data('oper');
						
						if(oper === 'remove') {
							formObj.attr('action', '/board/remove');
						} else if(oper === 'list') {
							formObj.attr('action', '/board/list').attr('method', 'get');
							var pageNumTag = $('input[name="pageNum"]').clone();
							var amountTag = $('input[name="amount"]').clone();
							var keywordTag = $('input[name="keyword"]').clone();
							var typeTag = $('input[name="type"]').clone();
							
							formObj.empty();
							formObj.append(pageNumTag);
							formObj.append(amountTag);
							formObj.append(keywordTag);
							formObj.append(typeTag);
						}
						formObj.submit();
					});
				});
           </script>
         
        <%@include file="../includes/footer.jsp"%>
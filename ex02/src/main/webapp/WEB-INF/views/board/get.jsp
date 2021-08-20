<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<%@include file="../includes/header.jsp" %>
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Read</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board Read
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                           	<div class="form-group">
                           		<label>bno</label> <input class="form-control" name="title" value="${board.bno}" readonly>
                           	</div>
                           	<div class="form-group">
                           		<label>Title</label> <input class="form-control" name="title" value="${board.title}" readonly>
                           	</div>
                           	<div class="form-group">
                           		<label>Text Area</label> <input class="form-control" name="content" value="${board.content}" readonly>
                           	</div>
                           	<div class="form-group">
                           		<label>Writer</label> <input class="form-control" name="writer" value="${board.writer}" readonly>
                           	</div>
                           	
                           	<div>
                           		<button data-oper='modify' class='btn btn-default'>Modify</button>
                           		<button data-oper='list' class='btn btn-default'>list</button>
                           		
					            <form id="operForm" action="/board/modify" method="get">
					            	<input type="hidden" id="bno" name="bno" value="${board.bno}" />
					            	<input type="hidden" name="pageNum" value="${cri.pageNum}" />
					            	<input type="hidden" name="amount" value="${cri.amount}" />
					            	<input type="hidden" name="keyword" value="${cri.keyword}" />
					            	<input type="hidden" name="type" value="${cri.type}" />
					            </form>
                           	</div>
                           	
                        </div>
                        <!-- end panel-body -->
                    </div>
                    <!-- end panel-body -->
                </div>
                <!-- end panel-body -->
            </div>
           <!-- ./row -->
           
			<script type="text/javascript" src="/resources/js/reply.js"></script>
			<script type="text/javascript">
	           $(document).ready(function() {
	        	   
	        	   var operForm = $('#operForm');
	        	   
	        	   $('button[data-oper="modify"]').on('click', function(e) {
	        		   operForm.attr('action', '/board/modify').submit();
	        	   });
	        	   
	        	   $('button[data-oper="list"]').on('click', function(e) {
	        		   operForm.find('#bno').remove();
	        		   operForm.attr('action', '/board/list');
	        		   operForm.submit();
	        	   });
	           });
	           
        	   var bnoValue = '${board.bno}';
        	   
        	   replyService.add(
        			   {reply : "JS TEST", replyer : "tester", bno : bnoValue},
        			   function(result) {
        				   alert("RESULT : " + result);
        			   }
        		)
        	   
			</script>
           
        
        <%@include file="../includes/footer.jsp"%>
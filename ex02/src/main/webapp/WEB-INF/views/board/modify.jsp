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
                            Board Register
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        <form role="form" action="/board/modify" method="post">
                           	<div class="form-group">
                           		<label>bno</label> <input class="form-control" name="title" value="${board.bno}" readonly>
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
                           	
                      		<button type='submit' data-oper='modify' class='btn btn-default' onclick="location.href='/board/modify?bno=${board.bno}'">Modify</button>
                      		<button type='submit' data-oper='remove' class='btn btn-default' onclick="location.href='/board/modify?bno=${board.bno}'">Modify</button>
                      		<button data-oper='list' class='btn btn-default' onclick="location.href='/board/list'">list</button>
                        </form>
                        
                           	
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
					
					$(button).on('click', function(e) {
						e.preventDefault();
						
						var oper = $(this).data();
						
						if(oper === 'remove') {
							formObj.attr('action', '/board/remove');
						} else if(oper === 'list') {
							self.location = '/board/list';
							return;
						}
						formObj.submit();
					});
				});
           </script>
         
        <%@include file="../includes/footer.jsp"%>
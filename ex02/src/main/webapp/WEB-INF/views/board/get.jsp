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
                           		<button data-oper='modify' class='btn btn-default' onclick="location.href='/board/modify?bno=${board.bno}'">Modify</button>
                           		<button data-oper='list' class='btn btn-default' onclick="location.href='/board/list'">list</button>
                           	</div>
                           	
                        </div>
                        <!-- end panel-body -->
                    </div>
                    <!-- end panel-body -->
                </div>
                <!-- end panel-body -->
            </div>
           <!-- ./row -->
        
        <%@include file="../includes/footer.jsp"%>
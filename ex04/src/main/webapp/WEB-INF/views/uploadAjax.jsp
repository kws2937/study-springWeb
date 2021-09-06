<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>upload with ajax</h1>
	
	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple>
	</div>
	
	<div class='uploadResult'>
		<ul>
		
		</ul>
	</div>
	<button id="uploadBtn">Upload</button>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
	<script>
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$")
		,	maxSize = 5242880
		,	clone = $('.uploadDiv').clone()
		,	uploadResult = $('.uploadResult ul');
		
		function showUploadedFile(uploadResultArr) {
			var str = '';
			
			$(uploadResultArr).each(function(i, obj) {
				str += '<li>' + obj.fileName + '</li>';
			});
			
			uploadResult.append(str);
		}
		
		function checkExtension(fileName, fileSize) {
			if(fileSize >= maxSize) {
				alert('size 초과');
				return;
			}
			
			if(regex.test(fileName)) {
				alert('해당 확장자 업로드 불가');
				return;
			}
		}
		
		$(document).ready(function() {
			$('#uploadBtn').on('click', function() {
				var formData = new FormData()
				,	inputFile = $('input[name="uploadFile"]')
				,	files = inputFile[0].files;
				
				console.log(files);
				
				for(var i=0; i<files.length; i++) {
					if(!checkExtension(files[i].name, files[i].size)) {
						return;
					}
					
					formData.append('uploadFile', files[i]);
				}
			});
			
			$.ajax({
				url : '/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					console.log(result);
					
					showUploadResult(result);
					
					$('.uploadDiv').html(cloneObj.html());
				}
			})
		});
		
	</script>
</body>
</html>
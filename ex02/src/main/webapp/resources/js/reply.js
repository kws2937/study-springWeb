console.log("reply module");

var replyService = (function() {
	
	function add(reply, callback, error) {
		console.log("add reply!!");
		
		$.ajax({
			type : 'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		})
	}
	
	function getList(param, callback, error) {
		var bno = param.bno;
		var page = param.page || 1;
		
		$.getJSON("/replies/pages/" + bno + "/" + page + ".json",
			function(data) {
				if(callback) {
					callback(data);
				}
			}).fail(function(xhr, status, err) {
				if(error) {
					error();
				}
		});
	}
	
	function remove(rno, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/replies/' + rno,
			success : function(deleteResult, status, xhr) {
				if(callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, err) {
				error(err);
			} 
		});
	}
	
	function update(reply, callback, error) {
		$.ajax({
			type : 'put',
			url : '/replies/' + reply.rno,
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, err) {
				if (error) {
					error(err);
				}
			}
		});
	}
	
	function get(rno, callback, error) {
		$.get("/replies/" + rno + ".json", function(result) {
			if(callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if(error) {
				error();
			}
		});
	}
	
	function displayTime(timeValue) {
		var today = new Date()
		, gap = today.getTime() - timeValue
		, dateObj = new Date(timeValue)
		, str = "";
		
		if(gap < (1000 * 60 * 60 * 24)) {
			var hh = dateObj.getHours()
			, mi = dateObj.getMinutes()
			, ss = dateObj.getSeconds();
			
			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss].join('');
		} else {
			var yy = dateObj.getFullYear()
			, mm = dateObj.getMonth() + 1
			, dd = dateObj.getDate();
			
			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd].join('');
		}
	}
	
	function getList(param, callback, error) {
		var bno = param.bno
		,	page = param.page || 1;
		
		$.getJSON("/replies/pages/" + bno + "/" + page + ".json", function(data) {
				if(callback) {
					//callback(data);
					callback(data.replyCnt, data.list); 
				}
		}).fail(function(xhr,status,err) {
			if(error) {
				error();
			}
		});
	}
	
	return {
		add : add,
		getList : getList,
		remove : remove,
		update : update,
		get : get,
		displayTime : displayTime
	};
})();

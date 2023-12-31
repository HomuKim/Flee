/**
 * 
 */
 /**
 * 
 */
  var reviewService = (function(){
 
 function add(review, callback, error){
 	
 	$.ajax({
 	type : 'post',
 	url : '/Flee/review/new',
 	data : JSON.stringify(review),
 	contentType : "application/json; charset=UTF-8",
 	success : function(result, status, xhr){
 		if(callback){
 			callback(result);
 		}
 	},
 	error : function(xhr, status, er){
 		if(error){
 			error(er);
 		}
 	 }
  });
 }
 
 function getMyList(param,callback,error){
 
 var rnickname = param.rnickname;
 
 var page = param.page || 1;
 
 $.ajax({
 	type : 'get',
 	url : '/Flee/review/my/'+rnickname+'/'+page+'.json',
 	contentType : "application/json; charset=UTF-8",
 	success : function(result, status, xhr){
 		if(callback){
 			callback(result.TOTAL,result.list);
 		}
 	},
 	error : function(xhr, status, er){
 		if(error){
 			error(er);
 		}
 	 }
  });
 

 }
 
 function getList(param,callback,error){
 
 var renickname = param.renickname;
 
 var page = param.page || 1;
 
 $.ajax({
 	type : 'get',
 	url : '/Flee/review/'+renickname+'/'+page+'.json',
 	contentType : "application/json; charset=UTF-8",
 	success : function(result, status, xhr){
 		if(callback){
 			callback(result.TOTAL,result.list);
 		}
 	},
 	error : function(xhr, status, er){
 		if(error){
 			error(er);
 		}
 	 }
  });
 

 }
 
 function remove(ridx, callback, error){
 	$.ajax({
 		type : 'delete',
 		url : '/Flee/review/'+ridx,
 		contentType : "application/json; charset=UTF-8",
 		success : function(deleteResult, status, xhr){
 			if(callback){
 				callback(deleteResult);
 			}
 		},
 		error : function (xhr, status, er){
 			if(error){
 				error(er);
 			}
 		}
 	});
 }
 
 function update(review, callback, error){
 	
 	$.ajax({
 	type : 'put',
 	url : '/Flee/review/update',
 	data : JSON.stringify(review),
 	contentType : "application/json; charset=UTF-8",
 	success : function(result, status, xhr){
 		if(callback){
 			callback(result);
 		}
 	},
 	error : function(xhr, status, er){
 		if(error){
 			error(er);
 		}
 	 }
  });
 }
 
 function get(ridx, callback, error){
 $.ajax({
 	type : 'get',
 	url : '/Flee/review/'+ridx+'.json',
 	contentType : "application/json; charset=UTF-8",
 	success : function(result, status, xhr){
 		if(callback){
 			callback(result);
 		}
 	},
 	error : function(xhr, status, er){
 		if(error){
 			error(er);
 		}
 	 }
  });
 }
 
 function displayTime(timeValue){
 	var today = new Date();
 	
 	var gap = today.getTime() - timeValue;
 	
 	var dateObj = new Date(timeValue);
 	
 	var str = "";
 	
 	if(gap < (1000*60*60*24)){
 		
 		var hh = dateObj.getHours();
 		var mi = dateObj.getMinutes();
 		var ss = dateObj.getSeconds();
 		
 		return [ (hh > 9 ? '' : '0') + hh, ' : ', (mi > 9 ? '' : '0') + mi, ' : ',
 				 (ss > 9 ? '' : '0') + ss].join(''); 	
 	} else {
 		var yy = dateObj.getFullYear();
 		var mm = dateObj.getMonth() + 1;
 		var dd = dateObj.getDate();
 		return [ yy, ' / ', (mm > 9 ? '' : '0') + mm, ' / ',
 				 (dd > 9 ? '' : '0') + dd].join('');
 	}
 }
 
 return {
 	add:add,
 	getList:getList,
 	getMyList:getMyList,
 	remove:remove,
 	update:update,
 	get:get,
 	displayTime:displayTime
 	};
 })();
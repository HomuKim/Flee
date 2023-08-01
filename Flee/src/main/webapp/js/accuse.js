/**
 * 
 */
 var accuseService = (function(){
 
 function add(accuse, callback, error){
 	
 	$.ajax({
 	type : 'post',
 	url : '/Flee/accusePut.fe',
 	data : JSON.stringify(accuse),
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
 
 return {
 	add:add
 	};
 })();
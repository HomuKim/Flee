/**
 * 
 */
var chatService = (function(){
 
    function create(message, callback, error){
        
        $.ajax({
        type : 'post',
        url : '/Flee/chat/new',
        data : JSON.stringify(message),
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
    
    function getMessageList(param,callback,error){
    
    var croomidx = param.croomidx;
   
    $.ajax({
        type : 'get',
        url : '/Flee/chat/'+croomidx+'.json',
        contentType : "application/json; charset=UTF-8",
        success : function(result, status, xhr){
            if(callback){
                callback(result.list, result.lastMessage);
            }
        },
        error : function(xhr, status, er){
            if(error){
                error(er);
            }
         }
     });
    
   
    }
    
     function updateReadcheck(readcheck, callback, error){
 	
 	$.ajax({
 	type : 'put',
 	url : '/Flee/chat/updateReadcheck',
 	data : JSON.stringify(readcheck),
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
 
 function getReadcheck(nickname, callback, error){
 $.ajax({
 	type : 'get',
 	url : '/Flee/chat/readcheck/'+nickname+'.json',
 	contentType : "application/json; charset=UTF-8",
 	success : function(result, status, xhr){
 		if(callback){
 			callback(result.readcheck);
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
        create: create,
        getMessageList: getMessageList,
        updateReadcheck: updateReadcheck,
        displayTime:displayTime,
        getReadcheck: getReadcheck
        };
    })();
    
    
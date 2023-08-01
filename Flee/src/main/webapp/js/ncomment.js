/**
 * 
 */
  var ncommentService = (function(){
 
 function add(ncomment, callback, error){
    
    $.ajax({
    type : 'post',
    url : '/Flee/ncomment/new',
    data : JSON.stringify(ncomment),
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
 
 function getList(param,callback,error){
 
 var nidx = param.nidx;
 
 var page = param.page || 1;
 
 $.ajax({
    type : 'get',
    url : '/Flee/ncomment/list/'+nidx+'.json',
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
 
 function remove(ncidx, callback, error){
    $.ajax({
       type : 'delete',
       url : '/Flee/ncomment/'+ncidx,
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
 
 function update(ncomment, callback, error){
    
    $.ajax({
    type : 'put',
    url : '/Flee/ncomment/update',
    data : JSON.stringify(ncomment),
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
 
 function get(ncidx, callback, error){
 $.ajax({
    type : 'get',
    url : '/Flee/ncomment/'+ncidx+'.json',
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
    remove:remove,
    update:update,
    get:get,
    displayTime:displayTime
    };
 })();
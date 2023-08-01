/**
 * 
 */
var rankService = (function(){
 
    function update(rank, callback, error){
        
        $.ajax({
        type : 'put',
        url : '/Flee/rank/update',
        data : JSON.stringify(rank),
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
    
    function blockUpdate(rank, callback, error){
        
        $.ajax({
        type : 'put',
        url : '/Flee/rank/blockUpdate',
        data : JSON.stringify(rank),
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
        update:update,
        blockUpdate:blockUpdate
        };
    })();
    
    
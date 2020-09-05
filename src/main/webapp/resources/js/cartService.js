/**
 * 
 */
let cartService = (function(){
	function add(cart, callback, error) {
		$.ajax({
			type : 'POST',
			url : '/api/v1/cart',
			data : JSON.stringify(cart),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, err) {
				if(error) {
					error(err);
				}
			}
		});
	}
	
	function getList(callback, error) {
		$.getJSON("/api/v1/cart", function(list){
			callback(list);
		}).fail(function(xhr, status, err){
			if(error) {
				error();
			}
		});
	}
	
	function get(cartId, callback, error) {
    	$.get("/api/v1/cart/"+cartId, function(result) {
    		if(callback) {
    			callback(result);
    		}
    	}).fail(function(xhr, status, err) {
    		if(error) {
    			error();
    		}
    	});
    }
	
	function update(cart, callback, error) {
		$.ajax({
			type : 'PUT',
			url : '/api/v1/cart/'+cart.cartId,
			data : JSON.stringify(cart),
			contentType : "application/json; charset=UTF-8",
			success : function(result, status, xhr) {	
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				
				if(error) {
					error(er);
				}
			}
		});
	}
	
	return {
		getList : getList
	  , add: add
	  , get: get
	  , update: update
	}
})();
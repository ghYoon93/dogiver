/**
 * 
 */
$(document).ready(function(){
	let tid = $('#tid').val();
	if(tid!=null){
		let aid = $('#aid').val();
		$(opener.document).find('input[name=tid]').val(tid);
		$(opener.document).find('input[name=aid]').val(aid);
		
		let form = window.opener.document.getElementById('form-order');
		form.action = 'insertOrder';
		form.target = '';
		form.submit();		
	}
	self.close();
});
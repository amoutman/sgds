
/*
 * 获取手机验证码
 */
var countdown=60; 
function getVerifyCode(val,url,phoneText){
	$.ajax({
		type : "post",
		async : false,
		url : url,
		data : {phone:phoneText},
		dataType : "json",
		success : function(data) {
			$("#token").val(data.responseParams);
			val.setAttribute("disabled", true); 
	 		$('#'+val.id).css('background', '#ccc');
	 		val.value="重新发送(" + countdown + ")"; 
	 		jump(val.id);
		},
		error : function() {
			alert("获取验证码出错！");
		}
	});
}

/*
 * 验证码限时，每60秒可点击一次获取手机验证码
 */
function jump(id) {    
    window.setTimeout(function(){    
    	countdown--;    
        if(countdown > 0) {
            $('#'+id).val("重新发送(" + countdown + ")") ;  
            jump(id);
        } else {
        	jQuery('#'+id).attr('disabled', false);  
        	$('#'+id).css('background', '#f39801');
        	$('#'+id).val("获取验证码") ;   
        	countdown=60;
        }    
    }, 1000);
}


//var menuTree;
var prefix = "/business/safe"
$(function() {

	validateRule();
});
$.validator.setDefaults({
    submitHandler : function() {
        saveSafe();
    }
});

function saveSafe() {
	var safeData = $('#signupForm').serialize();
	$.ajax({
		cache : true,
		type : "POST",
		url : prefix+"/saveSafe",
		data : safeData, // 你的formid
		async : false,
		error : function(request) {
			alert("Connection error");
		},
		success : function(data) {
			if (data.code == 0) {
				parent.layer.msg("操作成功");
				parent.reLoad();
				var index = parent.layer.getFrameIndex(window.name); // 获取窗口索引

				parent.layer.close(index);

			} else {
				parent.layer.msg(data.msg);
			}
		}
	});
}

function validateRule() {
	var icon = "<i class='fa fa-times-circle'></i> ";
	$("#signupForm").validate({
		rules : {
            year: {
				required : true
			}
		},
		messages : {
            year : {
				required : icon + "年份字段必填"
			}
		}
	});
}
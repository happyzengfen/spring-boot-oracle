$app = {
    ajax : {
        get: function(url, data){
            var defaultConfig = {
                method: "GET",
                dataType: "json",
                contentType: "application/x-www-form-urlencoded;charset=UTF-8"
            };
            defaultConfig.url = url;
            defaultConfig.data = data;
            var XHR = $.ajax(defaultConfig);
            return XHR.promise();
        },
        post: function(url, data){
            var defaultConfig = {
                method: "POST",
                dataType: "json",
                contentType: "application/json;charset=UTF-8"
            };
            defaultConfig.url = url;
            defaultConfig.data = data;
            var XHR = $.ajax(defaultConfig);
            return XHR.promise();
        }
    },
    page: {
        getOrderWay : function(str){
            var orderWay = str.substring(0, str.indexOf("ending"));
            return orderWay;
        }
    },
    message: {
        buildMessage: function(json){
            if(json && typeof json.code != "undefined" && typeof json.msg != "undefined"){
                if(json.code === 0){
                    return { showClose: true, message: json.msg, type: 'success'};
                }else{
                    return { showClose: true, message: json.msg, type: 'error'};
                }
            }
            return { showClose: true, message: '操作失败',type: 'error'};
        },
        defaultError: function(){
            return { showClose: true, message: '操作失败',type: 'error'};
        },
        defaultSuccess: function(){
            return { showClose: true, message: '操作成功', type: 'success'};
        },
        success: function(msg){
            return { showClose: true, message: msg,type: 'success'};
        },
        error: function(msg){
            return { showClose: true, message: msg,type: 'error'};
        },
        warning: function(msg){
            return { showClose: true, message: msg, type: 'warning'};
        },
        info: function(msg){
            return { showClose: true, message: msg};
        }
    },
    isSuccess: function(json){
        if(json && typeof json.code != "undefined"){
            return json.code === 0;
        }
        return false;
    }
};
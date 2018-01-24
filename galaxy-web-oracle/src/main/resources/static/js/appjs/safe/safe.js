var prefix = "/business/safe"
$(function () {
    load();

});
$('#exampleTable').on('load-success.bs.table', function (e, data) {
    if (data.total && !data.rows.length) {
        $('#exampleTable').bootstrapTable('selectPage').bootstrapTable('refresh');
    }
});

function load() {
    $('#exampleTable')
        .bootstrapTable(
            {
                method: 'get', // 服务器数据的请求方式 get or post
                url: prefix + "/list", // 服务器数据的加载地址
                queryParams: function (params) {
                    return {
                        limit: params.limit,
                        offset: params.offset,
                        year:$("#year").val()
                    };
                },
                showHeader: true,
                showColumns: true,
                showRefresh: true,//显示刷新按钮
                iconSize: 'outline',
                toolbar: '#exampleToolbar',
                striped: true, // 设置为true会有隔行变色效果
                dataType: "json", // 服务器返回的数据类型
                pagination: true, // 设置为true会在底部显示分页条
                // queryParamsType : "limit",
                // //设置为limit则会发送符合RESTFull格式的参数
                singleSelect: false, // 设置为true将禁止多选
                // contentType : "application/x-www-form-urlencoded",
                // //发送到服务器的数据编码类型
                pageSize: 10, // 如果设置了分页，每页数据条数
                pageNumber: 1, // 如果设置了分布，首页页码
                pageList: [10, 25, 50, 100],
                // search : true, // 是否显示搜索框
                // showColumns : true, // 是否显示内容下拉框（选择显示的列）
                sidePagination: "server", // 设置在哪里进行分页，可选值为"client" 或者
                // "server"
                columns: [
                    {
                        checkbox: true
                    },
                    {
                        field: 'id', // 列字段名
                        title: '序号' // 列标题
                    },
                    {title: '填报年份', field: 'year'},
                    {title: '填报季度', field: 'month'},
                    {title: '中介机构名称', field: 'deptname'},
                    {title: '机构人数-本季度末', field: 'deptpeoplenow'},
                    {title: '机构人数-上年同期', field: 'deptpeoplepre'},
                    {title: '持证人数-本季度末', field: 'certificatepeoplenow'},
                    {title: '持证人数-上年同期', field: 'certificatepeoplepre'},
                    {title: '保费金额-本年累计', field: 'premiumnow'},
                    {title: '保费金额-上年同期', field: 'premiumpre'},
                    {title: '佣金金额-本年累计', field: 'turnovernow'},
                    {title: '佣金金额-上年同期', field: 'turnoverpre'},
                    {title: '利润金额-本年累计', field: 'profitnow'},
                    {title: '利润金额-上年同期', field: 'profitpre'},
                    {title: '产险业务-区域范围', field: 'propArearange'},
                    {title: '产险业务-保险公司名称', field: 'propInsname'},
                    {title: '产险业务-险种名称', field: 'propInsurancename'},
                    {title: '产险业务-保费-本期', field: 'propPremiumnow'},
                    {title: '产险业务-退保保费-本期', field: 'propPremiumsurrender'},
                    {title: '产险业务-批增保费-本期', field: 'propPremiumadd'},
                    {title: '产险业务-批减保费-本期', field: 'propPremiumminus'},
                    {title: '产险业务-保费-累计', field: 'propPremiumpre'},
                    {title: '产险业务-佣金-本期', field: 'propCommissionnow'},
                    {title: '产险业务-退保佣金-本期', field: 'propCommissionsurrender'},
                    {title: '产险业务-批增佣金-本期', field: 'propCommissionadd'},
                    {title: '产险业务-批减佣金-本期', field: 'propCommissionminus'},
                    {title: '产险业务-再保佣金-本期', field: 'propCommissionreinsurance'},
                    {title: '产险业务-佣金-累计', field: 'propCommissionpre'},
                    {title: '产险业务-本期网销保费', field: 'propPremiumnet'},
                    {title: '产险业务-本期电销保费', field: 'propPremiumtel'},
                    {title: '寿险业务_区域范围', field: 'lifeArearange'},
                    {title: '寿险业务_保险公司名称', field: 'lifeInsname'},
                    {title: '寿险业务_险种名称', field: 'lifeInsurancename'},
                    {title: '寿险业务_本期新单保费', field: 'lifePremiumnow'},
                    {title: '寿险业务_累计新单保费', field: 'lifePremiumpre'},
                    {title: '寿险业务_本期续期保费', field: 'lifePremiumrenewalnow'},
                    {title: '寿险业务_累计续期保费', field: 'lifePremiumrenewalpre'},
                    {title: '寿险业务_本期新单佣金', field: 'lifeCommissionnow'},
                    {title: '寿险业务_累计新单佣金', field: 'lifeCommissionpre'},
                    {title: '寿险业务_本期续期佣金', field: 'lifeCommissionrenewalnow'},
                    {title: '寿险业务_累计续期佣金', field: 'lifeCommissionrenewalpre'},
                    {title: '寿险业务_保费-网销', field: 'lifePremiumnet'},
                    {title: '寿险业务_保费-电销', field: 'lifePremiumtel'},
                    {
                        title: '发送状态', field: 'status',
                        formatter: function (value, row, index) {
                            if (value == '0') {
                                return '<span class="label label-danger">未发送</span>';
                            } else if (value == '1') {
                                return '<span class="label label-primary">已发送</span>';
                            } else {
                                return '<span class="label label-danger">发送失败</span>';
                            }
                        }
                    },
                    {title: '创建时间', field: 'createTime'},
                    {title: '修改时间', field: 'updateTime'},
                    {
                        title: '操作',
                        field: 'id',
                        align: 'center',
                        formatter: function (value, row, index) {
                            var e = '<a  class="btn btn-primary btn-sm ' + s_edit_h +
                                '" href="#" mce_href="#" title="编辑" onclick="edit(\''
                                + row.id
                                + '\')"><i class="fa fa-edit "></i>编辑&nbsp;</a> ';
                            return e;
                        }
                    }]
            });
}
function reLoad() {
    $('#exampleTable').bootstrapTable('refresh');
}


function batchSafeRemove() {
    var rows = $('#exampleTable').bootstrapTable('getSelections'); // 返回所有选择的行，当没有选择的记录时，返回一个空数组
    if (rows.length == 0) {
        layer.msg("请选择要删除的数据");
        return;
    }
    layer.confirm("确认要删除选中的'" + rows.length + "'条数据吗?", {
        btn: ['确定', '取消']
        // 按钮
    }, function () {
        var ids = new Array();
        // 遍历所有选择的行数据，取每条数据对应的ID
        $.each(rows, function (i, row) {
            ids[i] = row['id'];
        });

        $.ajax({
            url : prefix + "/batchSafeRemove",
            type : "post",
            data : {
                'ids' : ids
            },
            success : function(data) {
                if (data.code == 0) {
                    layer.msg("删除数据成功");
                    reLoad();
                } else {
                    layer.alert(data.message);
                    reLoad();
                }
            }
        });

    }, function () {
    });
}
function  sendSafeData() {
    var rows = $('#exampleTable').bootstrapTable('getSelections'); // 返回所有选择的行，当没有选择的记录时，返回一个空数组
    if (rows.length == 0) {
        layer.msg("请选择需要发送的数据");
        return;
    }
    if(rows.length>1){
        layer.msg("一次只能发送一条数据");
        return;
    }
    layer.confirm("确认要发送这条数据吗?", {
        btn: ['确定', '取消']
        // 按钮
    }, function () {
        var ids = new Array();

        // 遍历所有选择的行数据，取每条数据对应的ID
        $.each(rows, function (i, row) {
            ids[i] = row['id'];

        });
        console.log(ids);
       $.ajax({
            url : prefix + "/sendSafe",
            type : "post",
            data : {
                'ids' : ids
            },
            success : function(data) {
                if (data.code == 0) {
                    layer.msg("发送成功");
                    reLoad();
                } else {
                    layer.alert(data.message);
                    reLoad();
                }
            }
        });

    }, function () {
    });
}


function importSafeData() {
//导入csv数据
    layer.open({
        type: 2,
        title: '导入中介数据',
        maxmin: true,
        shadeClose: false, // 点击遮罩关闭层
        area: ['500px', '300px'],
        content: prefix + '/importSafeData' // iframe的url
    });
}

function addSafeData() {
    //添加数据
    layer.open({
        type: 2,
        title: '添加中介数据',
        maxmin: true,
        shadeClose: false, // 点击遮罩关闭层
        area: ['1024px', '600px'],
        content: prefix + '/addSafe' // iframe的url
    });
}

function  edit(id) {
    layer.open({
        type : 2,
        title : '修改中介数据',
        maxmin : true,
        shadeClose : false, // 点击遮罩关闭层
        area : [ '1024px', '600px' ],
        content : prefix + '/editSafe/' + id // iframe的url
    });
}
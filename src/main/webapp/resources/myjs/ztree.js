/**
 * Created by lhd on 2017/5/16.
 */
var setting = {
    check: {
        enable: true
    },
    data: {
        key: {
            title: "title"
        },
        simpleData: {
            enable: true
        }
    },
    callback: {
        onCheck: onCheck
    }
};

var zNodes;


/*var zNodes = [
 {id: 1, pId: 0, name: "父节点1", title: "", checked: true, open: true, iconSkin: "pIcon01"},
 {id: 11, pId: 1, name: "父节点11", title: "", checked: true},
 {id: 111, pId: 11, name: "叶子节点111", title: "", checked: true, isHidden: true},
 {id: 112, pId: 11, name: "叶子节点112", title: ""},
 {id: 113, pId: 11, name: "叶子节点113", title: ""},
 {id: 12, pId: 1, name: "父节点12", title: "", isHidden: true},
 {id: 121, pId: 12, name: "叶子节点121", title: ""},
 {id: 122, pId: 12, name: "叶子节点122", title: "", isHidden: true},
 {id: 123, pId: 12, name: "叶子节点123", title: ""},
 {id: 2, pId: 0, name: "父节点2", title: ""},
 {id: 21, pId: 2, name: "父节点21", title: "", isHidden: true},
 {id: 211, pId: 21, name: "叶子节点211", title: ""},
 {id: 212, pId: 21, name: "叶子节点212", title: ""},
 {id: 213, pId: 21, name: "叶子节点213", title: ""},
 {id: 22, pId: 2, name: "父节点22", title: ""},
 {id: 221, pId: 22, name: "叶子节点221", title: ""},
 {id: 222, pId: 22, name: "叶子节点222", title: ""},
 {id: 223, pId: 22, name: "叶子节点223", title: ""},
 ];*/

function onCheck(e, treeId, treeNode) {
    count();
}

function setTitle(node) {
    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
    var nodes = node ? [node] : zTree.transformToArray(zTree.getNodes());
    for (var i = 0, l = nodes.length; i < l; i++) {
        var n = nodes[i];
        n.title = "[" + n.id + "] isFirstNode = " + n.isFirstNode + ", isLastNode = " + n.isLastNode;
        zTree.updateNode(n);
    }
}
function count() {
    function isForceHidden(node) {
        if (!node.parentTId) return false;
        var p = node.getParentNode();
        return !!p.isHidden ? true : isForceHidden(p);
    }

    var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
        checkCount = zTree.getCheckedNodes(true).length,
        nocheckCount = zTree.getCheckedNodes(false).length,
        hiddenNodes = zTree.getNodesByParam("isHidden", true),
        hiddenCount = hiddenNodes.length;

    for (var i = 0, j = hiddenNodes.length; i < j; i++) {
        var n = hiddenNodes[i];
        if (isForceHidden(n)) {
            hiddenCount -= 1;
        } else if (n.isParent) {
            hiddenCount += zTree.transformToArray(n.children).length;
        }
    }

    $("#isHiddenCount").text(hiddenNodes.length);
    $("#hiddenCount").text(hiddenCount);
    $("#checkCount").text(checkCount);
    $("#nocheckCount").text(nocheckCount);
}
function showNodes() {
    var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
        nodes = zTree.getNodesByParam("isHidden", true);
    zTree.showNodes(nodes);
    setTitle();
    count();
}
function hideNodes() {
    var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
        nodes = zTree.getSelectedNodes();
    if (nodes.length == 0) {
        alert("请至少选择一个节点");
        return;
    }
    zTree.hideNodes(nodes);
    setTitle();
    count();
}

/**
 * 获取所有节点
 */
function getNodes() {
    var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
        nodes = zTree.getCheckedNodes(true);
    $.each(nodes, function (index, node) {
        nodess += node.id;
        nodess += ",";
    });
}

//节点id集合
var nodess = "";
var roleId;
/**
 * 构建树
 */
$(document).ready(function () {
    $(".role-s").click(function () {
        roleId = $(this).data('zid');
        initTree(roleId);
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        setTitle();
        count();
    })

    $('#btn-ztree').click(function () {
        $("#myModal1").modal('hide');
        updateNodes(roleId);
    })
})



/**
 * 节点更新没有用户的
 */
var updateNodes = function (roleId) {
    nodess = "";
    getNodes();
    $.ajax({  //JQuery的Ajax
        type: 'post',
        dataType: "json",//返回数据类型
        async: false,
        contentType:"application/json;charset:utf-8",
        url: "/role/role-z-update/" + roleId,//请求的action路径
        data: JSON.stringify(nodess),  //同步请求将锁住浏览器，用户其它操作必须等待请求完成才可以执行
        error: function (data) {//请求失败处理函数
            //alert(data.result);
        },
        success: function (data) { //请求成功后处理函数。  取到Json对象data
            //alert(data.result);
        }
    })
}

/**
 * 获取数据，初始化树
 * @param roleType
 */
function initTree(roleId) {
    $.ajax({  //JQuery的Ajax
        type: 'POST',
        dataType: "json",//返回数据类型
        async: false,
        url: "/role/role-z-list/"+roleId,//请求的action路径
        data: {"flag": true},  //同步请求将锁住浏览器，用户其它操作必须等待请求完成才可以执行
        error: function (data) {//请求失败处理函数
            //alert(data.value);
        },
        success: function (data) { //请求成功后处理函数。  取到Json对象data
            zNodes = data;   //把后台封装好的简单Json格式赋给treeNodes
        }
    })
};
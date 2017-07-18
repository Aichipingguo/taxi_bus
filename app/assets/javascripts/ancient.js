//= require common
//= require bootstrap.min
//= require metismenu
//= require jquery.slimscroll.min
//= require hplus.min
//= require contabs.min
//= require pace.min

// require ./ueditor_config

$(function(){
  // 商品匹配产品
  $(document).on('click', '.item_match_product_link', function(){
    layer.open({
      type: 2,
      area: ['90%', '90%'],
      fix: false, //不固定
      title: "匹配产品 - " + $(this).attr("title"),
      content: "/ancient/items/" + $(this).attr("id") + "/match_product_pre"
    });
  });

  // 优化param_html显示
  // 苏宁
  $("table#itemParameter").addClass('common');
  // 京东
  $("table.Ptable").addClass('common');

  // 商品价格曲线
  $(document).on('click', '.item_price_chart', function(){
    layer.open({
      type: 2,
      area: ['700px', '500px'],
      fix: false, //不固定
      title: "商品价格曲线图",
      maxmin: true,
      content: "/ancient/items/" + $(this).attr("id") + "/price_charts"
    });
  });

  // 产品平均价格曲线
  $(document).on('click', '.product_price_chart', function(){
    layer.open({
      type: 2,
      area: ['700px', '500px'],
      fix: false, //不固定
      title: "产品均价曲线图",
      maxmin: true,
      content: "/ancient/products/" + $(this).attr("id") + "/price_charts"
    });
  });

  // 手动匹配商品
  $(document).on('click', '#select_product_link', function(){
    var product_id = $('input:radio[name=product_id]:checked').val();
    if(isEmpty(product_id)){
      layer.open({title: '手动匹配商品', content: '请选择一个产品', icon: 2});
      return false
    }
    var item_id = $("#item_id").val();
    $.ajax({
      type: "post",
      url: "/ancient/items/" + item_id + "/match_product_man?product_id=" + product_id,
      success: function(data, textStatus) {
        if (data.success) {
          layer.msg('匹配成功', {icon: 1});
          setTimeout("window.parent.location.reload();", 800);
        }else{
          layer.open({title: '匹配失败', content: data.msg, icon: 2});
        }
      },
      error: function() {
        alert('系统错误');
      }
    });
  });

})

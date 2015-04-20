<#assign pro = result.val.productDto>
<#assign item = result.val.items[0]>
<#include "/fontend/search.ftl"/>
<@web 
	title="${pro.title}" 
	js=["/static/lib/order/item.js"] 
	css=["http://static-web.b5m.com/common/css/common.css?v=512015041318123014",
	"http://static-web.b5m.com/common/css/common.css?v=512015041318123014","http://static-web.b5m.com/common/css/common.css?v=512015041318123014"]>
	<link rel="stylesheet" type="text/css" href="http://static-web.b5m.com/korea/css/kor-details.css?v=512015041318123014" />
<link rel="stylesheet" type="text/css" href="http://detail.b5m.com/web/static/css/common/detail_han.css?v=512015041318123014" />

<!--中间内容-->
<div class="korea-bg">
    <div class="korea-content">
        <p class="path_bar">
            <a href="javascript:void(0)">首页</a>&nbsp;&gt;&nbsp;
                        <a class="" href="javascript:void(0)">XXXX</a>&nbsp;&gt;&nbsp;
                        <a class="" href="javascript:void(0)">XXXX</a>&nbsp;&gt;&nbsp;
                        <span>${pro.title}</span>
        </p>
        <div class="centre-details clearfix">
            <div class="centre-details-l">
                                <div class="details-big-img vertical-center">
                    <img src="${pro.img}" alt="" />
                </div>
                                <div class="details-small-img-btns">
                    <div class="prev unclick"></div>
                    <div class="next"></div>
                </div>
                <div class="details-small-img-list">
                 <ul class="details-small-img clearfix">
				 <li class="small-img"><a class="vertical-center"><img src="${pro.img}" alt="" /></a></li>
				 </ul>
                </div>
            </div>
            <ul class="centre-details-r ">
                <li class="details-title">
                    <h3>${pro.title}</h3>
                    <span>${pro.subTitle}</span>
                </li>
                <div class="grid imgc cm">
                                    <div class="col imge ll">
                        <div class="dp bp">
                            <span class="ia">帮5买价</span>
                            &yen;&nbsp;<span class="price total-product-price" data="${item.price?string('0.00')}">${item.price?string('0.00')}</span>
                            <span class="stamps">免邮</span>
                        </div>
                        <div class="dp"><span class="ia">天猫价</span>&yen;&nbsp;<span class="pn">${item.midPrice?string('0.00')}</span></div>
                        <div class="dp"><span class="ia">市场价</span>&yen;&nbsp;<span class="pn">${item.highPrice?string('0.00')}</span></div>
                    </div>
                
                    <div class="col imge rr">
                                                <div class="count">省</div>
                        <span class="cm-price"><dfn>&yen;</dfn><b>${(item.midPrice-item.price)?string('0.##')}</b>
                        <a href="${pro.outerUrl}" target="_blank">比比天猫&gt;</a></span>
                                                <!--
                        <p class="cm-text">满100减50，还有优惠券哦！</p>
                        -->
                    </div>
                    <!--[if lt IE 8]><span class="iecp"></span><![endif]-->
                </div>
                <li class="sku-info">
                    <dl class="centrt-sku">
                        <input type="hidden" class="maxNum" value="" />
                        <dt class="centre-details-num" id="buy-count-name">数量</dt>
                        <dd class="centre-details-quantity">
                            <span data-id="005" data-cid="C_002" class="btn-subtraction">-</span>
                            <span class="input-box">
                            
                            <input id="quantity005" name="quantity005" type="text" value="1" readonly autocomplete="off" />
                            
                            </span>
                            <span data-id="005" data-cid="C_002" class="btn-add">+</span>
                            <span class="surplus_none" style="display: none;">库存<span class="quantity" style="float:none;"></span>件</span>
                                                    </dd>

                    </dl>
                    <dl class="sku-lis">
                        <dt>
                            <span>库存<dfn id="quantity_summa">${pro.store}</dfn></span>
                            <span class="sku-bord">销量<dfn>${pro.salesQuantity}</dfn></span>
                            <span><a href="javascript:;" class="go-fav" id="" data-url="http://detail.b5m.com/item.html?tid=2001814" ><em></em>收藏</a></span>

                        </dt>
                    </dl>
                    
                    <dl class="sku-msg">
                        <a class="error-close">×</a>
                        <p>
                            <em class="icon-waring-red"></em>请选择你要的商品信息
                        </p>
                    </dl>
                </li>
                <li class="selected-info" style="display: none;">您已选择
                    <span></span>
                </li>
                <li class="details-btns">
                    <a class="btn-sold-ok btn-center-red btn-red-two" id="buyNow" href="javascript:;">立即购买</a>
                    <a class="btn-sold-ok btn-center-orange btn-orange" href="javascript:;">加入购物车</a>
                    <a class="btn-sold-err" href="javascript:;" style="display:none;">立即购买</a>
                </li>
            </ul>
        </div>

        </div>

        <div id="DetailDialog">
            <span class="add-cart-success" id="DetailDialogBox"> <a href="http://cart.b5m.com" class="go-to-cart">去购物车结算</a> <a href="javascript:void(0);" class="go-shoping">继续购物</a><i class="cart-close"></i></span>
            <div id="DetailDialogBg"></div>
        </div>

        
        <div class="tipc fav-tip" style="display:none;">
            <div class="isner">
                <a href="javascript:;" class="c-btn close">&nbsp;</a>
            </div>
        </div>

    </div>
</div>
<!--中间内容-->

<div id="window-pop-vip-tip" class="" style="display: none;">
</div>

<form id="buyNowForm" action="${domain}/order/buyNow.htm" method="post">
<input type="hidden" name="tid" id="tid" value="${pro.id}" >
</form>
</@web>
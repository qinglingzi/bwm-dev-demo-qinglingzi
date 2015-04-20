<#include "/fontend/useCenter.ftl"/>
<@web 
	title="我的订单页面" 
	js=["/static/lib/order/myOrder.js"]
	css=["http://static-web.b5m.com/questionnaire/css/vip.css","http://static-web.b5m.com/ucenter-order/css/order.css?v=20150417055816"]>




<div class="ucenter-main fr">	
	<div class="ucenter-title cf">
    	<strong class="l">帮我买订单</strong>
        <div class="center-question r">
            <a href="javascript:viod(0);" class="que-guide">退货退款指南</a> | 
            <a href="http://order.b5m.com/dh/page/order/question/view.htm" class="que-common">常见问题</a>
            <a href="javascript:void(0);" class="que-b5m online"><em></em>小帮咨询</a>
        </div>
    </div>
    
    <div id="myorder-class" class="myorder-class">
    	<div class="order-clist">
    		<a href="javascript:void(0);" class="order-cbox now">所有订单 <i class="triangle"></i></a>
    		<a href="javascript:void(0);" class="order-cbox">待付款<em></em><i class="triangle"></i></a>
    		<a href="javascript:void(0);" class="order-cbox">待发货<em></em><i class="triangle"></i></a>
    		<a href="javascript:viod(0);" class="order-cbox">待收货<em></em><i class="triangle"></i></a>
    	</div>
    	<div class="order-filter" style="display: block;">
    		<div class="filter-ctime">成交时间：
    			<div class="selectbox">
    				<span class="sod_select  above" tabindex="0" data-cycle="false" data-links="false" data-links-external="false" data-placeholder-option="false" data-filter=""><span class="sod_label">全部</span><span class="sod_arrow"></span><span class="sod_list_wrapper"><span class="sod_list"><span class="sod_option  selected active " title="全部" data-value="0">全部</span><span class="sod_option " title="今年内" data-value="1">今年内</span><span class="sod_option " title="2014" data-value="2">2014</span><span class="sod_option " title="2013" data-value="3">2013</span><span class="sod_option " title="2012" data-value="4">2012</span><span class="sod_option " title="2012以前" data-value="5">2012以前</span></span></span><select> 
	    				<option value="0" selected="selected">全部</option>
    				<option value="1">今年内</option><option value="2">2014</option><option value="3">2013</option><option value="4">2012</option><option value="5">2012以前</option></select></span>
    			</div>
    		</div>
    		<div class="filter-status">交易状态：
    			<div class="selectbox">
    				<span class="sod_select" tabindex="0" data-cycle="false" data-links="false" data-links-external="false" data-placeholder-option="false" data-filter=""><span class="sod_label">已付款</span><span class="sod_arrow"></span><span class="sod_list_wrapper"><span class="sod_list"><span class="sod_option" title="全部" data-value="">全部</span><span class="sod_option" title="等待付款" data-value="100">等待付款</span><span class="sod_option active selected" title="已付款" data-value="200">已付款</span><span class="sod_option" title="已发货" data-value="300">已发货</span><span class="sod_option" title="已收货" data-value="400">已收货</span><span class="sod_option" title="交易成功" data-value="500">交易成功</span><span class="sod_option" title="交易关闭" data-value="600">交易关闭</span></span></span><select>
	    				<option value="" selected="selected">全部</option>
                        <option value="100">等待付款</option>
                        <option value="200">已付款</option>
                        <option value="300">已发货</option>
                        <option value="400">已收货</option>
                        <option value="500">交易成功</option>
                        <option value="600">交易关闭</option>
    				</select></span>
    			</div>
    		</div>
    		<div class="order-search"><input type="text" autocomplete="off" value="" placeholder="输入商品名称、订单编号、支付号" class="search-text"><a href="javascript:void(0)" class="search-btn">查询</a></div>
    	</div>
    </div>
    <div id="myorder-list" class="myorder-list">
    	<table class="order-ltitle">
    		<colgroup>
    			<col width="249">
    			<col width="100">
    			<col width="90">
    			<col width="39">
    			<col width="115">
    			<col width="77">
    			<col width="92">
    		</colgroup>
    		<tbody><tr>
    			<th>订单信息</th>
    			<th>规格</th>
    			<th>单价（元）</th>
    			<th>数量</th>
    			<th>订单总额</th>
    			<th>交易状态</th>
    			<th>操作</th>
    		</tr>
    	</tbody></table>
    	<#if result.ok>
    	<div class="order-list">
    	<#list result.data.all as order>
    	<table class="order-lbox">
    	<colgroup>
        <col width="249">
            <col width="100">
                <col width="90">
                    <col width="39">
                        <col width="115">
                            <col width="77">
                                <col width="92">
    </colgroup>
    <thead>
        <tr class="tr">
            <th class="tx-left th">
                <strong class="order-time">
                    ${order.addTime?number_to_date}
                </strong>
                <strong class="order-number">
                    支付号：${order.groupId}
                </strong>
            </th>
            <th class="th">
                --
            </th>
            <th class="th">
                --
            </th>
            <th class="th">
                ${order.goodsNumber}
            </th>
            <th class="th">
                <strong class="order-th-price">
                    ${order.payPrice?string("0.00")}
                </strong>
                <i class="order-price-tip">
                    (含运费：${order.totalFee?string("0.00")})
                </i>
            </th>
            <th class="th">
            <#if order.payLink?exists>等待付款<#else>已取消</#if>
                	
            </th>
            
            <th data-lbtr-id="689660" data-lbtr-ordernum="6475007534056958668" class="th">
            <#if order.payLink?exists>
                <a target="_blank" href="${order.payLink}"
                class="order-pay no">
                    付&emsp;款
                </a>
                <a class="order-handle cancel" groupId="${order.groupId}" href="javascript:void(0);">
                    取消订单
                </a>
                <#else>删除订单</#if>
            </th>
            
        </tr>
    </thead>
    <tbody>
    	<#list order.orderList as item>
        <tr class="order-title tr">
            <td colspan="7" class="tx-left tr-head td">
                <span class="goods-source">
                    韩国城-self
                </span>
                订单编号：${item.orderNum}
            </td>
        </tr>
        <#list item.goodsList as good>
        <tr class="tr">
            <td class="tx-left td">
                <a target="_blank" title="查看商品详情" href="${domain}/pro/item.html?tid=${good.docId}"
                class="order-img imgc">
                    <img alt="" src="${good.goodsImgUrl}"
                    class="imge">
                    <!--[if lt IE 8]>
                        <span class="iecp">
                        </span>
                    <![endif]-->
                </a>
                <a target="_blank" title="" href="http://detail.b5m.com/item.html?tid=2001829"
                class="order-name">
                    <span>
                        【韩国城-self】
                    </span>
                    ${good.goodsName}
                </a>
            </td>
            <td class="td">
                 ${good.goodsSpec}
            </td>
            <td title="115" class="td">
                 ${good.goodsPrice?string("0.00")}
            </td>
            <td class="td">
                x${good.goodsNum}
            </td>
            <td class="td">
                <strong class="order-price">
                    ${good.goodsPrice?string("0.00")}
                </strong>
            </td>
            <td rel="100--100" class="order-status td">
                --
            </td>
            <td data-lbtr-id="${good.orderId}" data-lbtr-ordernum="${good.orderNum}"
            class="order-operate td">
                --
            </td>
        </tr>
        </#list>
        </#list>
    </tbody>
</table>
</div>
    	</#list>
    	<#else>
    	<div class="order-list"></div>
    	<div class="ui-empty-data" style="display: block;"><span>暂无订单信息</span></div>
    	</#if>
	    <div class="ui-loading" style="display: none;">正在加载...</div>
    </div>
    
</div>
</@web>
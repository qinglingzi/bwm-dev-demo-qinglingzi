<#assign pro = result.val.productDto>
<#assign item = result.val.items[0]>
<#include "/fontend/order.ftl"/>
<@web 
	title="订单" 
	js=["/static/lib/order/buyNow.js"]
	css=["http://static-web.b5m.com/cart/css/cart_min.css?v=772015040810564297"]>
<div class="body">
    <div class="car-title-cont order-title-cont cfx">
        <h2 class="cart-title">
            <em class="icon-book"></em>填写并核对订单信息
            <span class="tel">(客服电话：400-085-0505)</span>
        </h2>
        <p class="car-tit-contr car-tcont3">
            <span class="porces1">
                <label class="ziticolo1">挑选购物车</label>
                <dfn>1</dfn>
            </span>
            <span class="porces2">
                <label class="ziticolo1">确认订单并提交</label>
                <dfn>2</dfn>
            </span>
        </p>
    </div>
    <div class="order-details-content">
        <!-- 地址列表 start -->
        <div class="order-informat order-address-list">
            <h3 class="order-inform-tit">确认收货地址</h3>
            <div class="order-loading" style="display: none;"><em class="icon-loading"></em></div>
            <ul class="addressList" style="">
            	<#assign addressList = addressMap.data >
            	<#list addressList as address>
				<li data-areaids="${address.provinceId},${address.cityId},${address.districtId}" data-areastr="${address.provinceName},${address.cityName},${address.districtName}" class="even <#if address.def>checked</#if>" id="${address.id}">
					<span class="order-address-tag"><em class="icon-tage-orage"></em>寄送至</span>
					<input type="radio" <#if address.def || address_index == 0>checked=""</#if> value="${address.id}" name="addressId" id="radio_${address.id}">
					<p><em>${address.userName}</em>&nbsp;&nbsp;<em>${address.mobile}</em> </p>
					<p class="order-address">${address.provinceName}&nbsp;&nbsp;${address.cityName}&nbsp;&nbsp;${address.districtName}&nbsp;&nbsp;${address.detailAddress}</p>
					<a class="order-address-def">默认地址</a>
					<a class="order-address-edit" data-id="484108">修改本地址</a>
					<a class="order-address-dele" data-id="484108">删除</a>
				</li>
				</#list>
            <li id="newAdderss"><input type="radio" value="" name="addressId" id="radio_newAdderss"><span>新增收货地址</span></li>
			</ul>
			
            <div class="add_newsadress" id="add_newsadress" style="display:none">
            <form method="post" action="#" name="addAdressForm" id="addAdressForm">
                <!-- <h5><a class="close_addadress">&times;</a><span id="close_addadress_text">添加新地址</span></h5> -->
                <div class="adress_banner">
                    <input type="hidden" name="addressid" id="addressid">
                    <div class="form_adress">
                        <b><a>*&nbsp;</a>收货人姓名：</b>
                        <p><input type="text" name="userName" id="userName" maxlength="18" class="inptext"><font></font></p>
                    </div>
                    <div class="form_adress">
                        <b><a>*&nbsp;</a>手机号码：</b>
                        <p><input type="text" name="mobile" id="mobile" maxlength="11" class="inptext"><font></font></p>
                    </div>
                    <div class="form_adress">
                        <b><a>*&nbsp;</a>所在地区：</b>
                        <p>
                            <select id="provinceId" name="provinceId" class="seladrass"><option value="210000" selected>辽宁省</option></select>
                            <select id="cityId" name="cityId" class="seladrass"><option value="210200" selected>大连市</option></select>
                            <select id="districtId" name="districtId" class="seladrass"><option value="210203" selected>西岗区</option></select>
                            
                            <input type="hidden" name="provinceName"  value="辽宁省"/>
                            <input type="hidden" name="cityName" value="大连市"/>
                            <input type="hidden" name="districtName" value="西岗区"/>
                        </p>
                    </div>
                    <div class="form_adress">
                        <b><a>*&nbsp;</a>街道地址：</b>
                        <p><textarea name="detailAddress" id="detailAddress" cols="" rows="" maxlength="120" placeholder="不需要重复填写省市区，必须大于5个字符，小于120个字符" class="taxtarea"></textarea><font></font></p>
                    </div>
                    <div class="form_adress" id="form_other">
                        <b>其他信息：</b>
                        <p>暂无<a class="add_other">[添加]</a></p>
                    </div>
                    <div class="form_adress" id="form_zipcode" style="display: none;">
                        <b>邮政编码：</b>
                        <p><input type="text" name="zipcode" id="zipcode" maxlength="6" class="inptext inpwidm"><font></font></p>
                    </div>
                    <div class="form_adress" id="form_qq" style="display: none;">
                        <b>QQ：</b>
                        <p><input type="text" name="qq" id="qq" maxlength="12" class="inptext"><font></font></p>
                    </div>
                    <div class="form_adress">
                        <b></b>
                        <p><label for="def">
                        <input type="checkbox" value="true" class="checkbox" name="def" id="def">设为默认地址</label></p>
                    </div>
                    <div class="formadress_btn form_adress">
                        <b></b>
                        <p><a class="btn confirm" id="saveAdderss" data-type="saveAdderss">保存收货人信息</a><a class="btn cancel">取&nbsp;消</a></p>
                    </div>
                </div>
            </form>
        </div>
            <a class="btn-other-adderss" style="display: none;">使用其他地址</a>
        </div>
        <!-- 商品列表 start -->
        <div class="order-informat goods-list">
            <span class="order-inform-tit cfx">商品清单：
                <a href="javascript:void(0)" class="edit-cart">返回修改购物车&gt;&gt;</a>
            </span>
            <div class="goods-box">
                <div class="order-thead">
                    <span class="name">商品名称</span>
                    <span class="postage">商品规格</span>
                    <span class="price">价格（元）</span>
                    <span class="quantity">数量</span>
                </div>
                <div class="order-table">
                                        <table data-shop="8575082387555895769"><!--商品组 start-->
                        <tbody><tr>
                            <th class="order-table-inform" colspan="4">
                                <b class="order-t">韩国城-self</b>
                            </th>
                        </tr>
                                                <!--商品列表 start-->
                        <tr>
                            <td class="name">
                                <span class="tabl-img"><img width="64px" height="64px" src="${pro.img}"></span>
                                <span class="tabl-ziti">
                                    <dfn>【韩国城-self】</dfn>${pro.title}
                                </span>
                            </td>
                            <td class="postage">${item.itemContent}</td>
                            <td class="price table-namb-red">${item.price}</td>
                            <td class="quantity">${buyNum}</td>
                        </tr>
                                                <!--商品列表 end-->
                        <tr><!-- 小结 Start-->
                            <td class="tb-foot" colspan="4">
                                <!-- 发票信息 start -->
                                                                <div class="order-invoice" id="8575082387555895769">
                                    <div class="oi-mian">
                                        <em class="icon-edit">编辑</em>
                                        		发票信息：<span title="不开发票" class="oi-msg">不开发票</span>
                                    </div>
                                    <ul class="oi-content">
                                        <a class="oi-close">×</a>
                                        <em class="icon-box-arr"></em>
                                        <li>发票抬头：</li>
                                        <li>
                                            <select class="invoice-select" name="invoice-select">
                                                <option selected="selected" value="不开发票">不开发票</option>
                                                <option value="个人">个人</option>
                                                <option value="单位">单位</option>
                                            </select>
                                            <input type="text" placeholder="请输入单位名称" value="" class="invoice-text" name="invoice-text" id="invoice-text">
                                        </li>
                                        <li class="text">如商品由第三方卖家销售，发票内容由其卖家决定，发票由卖家开具并寄出。</li>
                                        <li><a data-id="8575082387555895769" class="btn-orange-four">保存发票信息</a></li>
                                    </ul>
                                </div>
                                                                <!-- 发票信息 end -->
                                <div id="8575082387555895769_otr" class="order-table-r">
                                    <span class="mr10">合计：
                                        <strong>¥
                                            <font data-price="8575082387555895769">${item.price}</font>
                                        </strong>
                                    </span>
                                    <span>运费：<strong>¥
                                            <font id="C_001_economize_total">0</font>
                                        </strong>
                                    </span>
                                </div>
                            </td>
                        </tr>
                    </tbody></table>
                                        <!-- 商品组 end-->
                </div>
            </div>
        </div>

        <!--普通用户运费等于大于9元-->
        <div style="display: none;" class="order-summary cfx">
            <ul class="summary-amount">
                <li class="cfx">
                    <span class="am-title">商品合计：</span>
                    <span class="am-num">¥${item.price}</span>
                </li>
                <li class="cfx">
                    <span class="am-title">商品补贴：</span>
                    <span class="am-num am-gre">-¥0.00</span>
                </li>
                <li class="cfx">
                    <span class="am-title">商品总额：</span>
                    <span class="am-num">¥${item.price}</span>
                    <p>(返305帮钻)</p>
                </li>
                                <li class="postage-normal cfx">
                    <span class="am-title">运费总额：</span>
                    <span class="am-num">¥0.00</span>
                </li>
                    <!--    普通用户邮费 < 9.00 -->
                                    <li class="slt-vip cfx">
                    <em class="icon-checkbox"></em>
                    <p>成为
                        <a href="javascript:;" class="vip-tip">VIP会员<em></em>
                            <span class="vip-tip-box"></span>
                        </a>，再付<span>9.00元</span>，
                        并享受30天免邮服务</p>
                </li>
                                                    <li class="am-sum cfx">
                    <span class="am-title">订单总额：</span>
                    <span class="am-num">¥305.00</span>
                </li>
            </ul>
            <ul class="summary-info">
                <!-- 这里是收货人确认信息 前端输出 -->
                <li class="if-remark">
                    <span class="if-title">备注信息</span>
                    <a href="javascript:;" class="edit-remark">[修改]</a>
                    <p>无备注信息</p>
                    <div class="remark-box">
                        <input type="text" maxlength="45" placeholder="限45个字" class="ipt-remark">
                        <a href="javascript:;" class="save-remark">确定</a>
                        <a href="javascript:;" class="cancel-remark">取消</a>
                    </div>
                </li>
            </ul>
        </div>

        <div style="" class="sub-bg no-adderss">
            <div class="sub-box cfx">
                                <div class="sub-normal">
                    <strong>订单总额<span class="yen">¥</span><span>${order.payPrice}</span></strong>
                    <a href="javascript:void(0);" class="btn-sub subOrder">提交订单</a>
                    <span class="b2m-rule checked"><em class="icon-checkbox"></em>我已阅读<a target="_blank" href="http://www.b5m.com/bwmstatement.html?mps=____.0.0.0.0">《帮我买服务规则》</a>并接受其条款</span>
                </div>
                            </div>
                    </div>
    </div>

    <div id="addre_box">
        <div class="add_newsadress" id="add_newsadress">
            <form method="post" action="#" name="addAdressForm" id="addAdressForm">
                <!-- <h5><a class="close_addadress">&times;</a><span id="close_addadress_text">添加新地址</span></h5> -->
                <div class="adress_banner">
                    <input type="hidden" name="addressid" id="addressid" value="">
                    <div class="form_adress">
                        <b><a>*&nbsp;</a>收货人姓名：</b>
                        <p><input type="text" name="userName" id="userName" maxlength="18" class="inptext"><font></font></p>
                    </div>
                    <div class="form_adress">
                        <b><a>*&nbsp;</a>手机号码：</b>
                        <p><input type="text" name="mobile" id="mobile" maxlength="11" class="inptext"><font></font></p>
                    </div>
                    <div class="form_adress">
                        <b><a>*&nbsp;</a>所在地区：</b>
                        <p>
                            <select id="provinceId" name="provinceId" class="seladrass"><option value="900000">请选择省市</option><option value="210000">辽宁省</option><option value="420000">湖北省</option><option value="140000">山西省</option><option value="350000">福建省</option><option value="630000">青海省</option><option value="360000">江西省</option><option value="410000">河南省</option><option value="640000">宁夏回族自治区</option><option value="820000">澳门特别行政区</option><option value="330000">浙江省</option><option value="650000">新疆维吾尔自治区</option><option value="220000">吉林省</option><option value="340000">安徽省</option><option value="150000">内蒙古自治区</option><option value="710000">台湾</option><option value="460000">海南省</option><option value="810000">香港特别行政区</option><option value="530000">云南省</option><option value="520000">贵州省</option><option value="320000">江苏省</option><option value="540000">西藏自治区</option><option value="110000">北京</option><option value="510000">四川省</option><option value="230000">黑龙江省</option><option value="450000">广西壮族自治区</option><option value="610000">陕西省</option><option value="120000">天津</option><option value="440000">广东省</option><option value="500000">重庆</option><option value="130000">河北省</option><option value="430000">湖南省</option><option value="620000">甘肃省</option><option value="370000">山东省</option><option value="990000">海外</option><option value="310000">上海</option></select>
                            <select id="cityId" name="cityId" class="seladrass"><option value="900001">请选择城市</option></select>
                            <select id="districtId" name="districtId" class="seladrass"><option value="900002">请选择区/县</option></select>
                            <font></font>
                        </p>
                    </div>
                    <div class="form_adress">
                        <b><a>*&nbsp;</a>街道地址：</b>
                        <p><textarea name="detailAddress" id="detailAddress" cols="" rows="" maxlength="120" placeholder="不需要重复填写省市区，必须大于5个字符，小于120个字符" class="taxtarea"></textarea><font></font></p>
                    </div>
                    <div class="form_adress" id="form_other">
                        <b>其他信息：</b>
                        <p>暂无<a class="add_other">[添加]</a></p>
                    </div>
                    <div class="form_adress" id="form_zipcode">
                        <b>邮政编码：</b>
                        <p><input type="text" name="zipcode" id="zipcode" maxlength="6" class="inptext inpwidm"><font></font></p>
                    </div>
                    <div class="form_adress" id="form_qq">
                        <b>QQ：</b>
                        <p><input type="text" name="qq" id="qq" maxlength="12" class="inptext"><font></font></p>
                    </div>
                    <div class="form_adress">
                        <b></b>
                        <p><label for="def"><input type="checkbox" value="true" class="checkbox" name="def" id="def">设为默认地址</label></p>
                    </div>
                    <div class="formadress_btn form_adress">
                        <b></b>
                        <p><a class="btn confirm" data-type="saveAdderss">保存收货人信息</a><a class="btn cancel">取&nbsp;消</a></p>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="add_newsadress_bg" id="add_newsadress_bg"></div>
    
    <form method="post" action="${domain}/pay.htm"" id="payForm">
        <input type="hidden" value="" name="payNum" id="payNum">
    </form>
</div>

</@web>
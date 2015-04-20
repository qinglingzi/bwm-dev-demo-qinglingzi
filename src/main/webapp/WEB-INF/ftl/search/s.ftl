<#include "/fontend/search.ftl"/>
<@web 
	title="搜索" 
	css=[
	"http://static-web.b5m.com/korea/css/kor-list.css?v=192015040813145365","http://static-web.b5m.com/common/css/common.css?v=192015040813145365"]>
	
<div class="korea-bg">
    <div class="list-content">
    <#--
        <p class="path_bar">
            <a href="http://k.b5m.com">
                首页
            </a>
            &nbsp;&gt;&nbsp;
            <a href="http://k.b5m.com/list-321" class="">
                面部护肤
            </a>
            &nbsp;&gt;&nbsp;
            <a href="http://k.b5m.com/list-322" class="curr">
                T区护理
            </a>
        </p>
        <div class="list-show">
            <div class="list-show-lis">
                <div class="show-list">
                    <span class="l-p">
                        品牌：
                    </span>
                    <span class="r-l">
                        <a href="/list-322?brandId=7996">
                            Holika Holika
                        </a>
                    </span>
                </div>
            </div>
            <div class="list-show-tit">
                <a href="/list-322?sort=sales" class="curr">
                    销量
                    <em>
                    </em>
                </a>
                <a href="/list-322?sort=price" class="">
                    价格
                    <em>
                    </em>
                </a>
                <a href="/list-322?sort=new" class="">
                    新品
                    <em>
                    </em>
                </a>
            </div>
        </div>
        -->
        <div class="product-list">
            <ul>
            <#list result.val.pageView.records as pro>
                <li>
                    <a class="li-pic" href="${domain}/pro/item.htm?tid=${pro.id}" target="_blank">
                        <img alt="${pro.title}" src="${pro.img}">
                        <span title="闪电发货" class="send-type send-type-quick">
                        </span>
                    </a>
                    <a href="${domain}/pro/item.htm?tid=${pro.id}" class="li-text" target="_blank">${pro.title}</a>
                    <div class="price-text">
                        <p class="price-l">
                            <span class="price-red">
                                ¥<b>${pro.lowPrice}</b>
                            </span>
                            <span class="price-grey">
                                ¥&nbsp;${pro.highPrice}&gt;
                            </span>
                        </p>
                        <span class="price-r">
                            已售${pro.salesQuantity}件
                        </span>
                    </div>
                </li>
                </#list>
            </ul>
        </div>
        <div class="page">
            <div>
                <span class="cur">
                    1
                </span>
                <span class="pagenum">
                    共1页&nbsp;去第
                </span>
                <span class="page-input">
                    <input type="text" value="1" id="page-field" class="page-field">
                    <a target="_self" href="javascript:;" id="page-go" class="page-go">
                        GO
                    </a>
                </span>
                <span class="go">
                    页
                </span>
            </div>
        </div>
    </div>
</div>

</@web>
<?php die('Unauthorized access.'); ?>a:41:{s:2:"id";s:2:"54";s:4:"type";s:8:"document";s:11:"contentType";s:9:"text/html";s:9:"pagetitle";s:57:"Дизайн, оформление, фотоуслуги ";s:9:"longtitle";s:74:"Нужен дизайнер, оформитель или фотограф?";s:11:"description";s:33:"Обращайтесь к нам!";s:5:"alias";s:6:"events";s:15:"link_attributes";s:0:"";s:9:"published";s:1:"1";s:8:"pub_date";s:1:"0";s:10:"unpub_date";s:1:"0";s:6:"parent";s:1:"2";s:8:"isfolder";s:1:"0";s:9:"introtext";s:0:"";s:7:"content";s:0:"";s:8:"richtext";s:1:"1";s:8:"template";s:1:"6";s:9:"menuindex";s:1:"8";s:10:"searchable";s:1:"1";s:9:"cacheable";s:1:"1";s:9:"createdby";s:1:"1";s:9:"createdon";s:10:"1432107835";s:8:"editedby";s:1:"1";s:8:"editedon";s:10:"1432539405";s:7:"deleted";s:1:"0";s:9:"deletedon";s:1:"0";s:9:"deletedby";s:1:"0";s:11:"publishedon";s:10:"1432107835";s:11:"publishedby";s:1:"1";s:9:"menutitle";s:57:"Дизайн, оформление, фотоуслуги ";s:7:"donthit";s:1:"0";s:11:"haskeywords";s:1:"0";s:11:"hasmetatags";s:1:"0";s:10:"privateweb";s:1:"0";s:10:"privatemgr";s:1:"0";s:13:"content_dispo";s:1:"0";s:8:"hidemenu";s:1:"0";s:13:"alias_visible";s:1:"1";s:8:"img-firm";a:5:{i:0;s:8:"img-firm";i:1;s:26:"assets/images/ico_foto.png";i:2;s:0:"";i:3;s:0:"";i:4;s:5:"image";}s:8:"hero-img";a:5:{i:0;s:8:"hero-img";i:1;s:27:"assets/images/foto_back.jpg";i:2;s:0:"";i:3;s:0:"";i:4;s:5:"image";}s:17:"__MODxDocGroups__";s:0:"";}<!--__MODxCacheSpliter__--><!DOCTYPE html>
<html lang="ru">
<head>
  	<title>Дизайн, оформление, фотоуслуги  - Мир Услуг</title>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <base href="http://miruslug.kz/" />
    <link rel="stylesheet" href="assets/templates/serv/css/layout.css" type="text/css" media="screen" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			//setEvents();
		});
		
		function setEvents(){
			var InputClass = 'blured';
			var ClickedClass = 'clicked';
		
			$('.'+InputClass).unbind("focus").focus(function(){
				if($(this).attr('name') == 'date') return false;
				if ($(this).attr('defvalue') == undefined) 
				$(this).attr('defvalue',$(this).val());
				if (($(this).attr('blurvalue') == undefined)||($(this).attr('blurvalue') == $(this).attr('defvalue'))) 
				  $(this).val('').addClass(ClickedClass);
			}).blur(function(){
				if($(this).attr('name') == 'date') return false;
				var blurvalue = $(this).val();
				if (blurvalue == '') 
					$(this)
					  .removeAttr('blurvalue')
						.val($(this).attr('defvalue'))
						.removeClass(ClickedClass);
				else 
					$(this).attr('blurvalue',blurvalue);
			});
		}
	</script>
	
	<style>
		#hero-serv {
			background: url(assets/images/foto_back.jpg) center top no-repeat fixed;
			width: 100%;
			height: 420px;
			position: relative;
			float: left;
			text-align: center;
			background-size: 100%;
		}

		#hero-serv .title {padding-top: 140px; font-family: Raleway_ExtraBold;}
		#hero-serv .title span {padding-top: 140px;}
	</style>
</head>
<body>
  	<div id="toggleForm">
	<div class="toggleForm">
		<span class="closeForm">X</span>
		<div class="order-form">
			[!eForm? &formid=`OrderForm` &subject=`[+subject+]` &to=`miruslug782958@gmail.com` &tpl=`OrderForm` &report=`MinFormReport` &invalidClass=`invalidValue` &requiredClass=`requiredValue` !]
		</div>
	</div>
</div>
<div id="top">
        <div id="wrapper">
            <div class="logo">
				<a id="logo" href="[~1~]" title="Мир Услуг">Мир Услуг</a>
            </div>
			
			<script>
				$(document).ready(function(){
					$(".city a.selected").click(function(e){
						e.preventDefault();
						$(this).next(".items").show();
					});
					$("a.callme").click(function(e){
						e.preventDefault();
						$("#toggleForm").fadeIn(300);
					});
					$("span.closeForm").click(function(e){
						e.preventDefault();
						$("#toggleForm").fadeOut(300);
					});
				});
			</script>
			
			<div class="city">
				Выберите город:<br>
				<form method="POST">
				<a href="#" class="selected">[!city_info? &value=`city`!]</a>
				<div class="items">
					[!city_info? &value=`all`!]
				</div>
				</form>
			</div>
			
			<a href="javascript:">
				<div class="navi">
					<span>меню</span>
					<ul><li><a href="/about.html" title="О сервисе" >О сервисе</a></li>
<li><a href="/64.html" title="F.A.Q." >F.A.Q.</a></li>
<li><a href="/65.html" title="Как стать исполнителем?" >Как стать исполнителем?</a></li>
<li><a href="/services.html" title="Услуги" >Услуги</a></li>
<li class="last"><a href="/contact-us.html" title="Контакты" >Контакты</a></li>
</ul>
				</div>
			</a>

            <div class="call">
                [!city_info? &value=`phone`!]<br /><a class="callme" href="#">Заказать обратный звонок</a>
            </div>
        </div>
    </div>
	<div id="hero-serv">
		<div id="wrapper">
			<div style="padding-top:180px;" class="title">Нужен дизайнер, оформитель или фотограф?<br /><span>Обращайтесь к нам!</span></div>
		</div>
	</div>

<div id="orange">
		<div id="wrapper">
			<p>ДЛЯ ПОЛУЧЕНИЯ УСЛУГИ ЗАПОЛНИТЕ ЗАЯВКУ</p>
			<div class="order-form">
			[!eForm? &formid=`OrderForm` &subject=`[+subject+]` &to=`miruslug782958@gmail.com` &tpl=`OrderForm` &report=`MinFormReport` &invalidClass=`invalidValue` &requiredClass=`requiredValue`  !]
			</div>
		</div>
	</div>

	<div id="empty">
		<div id="wrapper">
			<div class="left">
				<div class="hotline">
					<img src="assets/templates/serv/images/hot-girl.png" />
					<p>ЗВОНИТЕ!<br />И Я ПОМОГУ ВАМ<br />ОФОРМИТЬ ЗАЯВКУ!<br /><span>[!city_info? &value=`phone`!]</span></p>
					<div class="or">ГОРЯЧАЯ ЛИНИЯ С  9-00 ДО 22-00</div>
				</div>
				
				<div class="howitworks">
					<div class="hiw1">
						<img src="assets/templates/serv/images/bottom_tel.png" /><br />Сделайте заявку на сайте или по телефону
					</div>
					
					<div class="arrow_right"></div>
					
					<div class="hiw2">
						<img src="assets/templates/serv/images/bottom_money.png" /><br />Специалист приедет и проведет расчет стоимости
					</div>
					
					<div class="arrow_bottom"></div>
					
					<div class="hiw4">
						<img src="assets/templates/serv/images/bottom_ok.png" /><br />Принимаете работу и производите оплату
					</div>
					
					<div class="arrow_left"></div>
					
					<div class="hiw3">
						<img src="assets/templates/serv/images/bottom_instrument.png" /><br />С Вашего согласия исполнитель приступит к работе
					</div>
				</div>
			</div>
			
			<div class="right">
				[!eForm? &formid=`indexzaya` &subject=`Новая заявка на сайте Мир Услуг` &to=`miruslug782958@gmail.com` &tpl=`indexzaya` &report=`indexzayaReport` &invalidClass=`invalidValue` &requiredClass=`requiredValue`!]
			</div>

			<div class="cat-2">
			<h1 class="maintitle">популярные услуги</h1>
			<div class="firm">
  	<a href="[~47~]" title="Ремонт компьютеров и ноутбуков ">
		<div class="imgfirm"><img src="assets/images/ico_comp.png" /></div>
	  	<p>Ремонт компьютеров и ноутбуков </p>
	</a>
</div><div class="firm">
  	<a href="[~48~]" title="Установка и ремонт бытовой техники ">
		<div class="imgfirm"><img src="assets/images/ico_wash.png" /></div>
	  	<p>Установка и ремонт бытовой техники </p>
	</a>
</div><div class="firm">
  	<a href="[~49~]" title="Мастера на час: сантехник, электрик, плотник ">
		<div class="imgfirm"><img src="assets/images/ico_otvertka.png" /></div>
	  	<p>Мастера на час: сантехник, электрик, плотник </p>
	</a>
</div><div class="firm">
  	<a href="[~50~]" title="Ремонт и отделка помещений ">
		<div class="imgfirm"><img src="assets/images/ico_remont.png" /></div>
	  	<p>Ремонт и отделка помещений </p>
	</a>
</div><div class="firm">
  	<a href="[~51~]" title="Грузоперевозки и грузчики ">
		<div class="imgfirm"><img src="assets/images/ico_gruz.png" /></div>
	  	<p>Грузоперевозки и грузчики </p>
	</a>
</div><div class="firm">
  	<a href="[~52~]" title="Услуги курьеров и доставка ">
		<div class="imgfirm"><img src="assets/images/ico_box.png" /></div>
	  	<p>Услуги курьеров и доставка </p>
	</a>
</div><div class="firm">
  	<a href="[~53~]" title="Уборка  помещений ">
		<div class="imgfirm"><img src="assets/images/ico_clean.png" /></div>
	  	<p>Уборка  помещений </p>
	</a>
</div><div class="firm">
  	<a href="[~54~]" title="Дизайн, оформление, фотоуслуги ">
		<div class="imgfirm"><img src="assets/images/ico_foto.png" /></div>
	  	<p>Дизайн, оформление, фотоуслуги </p>
	</a>
</div><div class="firm">
  	<a href="[~55~]" title="Исполнитель поручений ">
		<div class="imgfirm"><img src="assets/images/ico_man.png" /></div>
	  	<p>Исполнитель поручений </p>
	</a>
</div><div class="firm">
  	<a href="[~56~]" title="Выездной  автосервис ">
		<div class="imgfirm"><img src="assets/images/ico_auto.png" /></div>
	  	<p>Выездной  автосервис </p>
	</a>
</div><div class="firm">
  	<a href="[~57~]" title="Салон красоты  на выезд ">
		<div class="imgfirm"><img src="assets/images/ico_fen.png" /></div>
	  	<p>Салон красоты  на выезд </p>
	</a>
</div><div class="firm">
  	<a href="[~58~]" title="Жена на час (помощь по хозяйству) ">
		<div class="imgfirm"><img src="assets/images/ico_utug.png" /></div>
	  	<p>Жена на час (помощь по хозяйству) </p>
	</a>
</div>
			<div class="slogan">И ЕЩЕ БОЛЕЕ 200 ВИДОВ УСЛУГ<br /><span>ДЛЯ ДОМА, ОФИСА И АВТОМОБИЛИСТОВ!</span></div>

			</div>
		</div>
	</div>
	<div id="footer">
		<div id="wrapper">
			<div class="navbottom">
				<h3>меню</h3>
				<ul>
    <a href="/about.html" title="О сервисе"><li class="category first">О сервисе</li></a>
<a href="/64.html" title="F.A.Q."><li class="category last">F.A.Q.</li></a>

  </ul>
				<ul>
    <a href="/65.html" title="Как стать исполнителем?"><li class="category first">Как стать исполнителем?</li></a>
<a href="/services.html" title="Услуги"><li class="category ">Услуги</li></a>
<a href="/contact-us.html" title="Контакты"><li class="category last">Контакты</li></a>

  </ul>
			</div>
			
			<div class="bottomlogo"><a id="logo" href="[~67~]" title="Мир Услуг">Мир Услуг</a></div>
			<div class="copy">© 2015 Мир услуг</div>
			
			<div class="footercont">ГОРЯЧАЯ ЛИНИЯ С 9:00 ДО 22:00<br /><span>[!city_info? &value=`phone`!]</span></div>
			
			<div class="social">
				мы в соцсетях<br />
				<script type="text/javascript" src="//yastatic.net/share/share.js" charset="utf-8"></script><div class="yashare-auto-init" data-yashareL10n="ru" data-yashareType="small" data-yashareQuickServices="vkontakte,facebook,twitter,odnoklassniki,moimir" data-yashareTheme="counter"></div>
			</div>
			
			<div id="istyle">
				<a href="http://istyle.kz" target="blank"><img src="assets/templates/serv/images/istyle.png" /></a><span class="txt">Сделано в студии <a href="http://istyle.kz" target="blank"> iStyle</a><br /><a href="http://istyle.kz/portfolio/eshop/kozy.html" target="blank">Подробнее о проекте</a></span>
			</div>
			
		</div>
	</div>
</body>
</html>
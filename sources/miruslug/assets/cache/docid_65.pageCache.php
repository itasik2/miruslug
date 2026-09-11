<?php die('Unauthorized access.'); ?>a:39:{s:2:"id";s:2:"65";s:4:"type";s:8:"document";s:11:"contentType";s:9:"text/html";s:9:"pagetitle";s:43:"Как стать исполнителем?";s:9:"longtitle";s:35:"Ищете работу мечты?";s:11:"description";s:44:"Работайте вместе с нами!";s:5:"alias";s:0:"";s:15:"link_attributes";s:0:"";s:9:"published";s:1:"1";s:8:"pub_date";s:1:"0";s:10:"unpub_date";s:1:"0";s:6:"parent";s:1:"0";s:8:"isfolder";s:1:"0";s:9:"introtext";s:0:"";s:7:"content";s:0:"";s:8:"richtext";s:1:"1";s:8:"template";s:1:"9";s:9:"menuindex";s:1:"5";s:10:"searchable";s:1:"1";s:9:"cacheable";s:1:"1";s:9:"createdby";s:1:"1";s:9:"createdon";s:10:"1432201395";s:8:"editedby";s:1:"1";s:8:"editedon";s:10:"1432204641";s:7:"deleted";s:1:"0";s:9:"deletedon";s:1:"0";s:9:"deletedby";s:1:"0";s:11:"publishedon";s:10:"1432201395";s:11:"publishedby";s:1:"1";s:9:"menutitle";s:43:"Как стать исполнителем?";s:7:"donthit";s:1:"0";s:11:"haskeywords";s:1:"0";s:11:"hasmetatags";s:1:"0";s:10:"privateweb";s:1:"0";s:10:"privatemgr";s:1:"0";s:13:"content_dispo";s:1:"0";s:8:"hidemenu";s:1:"0";s:13:"alias_visible";s:1:"1";s:17:"__MODxDocGroups__";s:0:"";}<!--__MODxCacheSpliter__--><!DOCTYPE html>
<html lang="ru">
	<head>
  	<title>Как стать исполнителем? - Мир Услуг</title>
  	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <base href="http://miruslug.kz/" />
    <link rel="stylesheet" href="assets/templates/serv/css/layout.css" type="text/css" media="screen" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			setEvents();
		});
		
		function setEvents(){
			var InputClass = 'blured';
			var ClickedClass = 'clicked';
		
			$('.'+InputClass).unbind("focus").focus(function(){
				if ($(this).attr('defvalue') == undefined) 
				$(this).attr('defvalue',$(this).val());
				if (($(this).attr('blurvalue') == undefined)||($(this).attr('blurvalue') == $(this).attr('defvalue'))) 
				  $(this).val('').addClass(ClickedClass);
			}).blur(function(){
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
<li class="active"><a href="/65.html" title="Как стать исполнителем?" >Как стать исполнителем?</a></li>
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
	
	<div id="hero-in">
		<div id="wrapper">
			<div style="padding-top:180px;" class="title">Ищете работу мечты?<br /><span>Работайте вместе с нами!</span></div>
		</div>
	</div>

			
	<div id="orange">
		<div id="wrapper">
			<div class="vac">
				<h1>ПОПУЛЯРНЫЕ УСЛУГИ</h1>
				<p>- ВОЗМОЖНОСТЬ ЗАРАБАТЫВАТЬ И ЧУВСТВОВАТЬ СЕБЯ СВОБОДНЫМ</p>
				<p>- ВЫ САМИ ВЫБИРАЕТЕ СЕБЕ ПРОФЕССИЮ, В РАМКАХ КОТОРОЙ ВАМ БУДУТ ПОСТУПАТЬ ЗАЯВКИ.</p>
				<p>- ЗА ИХ ВЫПОЛНЕНИЕ ВЫ БУДЕТЕ ПОЛУЧАТЬ ДЕНЕЖНОЕ ВОЗНАГРАЖДЕНИЕ.</p>
			</div>
			
			<div class="vacprem">
				<img src="assets/templates/serv/images/ico_1.png" />
				<p><span>СВОБОДНЫЙ ГРАФИК</span><br />РАБОТАЙТЕ ТОГДА, КОГДА ВАМ ЭТО УДОБНО</p>
			</div>
			
			<div class="vacprem">
				<img src="assets/templates/serv/images/ico_2.png" />
				<p><span>ЗАРАБАТЫВАЙТЕ ДОСТОЙНО</span><br />СКОЛЬКО, ЗАВИСИТ ОТ ВАС (ПРОЦЕНТ С ЗАКАЗА + БОНУСЫ)</p>
			</div>
			
			<div class="vacprem">
				<img src="assets/templates/serv/images/ico_3.png" />
				<p><span>ЗАНИМАЙТЕСЬ ЛЮБИМЫМ ДЕЛОМ</span><br />ЗАКАЗЫ ПО ВАШЕМУ ПРОФИЛЮ</p>
			</div>
			
			<div class="vacprem">
				<img src="assets/templates/serv/images/ico_4.png" />
				<p><span>SMS-УВЕДОМЛЕНИЯ</span><br />ВЫ БУДЕТЕ ОПЕРАТИВНО ПРОИНФОРМИРОВАНЫ О НОВЫХ ЗАЯВКАХ</p>
			</div>
			
			<div class="vacprem">
				<img src="assets/templates/serv/images/ico_5.png" />
				<p><span>ОПЛАТА СРАЗУ</span><br />ВЫ ПОЛУЧАЕТЕ ДЕНЬГИ СРАЗУ ПОСЛЕ ВЫПОЛНЕНИЯ ЗАКАЗА</p>
			</div>
			
			<div class="vacprem">
				<img src="assets/templates/serv/images/ico_6.png" />
				<p><span>РАБОТА РЯДОМ</span><br />БЕРИТЕ ЗАКАЗЫ, КОТОРЫЕ РЯДОМ С ВАМИ</p>
			</div>
		</div>
	</div>
			
			
	
	<div id="empty">
		<div id="wrapper">
			<h2>нам нужны</h2>
			<ul class="orange-dot">
				<li>МАСТЕР ПО РЕМОНТУ ПК</li>
				<li>САНТЕХНИК</li>
				<li>ЭЛЕКТРИК</li>
				<li>ПЛОТНИК</li>
			</ul>
			
			<ul class="orange-dot">
				<li>МАСТЕР НА ЧАС</li>
				<li>ОТДЕЛОЧНИК</li>
				<li>УСТАНОВЩИК ДВЕРЕЙ</li>
				<li>КУРЬЕР</li>
			</ul>
			
			<ul class="orange-dot">
				<li>ДИЗАЙНЕР</li>
				<li>ФОТОГРАФ</li>
				<li>РАЗНОРАБОЧИЙ</li>
				<li>ВОДИТЕЛЬ «ГАЗЕЛИ»</li>
			</ul>
			
			<ul class="orange-dot">
				<li>ГРУЗЧИК</li>
				<li>УБОРЩИК</li>
				<li>УСТАНОВЩИК СПУТНИКОВЫХ ТАРЕЛОК</li>
				<li>МАСТЕР ПО РЕМОНТУ БЫТ. ТЕХНИКИ</li>
			</ul>
		</div>
	</div>		
	
	<div id="orange">
		<div id="wrapper">
			<p>ХОТИТЕ РАБОТАТЬ С НАМИ?</p>
			<div class="order-form">
				<a href="http://miruslug.kz//index.php?id=65#form1"><div class="button">Стать исполнителем</div></a>
			</div>
		</div>
	</div>
		
	<div id="black">
		<div id="wrapper">
			<div class="treb">
				<p><span>ТРЕБОВАНИЯ:</span><br />наличие собственного инструмента, коммуникабельность, опыт работы (можно неофициальный), отсутствие вредных привычек.</p>
			</div>
			
			<div class="treb">
				<p><span>ОБЯЗАННОСТИ:</span><br />работа на территории заказчика(на выезде), качественное исполнение должностных обязанностей, согласование с клиентом стоимости работ.</p>
			</div>
			
			<div class="treb">
				<p><span>ЗАРАБОТНАЯ ПЛАТА:</span><br />ежедневная, сдельная (процент от заявки + оплата выезда), высокая. Премии по результатам работы.</p>
			</div>
		</div>
	</div>
			
	<div id="red">
		<div id="wrapper">
			<h1>как стать исполнителем</h1>
			<div class="treb2">
				<img src="assets/templates/serv/images/howto_1.png" />
				<p>ЗАПОЛНИТЕ АНКЕТУ ИСПОЛНИТЕЛЯ (НАХОДИТСЯ НИЖЕ)</p>
			</div>
			
			<div class="treb2">
				<img src="assets/templates/serv/images/howto_2.png" />
				<p>МЫ СВЯЖЕМСЯ С ВАМИ В ТЕЧЕНИИ 3-Х ДНЕЙ И  ПРОВЕДЕМ НЕБОЛЬШОЕ СОБЕСЕДОВАНИЕ ПО ТЕЛЕФОНУ</p>
			</div>
			
			<div class="treb2">
				<img src="assets/templates/serv/images/howto_3.png" />
				<p>ВНИМАТЕЛЬНО ОЗНАКОМЬТЕСЬ С ПРИСЛАННЫМИ ИНСТРУКЦИЯМИ И ПРАЙС-ЛИСТОМ</p>
			</div>
			
			<div class="treb-bottom">И МОЖЕТЕ ПРИСТУПАТЬ К РАБОТЕ!</div>
			
		</div>
	</div>
	
	<a name="form1"></a>
	<div id="empty">
		<div id="wrapper">
			<a name="form1">
			<h1>анкета исполнителя</h1>
			<div>[!eForm? &formid=`anketa` &tpl=`anketaForm` &report=`vacancyReportTpl` &thankyou=`` &vericode=`0` &to=`ibragim@nur.kz` &subject=`Анкета исполнителя`!]</div>
			</a>
		</div>
	</div>
	
	<div id="black">
		<div id="wrapper">
			<h1>как выполнять заказы?</h1>
			<div class="num">
				<div class="numor">1</div>
				<div class="txt"><span>ПРИМИТЕ ЗАЯВКУ</span><br />(ПО ТЕЛЕФОНУ, СМС ИЛИ ИНТЕРНЕТ)</div>
			</div>
			
			<div class="num">
				<div class="numor">2</div>
				<div class="txt"><span>ВЫПОЛНИТЕ ЗАКАЗ</span><br />(СОГЛАСНО НАШИМ ФИРМЕННЫМ СТАНДАРТАМ)</div>
			</div>
			
			<div class="num">
				<div class="numor">3</div>
				<div class="txt"><span>ПОЛУЧИТЕ ОПЛАТУ ОТ КЛИЕНТА</span><br />(ОПОВЕСТИТЕ КОМПАНИЮ О ВЫПОЛНЕНИИ ЗАКАЗА)</div>
			</div>
			
			<div class="num">
				<div class="numor">4</div>
				<div class="txt"><span>ОПЛАТИТЕ КОМИССИЮ КОМПАНИИ</span><br />(НАЛИЧНЫМИ, ЧЕРЕЗ ТЕРМИНАЛЫ ИЛИ НА КАРТУ)</div>
			</div>
			
		</div>
	</div>
	
	<div id="orange">
		<div id="wrapper">
			<p>ЧТОБЫ УЗНАТЬ О КОМПАНИИ БОЛЬШЕ<br />ПЕРЕЙДИТЕ НА НАШ <a href="/">ГЛАВНЫЙ САЙТ</a></p>
			<div class="order-form">
				<h3>ИЛИ ЗАПОЛНИТЕ ФОРМУ И МЫ ОТВЕТИМ НА ВСЕ ВАШИ ВОПРОСЫ</h3>
			[!eForm? &formid=`OrderForm` &subject=`Новая заявка` &to=`miruslug782958@gmail.com` &attachmentField=`file` &tpl=`OrderForm` &report=`MinFormReport` &invalidClass=`invalidValue` &requiredClass=`requiredValue`!]
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
    <a href="/65.html" title="Как стать исполнителем?"><li class="category first active">Как стать исполнителем?</li></a>
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
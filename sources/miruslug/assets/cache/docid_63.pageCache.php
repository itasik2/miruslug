<?php die('Unauthorized access.'); ?>a:40:{s:2:"id";s:2:"63";s:4:"type";s:8:"document";s:11:"contentType";s:9:"text/html";s:9:"pagetitle";s:17:"О сервисе";s:9:"longtitle";s:17:"О сервисе";s:11:"description";s:0:"";s:5:"alias";s:5:"about";s:15:"link_attributes";s:0:"";s:9:"published";s:1:"1";s:8:"pub_date";s:1:"0";s:10:"unpub_date";s:1:"0";s:6:"parent";s:1:"0";s:8:"isfolder";s:1:"0";s:9:"introtext";s:0:"";s:7:"content";s:3024:"<h1>РЫБАТЕКСТ, ВСТРЕЧАЙТЕ!</h1>
<h2>РЫБАТЕКСТ, ВСТРЕЧАЙТЕ!</h2>
<h3>РЫБАТЕКСТ, ВСТРЕЧАЙТЕ!</h3>
<p>Значимость этих проблем настолько очевидна, что рамки и место обучения кадров играет важную роль в формировании существенных финансовых и административных условий. Равным образом начало повседневной работы по формированию позиции в значительной степени обуславливает создание новых предложений. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности обеспечивает широкому кругу (специалистов) участие в формировании соответствующий условий активизации.</p>
<div><strong>Значимость этих проблем настолько очевидна, что рамки и место обучения кадров играет важную роль в формировании существенных финансовых и административных условий. Равным образом начало повседневной работы по формированию позиции в значительной степени обуславливает создание новых предложений. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности обеспечивает широкому кругу (специалистов) участие в формировании соответствующий условий активизации.</strong></div>
<blockquote>
<p>Значимость этих проблем настолько очевидна, что рамки и место обучения кадров играет важную роль в формировании существенных финансовых и административных условий. Равным образом начало повседневной работы по формированию позиции в значительной степени обуславливает создание новых предложений. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности обеспечивает широкому кругу (специалистов) участие в формировании соответствующий условий активизации.</p>
</blockquote>";s:8:"richtext";s:1:"1";s:8:"template";s:1:"7";s:9:"menuindex";s:1:"2";s:10:"searchable";s:1:"1";s:9:"cacheable";s:1:"1";s:9:"createdby";s:1:"1";s:9:"createdon";s:10:"1432186265";s:8:"editedby";s:1:"1";s:8:"editedon";s:10:"1432187557";s:7:"deleted";s:1:"0";s:9:"deletedon";s:1:"0";s:9:"deletedby";s:1:"0";s:11:"publishedon";s:10:"1432186265";s:11:"publishedby";s:1:"1";s:9:"menutitle";s:17:"О сервисе";s:7:"donthit";s:1:"0";s:11:"haskeywords";s:1:"0";s:11:"hasmetatags";s:1:"0";s:10:"privateweb";s:1:"0";s:10:"privatemgr";s:1:"0";s:13:"content_dispo";s:1:"0";s:8:"hidemenu";s:1:"0";s:13:"alias_visible";s:1:"1";s:3:"faq";a:5:{i:0;s:3:"faq";i:1;s:0:"";i:2;s:0:"";i:3;s:0:"";i:4;s:9:"custom_tv";}s:17:"__MODxDocGroups__";s:0:"";}<!--__MODxCacheSpliter__--><!DOCTYPE html>
<html lang="ru">
	<head>
  	<title>О сервисе - Мир Услуг</title>
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
					<ul><li class="active"><a href="/about.html" title="О сервисе" >О сервисе</a></li>
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
	
	<div id="hero-in">
		<div id="wrapper">
			<div class="title">СЕРВИС ДЛЯ ЗАКАЗА ЛЮБЫХ УСЛУГ<br /><span>ДЛЯ ДОМА, ОФИСА И АВТОМОБИЛИСТОВ</span></div>
			<div class="appstore"><img src="assets/templates/serv/images/appstore.png" /></div>
			<div class="googleplay"><img src="assets/templates/serv/images/googleplay.png" /></div>
		</div>
	</div>
	
	<div id="orange">
		<div id="wrapper">
			<p>ДЛЯ ПОЛУЧЕНИЯ УСЛУГИ ЗАПОЛНИТЕ ЗАЯВКУ</p>
			<div class="order-form">
			[!eForm? &formid=`OrderForm` &subject=`Новаяя заявка` &to=`miruslug782958@gmail.com` &tpl=`OrderForm` &report=`MinFormReport` &invalidClass=`invalidValue` &requiredClass=`requiredValue` !]
			</div>
		</div>
	</div>
			
	<div id="empty">
		<div id="wrapper">
			<h1>РЫБАТЕКСТ, ВСТРЕЧАЙТЕ!</h1>
<h2>РЫБАТЕКСТ, ВСТРЕЧАЙТЕ!</h2>
<h3>РЫБАТЕКСТ, ВСТРЕЧАЙТЕ!</h3>
<p>Значимость этих проблем настолько очевидна, что рамки и место обучения кадров играет важную роль в формировании существенных финансовых и административных условий. Равным образом начало повседневной работы по формированию позиции в значительной степени обуславливает создание новых предложений. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности обеспечивает широкому кругу (специалистов) участие в формировании соответствующий условий активизации.</p>
<div><strong>Значимость этих проблем настолько очевидна, что рамки и место обучения кадров играет важную роль в формировании существенных финансовых и административных условий. Равным образом начало повседневной работы по формированию позиции в значительной степени обуславливает создание новых предложений. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности обеспечивает широкому кругу (специалистов) участие в формировании соответствующий условий активизации.</strong></div>
<blockquote>
<p>Значимость этих проблем настолько очевидна, что рамки и место обучения кадров играет важную роль в формировании существенных финансовых и административных условий. Равным образом начало повседневной работы по формированию позиции в значительной степени обуславливает создание новых предложений. Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности обеспечивает широкому кругу (специалистов) участие в формировании соответствующий условий активизации.</p>
</blockquote>
		</div>
	</div>
		
	<div id="footer">
		<div id="wrapper">
			<div class="navbottom">
				<h3>меню</h3>
				<ul>
    <a href="/about.html" title="О сервисе"><li class="category first active">О сервисе</li></a>
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
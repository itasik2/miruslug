<?php die('Unauthorized access.'); ?>a:39:{s:2:"id";s:2:"67";s:4:"type";s:8:"document";s:11:"contentType";s:9:"text/html";s:9:"pagetitle";s:14:"Главная";s:9:"longtitle";s:0:"";s:11:"description";s:0:"";s:5:"alias";s:0:"";s:15:"link_attributes";s:0:"";s:9:"published";s:1:"1";s:8:"pub_date";s:1:"0";s:10:"unpub_date";s:1:"0";s:6:"parent";s:1:"0";s:8:"isfolder";s:1:"0";s:9:"introtext";s:0:"";s:7:"content";s:0:"";s:8:"richtext";s:1:"1";s:8:"template";s:2:"12";s:9:"menuindex";s:2:"17";s:10:"searchable";s:1:"1";s:9:"cacheable";s:1:"1";s:9:"createdby";s:1:"1";s:9:"createdon";s:10:"1432639739";s:8:"editedby";s:1:"1";s:8:"editedon";s:10:"1432639817";s:7:"deleted";s:1:"0";s:9:"deletedon";s:1:"0";s:9:"deletedby";s:1:"0";s:11:"publishedon";s:10:"1432639739";s:11:"publishedby";s:1:"1";s:9:"menutitle";s:0:"";s:7:"donthit";s:1:"0";s:11:"haskeywords";s:1:"0";s:11:"hasmetatags";s:1:"0";s:10:"privateweb";s:1:"0";s:10:"privatemgr";s:1:"0";s:13:"content_dispo";s:1:"0";s:8:"hidemenu";s:1:"1";s:13:"alias_visible";s:1:"1";s:17:"__MODxDocGroups__";s:0:"";}<!--__MODxCacheSpliter__--><!DOCTYPE html>
<html lang="ru" style="width:100%;">
	<head>
  	<title>Главная - Мир Услуг</title>
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
	<body style="width: 100%; float: none;background: url(assets/templates/serv/images/glava.jpg) no-repeat;background-size: cover;">
		<div id="firstpage_image"></div>
		<table valign="center" align="center" style="width:100%; height:100%;text-align:center">
			<tr>
				<td>
					<h2 class="logo_home">Мир Услуг</h2>
					<div class="firstpage">
					<form method="POST" action="[~1~]">
						<select name="city" onchange="$(this).parent().submit()"><option>Выберите город</option><option value="Усть-Каменогорск">Усть-Каменогорск</option><option value="Павлодар">Павлодар</option></select>
					</form>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
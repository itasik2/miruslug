<?php
$settings['display'] = 'vertical';
$settings['fields'] = array(
    'question' => array(
        'caption' => 'Вопрос',
        'type' => 'text'
    ),
    'answer' => array(
        'caption' => 'Ответ',
        'type' => 'richtext'
    )
);
$settings['templates'] = array(
    'outerTpl' => '[+wrapper+]',
    'rowTpl' => '
    <div class="qparent">
		<div class="question"><a href="javascript:"><span>+</span>((question))</a></div>
		<div class="answer" style="display:none">((answer))</div>
	</div>
	'
);

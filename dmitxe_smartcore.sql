-- phpMyAdmin SQL Dump
-- version 3.3.10.4
-- http://www.phpmyadmin.net
--
-- Хост: localhost:3306
-- Время создания: Июл 09 2015 г., 04:31
-- Версия сервера: 5.6.13
-- Версия PHP: 5.6.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `dmitxe_blog`
--

-- --------------------------------------------------------

--
-- Структура таблицы `blog_articles`
--

DROP TABLE IF EXISTS `blog_articles`;
CREATE TABLE IF NOT EXISTS `blog_articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `is_commentable` tinyint(1) NOT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `annotation` longtext COLLATE utf8_unicode_ci,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_CB80154F989D9B62` (`slug`),
  KEY `IDX_CB80154FF675F31B` (`author_id`),
  KEY `IDX_CB80154F12469DE2` (`category_id`),
  KEY `IDX_CB80154F8B8E8428` (`created_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=26 ;

--
-- Дамп данных таблицы `blog_articles`
--

INSERT INTO `blog_articles` (`id`, `author_id`, `category_id`, `image_id`, `is_commentable`, `is_enabled`, `title`, `slug`, `annotation`, `text`, `keywords`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 1, 1, 'Хлебные крошки в Yii', 'breadcrumbs_yii', 'Хлебные крошки (Breadcrumbs) - это строка навигации до текущей страницы, сделанная из ссылок на родительские элементы. В Yii есть удобное средство для работы с хлебными крошками - виджет zii CBreadcrumbs http://www.yiiframework.com/doc/api/1.1/CBreadcrumbs<br />\n	Хочу описать, как подключить CBreadcrumbs.', '<p></p>\n<hr id="readmore" />\n<p>\n	В контроллере определяем общедоступную переменную-массив хлебных крошек. public $breadcrumbs=array();<br />\n	В layout view вставляем</p>\n<div class="highlight">\n	<pre class="brush:php">\n	&lt;?php if(isset($this-&gt;breadcrumbs)):?&gt;\n		&lt;?php $this-&gt;widget(&#39;zii.widgets.CBreadcrumbs&#39;, array(\n			&#39;links&#39;=&gt;$this-&gt;breadcrumbs,\n                        &#39;homeLink&#39;=&gt;CHtml::link(&#39;Главная&#39;,&#39;/&#39; ),\n		)); ?&gt;&lt;!-- breadcrumbs --&gt;\n	&lt;?php endif?&gt;</pre>\n</div>\n<p>\n	Здесь links &ndash; массив ссылок навигации, мы берём его из текущего контроллера.<br />\n	homeLink &ndash; ссылка на главную страницу.<br />\n	Теперь во view не забываем определить массив:</p>\n<div class="highlight">\n	<pre class="brush:php">\n$this-&gt;breadcrumbs=array(\n	&#39;Записи&#39;=&gt;array(&#39;index&#39;),\n	$model-&gt;title,\n);</pre>\n</div>\n<p>\n	Вот и всё.</p>\n', 'Yii, хлебные крошки', 'Как создать хлебные крошки в Yii', '2011-11-26 10:06:15', NULL),
(2, 1, 1, NULL, 1, 1, 'Как подключить Ckeditor к фреймворку Yii', 'how_to_connect_ckeditor_to_framework_yii', 'Часто возникает необходимость использовать визуальный редактор на сайте. Есть несколько весьма популярных WYSIWYNG-редакторов. Один из них - Ckeditor. Сегодня я расскажу, как подключить Ckeditor к Yii.', '<p></p>\n<hr id="readmore" />\n<p>\n	Шаг первый: скачиваем сам редактор с официального сайта: <a href="http://ckeditor.com/download" target="_blank">http://ckeditor.com/download</a><br />\n	Распаковываем архив в корень сайта.<br />\n	Шаг второй: скачиваем расширение Yii ckeditor-integration <a href="http://www.yiiframework.com/extension/ckeditor-integration/">отсюда</a>.<br />\n	Распаковываем в папку protected/extensions.<br />\n	Шаг третий: подключаем к форме наш редактор:</p>\n<div class="highlight">\n	<pre class="brush: php">\n&lt;?php\n$this-&gt;widget(&#39;ext.ckeditor.CKEditorWidget&#39;,array(\n  &quot;model&quot;=&gt;$model,                 # Модель данных\n  &quot;attribute&quot;=&gt;&#39;content&#39;,          # Аттрибут в модели\n  &quot;defaultValue&quot;=&gt;$model-&gt;content, #Значение по умолчанию\n\n  &quot;config&quot; =&gt; array(\n      &quot;height&quot;=&gt;&quot;400px&quot;,\n      &quot;width&quot;=&gt;&quot;100%&quot;,\n      &quot;toolbar&quot;=&gt;&quot;Full&quot;, #панель инструментов\n      &quot;defaultLanguage&quot;=&gt;&quot;ru&quot;, # Язык по умолчанию\n      ),\n   &quot;ckEditor&quot;=&gt;Yii::app()-&gt;basePath.&quot;/../ckeditor/ckeditor.php&quot;,\n                                  # Путь к ckeditor.php\n  &quot;ckBasePath&quot;=&gt;Yii::app()-&gt;baseUrl.&quot;/ckeditor/&quot;,\n                                  # адрес к редактору\n  ) ); ?&gt;</pre>\n</div>\n<div class="code">\n	Все параметры конфига редактора смотрим <a href="http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html">здесь</a></div>\n', 'Yii, Ckeditor, подключение', 'В статье рассказывается о том, как быстро и правильно подключить Ckeditor к Yii', '2011-11-23 13:20:50', NULL),
(3, 1, 1, NULL, 1, 1, 'Форматирование даты и времени в Yii', 'formatting_of_date_and_time_in_yii', 'Передо мной встала такая задача: как в Yii вывести дату, отформатированную в родном, русском формате. Оказывается, очень просто. Во-первых, надо установить русский язык в конфигурационном файле приложения, и, во-вторых, воспользоваться методом компонента&nbsp; приложения CDateFormatter-&gt;format().', '<p></p>\n<hr id="readmore" />\n<p>\n	Итак, приступим. В конфигурационном файле пропишем две строчки, которые установят русификацию для сайта:</p>\n<div class="highlight">\n	<pre class="brush: php">\n   &#39;sourceLanguage&#39; =&gt; &#39;en&#39;,\n    &#39;language&#39; =&gt; &#39;ru&#39;,</pre>\n</div>\n<p>\n	Здесь sourceLanguage &ndash; язык, на котором написан сам сайт. У меня он, естественно, английский. Ну а текущий язык &ndash; language &ndash; русский.<br />\n	Теперь в том месте, где хотим вывести отформатированную дату, добавим такой код:</p>\n<div class="highlight">\n	<pre class="brush: php">\n	echo Yii::app()-&gt;dateFormatter-&gt;format(&quot;dd MMMM y, HH:mm&quot;, $vardatetime);</pre>\n</div>\n<p>\n	Выведет дату и время в таком формате:&nbsp; 29 ноября 2011, 16:41<br />\n	Метод format принимает два параметра: первый &ndash; шаблон времени в стандарте Юникода, второй &ndash; время в unix timestamp или Mysql DATETIME. Вот и всё.<br />\n	Более подробно о CDateFormatter смотрите <a href="http://www.yiiframework.com/doc/api/1.1/CDateFormatter" target="_blank">здесь</a><br />\n	&nbsp;</p>\n<p>\n	&nbsp;</p>\n', 'Yii, формат, дата', 'Как правильно и грамотно отформатировать дату и время в Yii', '2012-02-25 15:28:38', NULL),
(4, 1, 4, NULL, 1, 1, 'Symfony2: справочник команд', 's2_sik_knd', 'В этой статье буду писать самые часто используемые команды Симфони. Как ни странно, но на Симфони без командной строки ну никак. Полгода-год назад помнил многие команды наизусть, а сейчас, особенно после работы с Магенто, в голове чистый лист.', '<p>&nbsp;</p>\r\n<hr id="readmore" />\r\n<p>Инсталляция проекта:</p>\r\n<pre class="brush: php; toolbar: true;"> composer install --prefer-dist</pre>\r\n<p>Обновление проекта:</p>\r\n<pre class="brush: php; toolbar: true;"> composer update --prefer-dist</pre>\r\n<p>Обновление бандла:</p>\r\n<pre class="brush: php; toolbar: true;"> composer update friendsofsymfony/user-bundle</pre>\r\n<p>Создание базы:</p>\r\n<pre class="brush: php; toolbar: true;">php app/console doctrine:database:create</pre>\r\n<p>Создание таблиц:</p>\r\n<pre class="brush: php; toolbar: true;">php app/console doctrine:schema:create</pre>\r\n<p>Загрузка фикстур:</p>\r\n<pre class="brush: php; toolbar: true;">php app/console doctrine:fixtures:load</pre>\r\n<p>Обновление схемы базы:</p>\r\n<pre class="brush: php; toolbar: true;">php app/console doctrine:schema:update --force</pre>\r\n<p>Создание бандла:</p>\r\n<pre class="brush: php; toolbar: true;">php app/console generate:bundle --namespace=Acme/HelloBundle --format=yml</pre>\r\n<p>Очистка кэша:</p>\r\n<pre class="brush: php; toolbar: true;">php app/console cache:clear --env=prod --no-debug</pre>\r\n<p>Очистка кэша и его последующий "прогрев" (только для SmartCore):</p>\r\n<pre class="brush: php; toolbar: true;">bin/clear_cache; bin/warmup_cache</pre>\r\n<p>Отладка роутеров:</p>\r\n<pre class="brush: php; toolbar: true;">php app/console router:debug</pre>\r\n<p>Показать все сервисы и классы связанные с сервисом:</p>\r\n<pre class="brush: php; toolbar: true;">php app/console container:debug</pre>\r\n<p>Показать приватные сервисы :</p>\r\n<pre class="brush: php; toolbar: true;">php app/console container:debug --show-private</pre>\r\n<p>Показать сервис по его id :</p>\r\n<pre class="brush: php; toolbar: true;">php app/console container:debug my_mailer</pre>\r\n<p>Обновить ассеты :</p>\r\n<pre class="brush: php; toolbar: true;">1. php app/console assetic:dump\r\n2. php app/console assets:install\r\n</pre>\r\n<p>Примечание. Иногда бывает нужно явно указать --env=prod</p>\r\n<p>Генерация карты сайта в SmartCore :</p>\r\n<pre class="brush: php; toolbar: true;">php app/console smart:sitemap:crawler</pre>', 'Symfony, команды', 'Самые часто используемые команды  Symfony2', '2013-08-07 17:19:21', '2014-09-19 11:14:58'),
(5, 1, 5, NULL, 1, 1, 'Подсвечиваем код на сайте', 'highlight_code_on_site', 'Давно мечтал о нормальной подсветке кода php, html и css. Наконец-то у меня выдалось время и я посветил этому вопросу несколько часов. Итак, небольшой обзор существующих способов подсветки показал, что её (подсветку) можно делать или не стороне клиента, или на стороне сервера. Для себя я сразу решил, что свой сервер грузить лишней работой не стоит. В общем, решил искать реализацию на JavaScript. Конечно, при отключённом js мои посетители не увидят подсветки, но таких, надеюсь, будет мало))', '<p></p>\n<hr id="readmore" />\n<p>\n	После гугления наткнулся на симпатичную статью. В ней описывался компактный скрипт highlight: <a href="http://softwaremaniacs.org/soft/highlight/">http://softwaremaniacs.org/soft/highlight/</a></p>\n<p>\n	Увы, после подключения подсветки кода я не увидел. Зато мой &laquo;любимый&raquo; IE подсветил ошибку на JavaScript. Мол, объект не поддерживает какое-то там свойство. Как Вы наверное понимаете, копаться в чужом коде и искать ошибку я не стал. Не подключается &ndash; и ладно, ищем другой скрипт.</p>\n<p>\n	Кандидатом номер два стал SyntaxHighlighter от Alex Gorbatchev. Особенность скрипта &ndash; что он не требует jQuery (хотя я не считаю это преимуществом) и можно указать только те языки, которые нужны. &nbsp;После скачивания и настройки подсветка кода тут же заработала, что очень и очень меня порадовало!</p>\n<p>\n	Архив качаем отсюда: <a href="http://alexgorbatchev.com/SyntaxHighlighter/download/">http://alexgorbatchev.com/SyntaxHighlighter/download/</a></p>\n<p>\n	Расскажу о некоторых особенностях настройки. Извлеките из скаченного архива и подключите следующие файлы:</p>\n<ol>\n	<li>\n		shCore.js</li>\n	<li>\n		shCore.css</li>\n	<li>\n		shThemeDefault.css</li>\n</ol>\n<p>\n	Далее определитесь с языками, подсветка коих Вам нужна. Так, я выбрал себе css, html и php. Чтобы они заработали, надо подключить следующие файлы:&nbsp; shBrushCss.js,&nbsp; shBrushXml.js, shBrushPhp.js.</p>\n<p>\n	И последний шаг &ndash; инициализация скрипта. Добавьте скрипт со строчкой</p>\n<pre class="brush: js; toolbar: true;">\nSyntaxHighlighter.all();</pre>\n<p>\n	- и подсветка заработает.</p>\n<p>\n	&nbsp;</p>\n<p>\n	На этом собственно все. Заключительный штрих &ndash; у себя я отключил боковую панельку (полоса прокрутки+ссылка на сайт автора) командой SyntaxHighlighter.defaults[&#39;toolbar&#39;] = false;</p>\n<p>\n	Как пользоваться подсветкой? Используйте тег &lt;pre&gt;с классом brush:[язык подсветки]. Т.е. для php это будет выглядеть так:</p>\n<p>\n	&nbsp;</p>\n<pre class="brush: js; toolbar: true;">\n	&lt;pre class=&quot;brush: php; toolbar: true;&quot;&gt;echo &quot;Привет, мир!&quot;; &lt;/pre&gt;</pre>\n<p>\n	&nbsp;</p>\n<p>\n	Скриптом я доволен.</p>\n', 'подсветка кода, highlight', 'Как подсветить код на сайте: используем highlight', '2013-01-29 17:28:47', NULL),
(6, 1, 4, NULL, 1, 1, 'Настройка Symfony2 в PhpStorm', 'adjustment_symfony2_in_phpstorm', 'По горячим следам, пока помню, напишу об интеграции поддержки Symfony2 в phpStorm.', '<p></p>\n<hr id="readmore" />\n<p>\n	Нам потребуется плагин: <a href="http://plugins.jetbrains.com/plugin/7219?pr=phpStorm">http://plugins.jetbrains.com/plugin/7219?pr=phpStorm</a></p>\n<p>\n	Устанавливаем его (File-&gt;Settings-&gt;Plugins, кнопка Install From Disk)</p>\n<p>\n	Перезапуcкаем PhpStorm. Идем в File-&gt;Settings-&gt;Symfony2 Plugin, ставим галку на Enable Plugin, проверяем пути (у меня var/cache/dev/appDevUrlGenerator.php и var/cache/dev/translations), в Container добавляем путь.</p>\n<p>\n	Ввводим команду php bin/warmup_cache</p>', 'phpStorm, Symfony2', 'Интеграции поддержки Symfony2 в phpStorm', '2013-08-10 10:14:05', NULL),
(7, 1, 4, NULL, 1, 1, 'Ссылки на Symfony2', 'fourth', 'Ссылки на полезную литературу по Symfony2', '<p></p>\n<hr id="readmore" /><p>Работа с контейнером сервисов: <a href="http://symfony.com/doc/current/book/service_container.html" target="_blank">http://symfony.com/doc/current/book/service_container.html</a></p>\n<p>Поиск бандлов для Symfony2: на сайте <a href="http://knpbundles.com/" target="_blank">KnpBundles</a></p>', NULL, NULL, '2013-08-10 10:14:05', NULL),
(8, 1, 2, NULL, 1, 1, 'Установка Memcached на Windows 7 x64 (php 5.4.17)', 'installation_memcached_on_windows7_x64_php_5_4_17', 'Встала задача поставить себе memcached. В интернете есть много мануалов, но они в основном под 32-разрядные версии. Т.к. у меня 64-разрядный php, то возникли определенные трудности…', '<p></p>\n<hr id="readmore" />\n<p>\n	Начать с того, что 64-раздяную версию самого &nbsp;memcache найти не так-то просто. На официальном сайт лежат сырые исходники: <a href="http://code.google.com/p/memcached/downloads/list">http://code.google.com/p/memcached/downloads/list</a></p>\n<p>\n	Компилировать их показалось задачей сложной и страшной. После интенсивного поиска в гугле нашел вот <a href="http://s3.amazonaws.com/downloads.northscale.com/memcached-win64-1.4.4-14.zip">тут</a> файлы версии 1.4.4-14 под Windows x64. Версия устаревшая, но выхода у меня не было (гугл показывал еще более старые версия), скачал себе эту.</p>\n<p>\n	Создал на диске себе папку <strong>memcached</strong> &nbsp;и распаковал туда архив. Далее запустил командную строку (от имени Администратора!) и выполнил</p>\n<pre class="brush: php; toolbar: true;">\n	C:\\memcached\\memcached.exe -d install</pre>\n<p>\n	Пошел смотреть в Службы, как встал memcached (Панель управления-&gt;Администрирование-&gt;Службы) &ndash; служба с таким именем появилась. Запустил её, в свойствах прописал автоматический запуск.</p>\n<p>\n	Осталось только подключиться к php. После поисков нашел тут: <a href="http://www.mediafire.com/download/8d3vd26z3fg6bf1/php_memcache-svn20120301-5.4-VC9-x64.zip">http://www.mediafire.com/download/8d3vd26z3fg6bf1/php_memcache-svn20120301-5.4-VC9-x64.zip</a> - похожее на нужную версию.</p>\n<p>\n	Однако при копировании вдруг обнаружил, что расширение (у меня php 5.4.17) php_memcache.dll уже есть&hellip; Решил, что &laquo;из коробки&raquo; будет надежнее.</p>\n<p>\n	Прописал в php.ini в разделе с расширениями</p>\n<pre class="brush: php; toolbar: true;">\n	[PHP_MEMCACHED]\n	extension = php_memcache.dll</pre>\n<p>\n	Перезапустил апач, убедился, что php_info() вывел memcache</p>\n<p>\n	Запустил тестовый файлик, ничего не сломалось.&nbsp; Ну посмотрим, как дальше себя поведет php&hellip;</p>\n<p>\n	P.S. Так файлы на просторах интернета имеет тенденцию теряться (сколько я нерабочих ссылок сегодня нашел!), то прикладываю свой архивчик: <a href="/media/memcached.zip">скачать</a></p>\n', 'php 5.4, Memcached, Windows 7 x64', 'Как установить поддержку Memcached php 5.4 на Windows 7 x64', '2013-08-27 19:38:21', NULL),
(9, 1, 6, NULL, 1, 1, 'Debain7 – горячие команды сервера', 'debain7_hot_commands_of_the_server', 'Тут собрал команды, которые все время приходится использовать на сервере (ОС – Debain7)', '<hr id="readmore" />\n<p>Запуск apache:</p>\n<div class="highlight">	<pre class="brush: cpp">/etc/init.d/apache2 start</pre></div>\n<p>Остановка apache:</p>\n<div class="highlight">	<pre class="brush: cpp">/etc/init.d/apache2 stop</pre></div>\n<p>Перезапуск apache:</p>\n<div class="highlight">	<pre class="brush: cpp"> /etc/init.d/apache2 restart</pre></div>\n<p>Безопасный рестарт apache:</p>\n<div class="highlight">	<pre class="brush: cpp"> /etc/init.d/apache2 reload</pre></div>\n', 'Debain7, команды', 'Часто используемые команды в Debain7', '2013-08-29 22:09:51', NULL),
(10, 1, 8, NULL, 1, 1, 'CSS – линейный градиент фона', 'css_linear_gradient_of_background', 'Как сделать градиент фону, не прибегая к помощи фоновых рисунков? Современные браузеры поддерживают градиентную заливку с помощью CSS.', '<p></p>\n<hr id="readmore" />\n<div class="highlight">\n	<pre class="brush: css">\nbackground:#EFEFEF; /*цвет фона кнопки для браузеров без поддержки CSS3*/\nbackground: -webkit-gradient(linear, left top, left bottom, from(#3437CD), to(#538BFF)); /* для Webkit браузеров */\nbackground: -moz-linear-gradient(top,  #3437CD, #538BFF); /* для Firefox */\nbackground-image: -o-linear-gradient(top,  #3437CD,  #538BFF); /* для Opera 11 */\nfilter:  progid:DXImageTransform.Microsoft.gradient(startColorstr=&#39;#3437CD&#39;, endColorstr=&#39;#538BFF&#39;); /* фильтр для IE */\n\n</pre>\n</div>\n<p>\n	Чтобы сохранить&nbsp; кроссбраузерность, приходиться писать под каждый интернет-браузер отдельное правило CSS. Особо обрабатывается IE.&nbsp; В каждом правиле участвует два цвета &ndash; начальный и конечный.</p>\n', 'градиент фона, css', 'Создание градиента без помощи фоновых рисунков', '2012-02-25 17:03:11', NULL),
(11, 1, 10, NULL, 1, 1, 'Подключаем Twitter Bootstrap к Yii', 'connect_twitter_bootstrap_to_yii', 'Совсем недавно мне рассказали о такой классной вещи, как фреймворк css от Твиттера - Twitter Bootstrap. Раньше, максимум, что я использовал - это "reset css". Все остальное писал ручками. Каждый раз - одно и то же. Что, понятно, отрицательно сказывалось на производительности. Немного поработав с этим фреймворком (оформление админки на Симфони 2) - пришел к выводу, что вещь это безусловно полезная. Реально ускоряет работу в разы. И вот я решил перевести и свой блог на Yii к этому же виду.', '<p></p>\n<hr id="readmore" />\n<p>\n	Перво-наперво скачал сам Twitter Bootstrap с гитхаба: <a href="https://github.com/twitter/bootstrap">https://github.com/twitter/bootstrap</a>. Т.е я качал вместе с исходниками на языку less, т.к. планировал самостоятельно компилировать из них css. Вы же может скачать уже скомпилированные файлы, например, отсюда: <a href="http://bootstrap.veliovgroup.com/">http://bootstrap.veliovgroup.com/</a> Но в этом случае уже нельзя будет изменять расцветку ну и вообще вносить изменения&hellip; В общем, я остановился на сырых исходниках.</p>\n<p>\n	Компилировать исходники less я решил с помощью расширения Yii-less: <a href="http://www.yiiframework.com/extension/yii-less/">http://www.yiiframework.com/extension/yii-less/</a></p>\n<p>\n	Скачиваем данное расширение, ложем его в папку protected/extensions. В конфиге регистрируем новый&nbsp; behaviors:</p>\n<pre class="brush: php; toolbar: true;">\n	&#39;behaviors&#39;=&gt;array(\n	    &#39;ext.yii-less.components.LessCompilationBehavior&#39;,\n	)\n</pre>\n<p>\n	Регистрируем расширение как компонент:</p>\n<pre class="brush: php; toolbar: true;">\n&#39;components&#39;=&gt;array(\n  &#39;lessCompiler&#39;=&gt;array(\n    &#39;class&#39;=&gt;&#39;ext.yii-less.components.LessCompiler&#39;,\n    &#39;paths&#39;=&gt;array(\n      // you can access to the compiled file on this path\n      &#39;/css/bootstrap.css&#39; =&gt; array(\n        &#39;precompile&#39; =&gt; true, // whether you want to cache the generation\n        &#39;paths&#39; =&gt; array(&#39;/less/bootstrap.less&#39;) //paths of less files. you can specify multiple files.\n      ),\n    ),\n  ),\n),\n</pre>\n<p>\n	&nbsp;</p>\n<p>\n	И в лайоте пишем Yii::app()-&gt;clientScript-&gt;registerCssFile(&#39;/css/bootstrap.css&#39;)</p>\n<p>\n	Все, теперь при первом запуске в нашем ассете будет новый файл. Как альтернатива &ndash; можно компилировать файлы на стороне клиента (<a href="https://github.com/cloudhead/less.js">https://github.com/cloudhead/less.js</a>)&nbsp; &ndash; но, на мой взгляд, это сильно скажется на производительности&hellip;.</p>\n<p>\n	Одной проблемой меньше. Остался вопрос с подсветкой кода на less. Мой редактор (NetBeans) по умолчанию не распознает less. Исправляем это с помощь плагина scss-editor <a href="http://code.google.com/p/scss-editor/">http://code.google.com/p/scss-editor/</a></p>\n<ol>\n	<li>\n		Качаем плагин, ставим его в NetBeans</li>\n	<li>\n		Ассоциируем с ним файлы Less &ndash; Сервис -&gt;Параметры -&gt;Файлы,&nbsp; создаем новое расширение less и в списке &laquo;Связанный тип файлов&raquo; задаем ему &laquo;text/x-scss&raquo;</li>\n</ol>\n<p style="margin-left:18.0pt;">\n	Перезапускаем NetBeans &ndash; и подсветка появилась!</p>\n<p style="margin-left:18.0pt;">\n	Напоследок замечу, что для Yii есть готовое решение в виде расширения yii-bootstrap: <a href="http://www.cniska.net/yii-bootstrap/" target="_blank">http://www.cniska.net/yii-bootstrap/</a> - но я его не пробовал. Лень разбираться&hellip;</p>\n	<p><b>UPD</b> На Symfony2 этот же дизайн встал без проблем</p>\n', 'yii, twitter bootstap, подключение', 'Как подключить Twitter Bootstrap к Yii', '2013-01-29 17:42:26', NULL),
(12, 1, 11, NULL, 1, 1, 'Создаем формы в Visual Studio 2012', 'create_forms_in_visual_sStudio_2012', 'Сегодня решил повозиться с Microsoft Visual Studio 2012 C++ - попробовать создать свою форму. Начал искать компоненты (как в Delphi) - но нигде их не нашел!', '<p></p>\n<hr id="readmore" />\n<p>\n	Погуглил и понял, что именно в 2012 версии, именно для языка C++ разработчики решили убрать поддержку Windows Forms Application. На просторах буржуйского интернета нашел замечательное решение. Нужно скачать шаблон <a href="http://dmitxe.ru/media/VS2012CPPWinForms.zip">http://dmitxe.ru/media/VS2012CPPWinForms.zip</a> и скопировать его в C:\\Program Files (x86)\\Microsoft Visual Studio 11.0\\VC\\vcprojects\\vcNET\\ - при этом лучше на всякий случай сделать бэкап файла &quot;vcNET.vsdir&quot;. Использование: Файл-&gt;Проект-&gt;Шаблоны-&gt;Visual C++ -&gt; CLR-&gt;MC++ WinApp</p>\n<p>\n	Источник:&nbsp; <a href="http://www.t-hart.org/vs2012/">http://www.t-hart.org/vs2012/</a></p>\n', 'форма, Visual Studio 2012 C++', 'Как создать приложение Windows Forms Application в Visual Studio 2012 C++', '2013-06-06 20:31:23', NULL),
(13, 1, 12, NULL, 1, 1, 'NotePad++', 'notepad_plus_plus', 'Часто возникает необходимость быстрой перекодировки файла (например, из ansi в utf8, или наоборот). Есть замечательный (и притом бесплатный) редактор - NotePad++. С помощью него можно легко перекодировать файл из одной кодировки в другую. В этом редакторе есть даже подсветка кода. Конечно, я предпочитаю работать где-нибудь в Adobe Dreamweaver, NuSphere PHPED или в NetBeans. Но эти монстры подолгу грузятся, а иногда хочется быстро подправить код и тут же закрыть файл. Для этого как раз подойдёт NotePad++', '<p></p>\n<hr id="readmore" />\n<p>\n	Есть одна особенность перекодирования в utf8. Для преобразования кодировки&nbsp; файла выбираем в меню &laquo;Кодировки&raquo;-&gt; &laquo;Преобразовать в utf8&nbsp; без BOM&raquo;. Если выбрать просто &laquo;Преобразовать в utf8&raquo;, тогда случиться трагедия &ndash; страница перестанет правильно отображаться в браузере. Преобразование в ANSI таких проблем не имеет &ndash; есть только одно действие.<br />\n	Программа качается <a href="http://notepad-plus-plus.org/download/" target="_blank">отсюда</a>.<br />\n	&nbsp;</p>\n', 'редактор, кодировка', 'Как перекодировать файл с помощью NotePad++', '2012-02-25 15:34:43', NULL),
(14, 1, 13, NULL, 1, 1, 'Что выбрать: фреймворк или CMS', 'framework_vs_cms', 'Свое знакомство с сайтостроением я начал с написания простейшего кода на HTML. Сайт получился, естественно, статическим. Следующий проект делал уже на PHP. Времени на написание ушло много, в результате у меня начала создаваться собственная CMS. К сожалению, данный факт осмыслил не сразу. А как только понял, что приду к CMS, решил не изобретать велосипед, освоил Joomla и WordPress.', '<p></p>\n<hr id="readmore" />\n<p>\n	&nbsp;Разработка стандартных сайтов (блогов, форумов и т.д.) пошла на ура. Но вся проблема оказалась в том, что многим заказчикам нужна некая особая, нестандартная функциональность. Реализовать которую в рамках данной CMS оказывается совсем непросто. Приходиться писать новые расширения или модифицировать существующий код. Времени такая работа занимает много, к тому же из-за взаимодействия с ядром CMS код не оптимальный. В общем, встал вопрос &ndash; что же проще &ndash; писать свою CMS или мучиться с существующими.</p>\n<p>\n	И тут я вспомнил о фреймворках. &nbsp;Фреймворк &ndash; это каркас для веб-приложения, а CMS &ndash; готовая система управления контентом. Наверное, можно фреймворк можно сравнить с кирпичами, из которых можно построить самые причудливые строения, а CMS &ndash; это стандартный дом.</p>\n<p>\n	После обзора самых популярных фреймворков я остановил свой выбор на Yii. Понравился достаточно строгий подход, относительная простота изучения (конечно, CodeIgniter осваивается легче, но возможности Yii богаче).</p>\n<p>\n	Теперь написать собственную, уникальную CMS стало гораздо проще. Конечно, стандартные проекты быстрее реализовать на готовой CMS, но многие проекты имею тенденцию превращаться из стандартных в нестандартные.</p>\n<p>\n	Этот блог я написал на Yii. А вот другой мой блог &ndash; netopus.ru написан CMS WordPress. Использовалась одна из бесплатных тем для WordPress.</p>\n<p><b>UPD</b> В сентябре 2013 года блог перешел на Symfony2 (движок SmartCore)</p>\n', 'фреймворк, CMS, выбор', 'Преимущества и недостатки фреймворка над CMS', '2011-11-23 13:15:19', NULL),
(15, 1, 4, NULL, 1, 1, 'Twig в Symfony2: работа с датой и временем.', 'twig_in_symfony2_work_with_date_and_time', 'Поначалу возник недоуменный вопрос: как в twig отдать дату в нужном формате? Неужели дату можно форматировать только в контролере? Но погуглив, нашел ответы на свои вопросы.', '<p>&nbsp;</p>\r\n<hr id="readmore" />\r\n<p>Форматирование даты:</p>\r\n<pre class="brush: php; toolbar: true;">	var_date|date("d.m.y")\r\n</pre>\r\n<p>Получение текущей даты:</p>\r\n<pre class="brush: php; toolbar: true;">	"new"|date("d.m.y")\r\n</pre>\r\n<p>Интернационализация:</p>\r\n<p>1. Подключаем сервис в конфиге Symfony2</p>\r\n<pre class="brush: php; toolbar: true;">	services:\r\n        twig_extension.intl:\r\n            class: Twig_Extensions_Extension_Intl\r\n            tags: [{ name: "twig.extension" }]\r\n</pre>\r\n<p>2. Пример вызова</p>\r\n<pre class="brush: php; toolbar: true;">	{{ item.date|localizeddate("none", "none", null, null, "dd. LLLL YYYY") }}\r\n</pre>\r\n<p>Более подробное описание параметров <a href="http://twig.sensiolabs.org/doc/extensions/intl.html" target="_blank">тут</a></p>\r\n<p>Спецификация формата <a href="http://userguide.icu-project.org/formatparse/datetime" target="_blank">тут</a></p>', 'Symfony2, Twig, дата и время', 'Symfony2 работа с датой и временем из Twig', '2013-09-05 18:19:56', '2014-09-19 11:04:07'),
(16, 1, 14, NULL, 1, 1, 'Команды ssh', 'commands_ssh', 'Команды ssh через Pytty', '<hr id="readmore" />\n<p>Переход в директорию path_to_dir:</p>\n<div class="highlight">	<pre class="brush: cpp">cd path_to_dir</pre></div>\n<p>Удаление файла file:</p>\n<div class="highlight">	<pre class="brush: cpp">rm file</pre></div>\n<p>Рекурсивное удаление всех файлов в папке и саму папку folder:</p>\n<div class="highlight">	<pre class="brush: cpp">rm -rf folder/</pre></div>\n<p>Упаковка папки folder в архив archive.zip:</p>\n<div class="highlight">	<pre class="brush: cpp">zip -r archive.zip folder/</pre></div>\n<p>Распаковка архива в текущую папку:</p>\n<div class="highlight">	<pre class="brush: cpp">unzip archive.zip</pre></div>\n<p>Перемещение всех папок и файлов из subdir в dir:</p>\n<div class="highlight">	<pre class="brush: cpp">mv dir/subdir/* dir/</pre></div>\n', 'SSH, команды', 'Часто используемые команды ssh', '2014-02-09 19:41:53', NULL),
(17, 1, 4, NULL, 1, 1, 'Переводы (локализация) в Symfony 2', 'translations_in_symfony2', 'Вызовы переводов в различных частях Symfony: в шаблонах (твиг), контроллере, сущности, форме и меню.', '<h3>В твиге:</h3>\r\n<pre class="brush: php; toolbar: true;">{{ message|trans({''%name%'': ''Fabien''}, "app") }}</pre>\r\n<p>В самом файле переводов так и пишем:</p>\r\n<pre class="brush: php; toolbar: true;">message: This is %name% </pre>\r\n<h3>В контроллере:</h3>\r\n<pre class="brush: php; toolbar: true;">$translated = $this-&gt;get(''translator'')-&gt;trans(''Symfony2 is great'');</pre>\r\n<h3>В сущности:</h3>\r\n<p>Создаем в базе данных поля с расширением _ru и _en и в зависимости от локали отдаем нужный</p>\r\n<pre class="brush: php; toolbar: true;">    /**\r\n     * @var string\r\n     *\r\n     * @ORM\\Column(type="string", length=255)\r\n     */\r\n    private $title_en;\r\n\r\n    /**\r\n     * @var string\r\n     *\r\n     * @ORM\\Column(type="string", length=255)\r\n     */\r\n    private $title_ru;\r\n\r\n    /**\r\n     * @param string $title_en\r\n     * @return $this\r\n     */\r\n    public function setTitleEn($title_en)\r\n    {\r\n        $this-&gt;title_en = $title_en;\r\n        return $this;\r\n    }\r\n\r\n    /**\r\n     * @return string\r\n     */\r\n    public function getTitleEn()\r\n    {\r\n        return $this-&gt;title_en;\r\n    }\r\n\r\n    /**\r\n     * @param string $title_ru\r\n     * @return $this\r\n     */\r\n    public function setTitleRu($title_ru)\r\n    {\r\n        $this-&gt;title_ru = $title_ru;\r\n        return $this;\r\n    }\r\n\r\n    /**\r\n     * @return string\r\n     */\r\n    public function getTitleRu()\r\n    {\r\n        return $this-&gt;title_ru;\r\n    }\r\n\r\n    /**\r\n     * @return string\r\n     */\r\n    public function getTitle($locale = ''ru'')\r\n    {\r\n        return (''ru'' == $locale) ? $this-&gt;title_ru : $this-&gt;title_en;\r\n    }\r\n</pre>\r\n<p>Пример вызова:</p>\r\n<pre class="brush: php; toolbar: true;">&lt;h3&gt;{{ post.title(app.session.get(''locale'', ''ru'')) }}&lt;/h3&gt;\r\n</pre>\r\n<h3>В форме:</h3>\r\n<p>Просто пишем метки на английском, в файлах перевода пишем</p>\r\n<pre class="brush: php; toolbar: true;">Label: Метка</pre>\r\n<h3>В меню:</h3>\r\n<p>С меню наверное надо было подключать сервис translator прямо в меню. Но было лень делать лишние телодвижения, поэтому решил переопределить твиг.</p>\r\n<p>В конфиге пишем:</p>\r\n<pre class="brush: php; toolbar: true;">knp_menu:\r\n  twig:\r\n    template: AcmeDemoBundle::knp_menu.html.twig&nbsp; # your custom knp_menu template\r\n</pre>\r\n<p>В knp_menu.html.twig ставим это:</p>\r\n<pre class="brush: php; toolbar: true;">{% extends "knp_menu.html.twig" %}\r\n{% block label %}\r\n    {{ item.label|trans }}\r\n{% endblock %}\r\n</pre>\r\n<p>И все, в метках пишем английский вариант, подхватит.</p>', 'Symfony, переводы', 'Вызовы переводов в различных частях Symfony: в шаблонах (твиг), контроллере, форме и меню.', '2014-07-02 12:04:35', '2014-07-24 12:03:21'),
(18, 1, 4, NULL, 1, 1, 'Слушатель события Входа на сайт в Symfony 2', 'login-event-listener-in-symfony2', 'После успешного входа на сайт бывает необходимо сделать какие-то дополнительные действия. Например, в моем случае нужно было обновить время последнего посещения сайта пользователем.', '<p>Для этих целей будем использовать Event Listener (слушатель событий). Будем использовать глобальный сервис &laquo;security.context&raquo; и его событие &laquo;security.interactive_login&raquo;</p>\r\n<p>В services.yml пишем</p>\r\n<pre class="brush: php; toolbar: true;">login_listener:\r\n   class: Acme\\UserBundle\\Listener\\LoginListener\r\n        arguments: [@security.context, @doctrine.orm.entity_manager]\r\n        tags:\r\n            - { name: kernel.event_listener, event: security.interactive_login }\r\n</pre>\r\n<p>В LoginListener.php</p>\r\n<pre class="brush: php; toolbar: true;">&lt;?php\r\n \r\nnamespace Acme\\UserBundle\\Listener;\r\n \r\nuse Symfony\\Component\\Security\\Http\\Event\\InteractiveLoginEvent;\r\nuse Symfony\\Component\\Security\\Core\\SecurityContext;\r\nuse Doctrine\\ORM\\EntityManager; \r\n/**\r\n * Custom login listener.\r\n */\r\nclass LoginListener\r\n{\r\n	/** @var \\Symfony\\Component\\Security\\Core\\SecurityContext */\r\n	private $securityContext;\r\n	\r\n	/** @var \\Doctrine\\ORM\\EntityManager */\r\n	private $em;\r\n	\r\n	/**\r\n	 * Constructor\r\n	 * \r\n	 * @param SecurityContext $securityContext\r\n	 * @param EntityManager $em\r\n	 */\r\n	public function __construct(SecurityContext $securityContext, EntityManager $em)\r\n	{\r\n		$this-&gt;securityContext = $securityContext;\r\n		$this-&gt;em = $em;\r\n	}\r\n	\r\n	/**\r\n	 * Do the magic.\r\n	 * \r\n	 * @param InteractiveLoginEvent $event\r\n	 */\r\n	public function onSecurityInteractiveLogin(InteractiveLoginEvent $event)\r\n	{\r\n		if ($this-&gt;securityContext-&gt;isGranted(''IS_AUTHENTICATED_FULLY'')) {\r\n			// user has just logged in\r\n		}\r\n		\r\n		if ($this-&gt;securityContext-&gt;isGranted(''IS_AUTHENTICATED_REMEMBERED'')) {\r\n			// user has logged in using remember_me cookie\r\n		}\r\n		\r\n		// do some other magic here\r\n		$user = $event-&gt;getAuthenticationToken()-&gt;getUser();\r\n		\r\n		// ...\r\n	}\r\n}\r\n</pre>\r\n<p>По материалам статьи <a href="http://www.metod.si/login-event-listener-in-symfony2/">http://www.metod.si/login-event-listener-in-symfony2/</a></p>', 'Symfony 2, событие входа', 'Слушатель события Входа на сайт в Symfony 2', '2014-07-04 10:40:55', '2014-07-04 10:45:14'),
(19, 1, 3, NULL, 1, 1, 'Mysql вставка по полю из другой таблицы', 'mysql-an-insert-across-the-field-from-other-table', 'Возникла задача - написать одним запросом вставку строк в таблицу, основанных на на данных из другой таблицы. Пока помню, пишу.', '<pre class="brush: php; toolbar: true;">  INSERT INTO money(user_id, money)\r\n  SELECT id, 6 \r\n  FROM users\r\n</pre>', NULL, 'Mysql вставка по полю из другой таблицы', '2014-07-09 12:10:25', '2014-07-09 12:13:10'),
(20, 1, 12, NULL, 1, 1, 'Отключаем рекламу в скайпе', 'we-disconnect-advertising-in-skype', 'Недавно скайп порадовал меня надписью о необходимости обновиться до последней версии. В противном случае грозился выкинуть из учетной записи. Пришлось обновляться... Поставил новую версию - и тут заметил, что при просмотре диалога СВЕРХУ опускалось окошко с рекламой и уроками. Это окошко окончательно опустило скайп в моих глазах (одно то, что в скайпе нет проверки правописания чего стоит!). Пошел гуглить, и вот решение как избавиться от рекламы:', '<ol>\r\n<li>В скайпе идем в Инструмент-&gt;Настройки-&gt;Оповещения-&gt;Извещения и сообщения - снимаем там все галки</li>\r\n<li>Идем в файл C:\\Windows\\System32\\drivers\\etc\\hosts и вносим туда такую запись:\r\n<pre class="brush: php; toolbar: true;">   127.0.0.1	rad.msn.com\r\n</pre>\r\n<p>Люди советуют еще внести эти строчки</p>\r\n<pre class="brush: php; toolbar: true;">   127.0.0.1    download.skype.com \r\n   127.0.0.1    apps.skype.com \r\n</pre>\r\n<p>- но я побоялся (вдруг думаю это проверка обновлений или вообще сам чат). А потом говорили перезагрузить комп, но я спокойно обошелся без перезегрузки Винды... Реклама сразу исчезла после перезапуска скайпа</p>\r\n</li>\r\n</ol>\r\n<p>P.S. Версия скайпа 6.18</p>', 'реклама, скайп, отключение', 'Отключаем надоедливую рекламу в скайпе', '2014-07-24 12:22:08', '2014-07-24 15:24:34');
INSERT INTO `blog_articles` (`id`, `author_id`, `category_id`, `image_id`, `is_commentable`, `is_enabled`, `title`, `slug`, `annotation`, `text`, `keywords`, `description`, `created_at`, `updated_at`) VALUES
(21, 1, 15, NULL, 1, 1, 'Chromium', 'chromium', 'Chromium – это компонент браузера для Delphi, основанный на движке Chrome. Собственно, в этом и есть его главное преимущество перед стандартным WebBrowser (который основывается на IE).\r\nДругое преимущество Chromium – это удобная работа с куками, что незаменимо при работе с социальными сетями. Может, и WebBrowser тоже такое умеет, но даже не стал глубоко копать – т.к. IE – это абсолютное зло)', '<p>В этой статье речь пойдет о Chromium под Delphi 7. В принципе теоретически он наверное встанет и под Lazarus, особенно старая версия: <a href="https://code.google.com/p/delphichromiumembedded/">https://code.google.com/p/delphichromiumembedded/</a></p>\r\n<h2>Установка</h2>\r\n<p>Идем за самой свежей версией: <a href="https://code.google.com/p/dcef3/">https://code.google.com/p/dcef3/</a></p>\r\n<p>Качаем себе на комп, распаковываем сюда: c:\\Program Files (x86)\\Borland\\Delphi7\\Lib\\dcef3\\</p>\r\n<p>Копируем все файлы исходников из c:\\Program Files (x86)\\Borland\\Delphi7\\Lib\\dcef3\\src в c:\\Program Files (x86)\\Borland\\Delphi7\\Lib</p>\r\n<p>Открываем через Delphi 7 пакет &nbsp;c:\\Program Files (x86)\\Borland\\Delphi7\\Lib\\dcef3\\packages\\DCEF_D7.dpk</p>\r\n<p>Делаем компиляцию, инсталлируем.</p>\r\n<p>Теперь в конце списка вкладок должна появиться новая вкладка&nbsp; Chromium.</p>\r\n<p>Закрываем пакет, изменения не сохраняем, перезапускаем Delphi.</p>\r\n<h2>Работа с компонентом</h2>\r\n<h3>Куки</h3>\r\n<p>Создадим новый проект, назовем его допустим DelphiBrowser.</p>\r\n<p>Давайте попробуем загрузить страничку ВК.</p>\r\n<p>На форме размещаем компонент TChromium &nbsp;и кнопку TBitBtn, вешаем событие на кнопку</p>\r\n<pre class="brush: php; toolbar: true;">procedure TForm1.BitBtn1Click(Sender: TObject);\r\nvar\r\n  CookieManager: ICefCookieManager;\r\n  CookiesPath : String;\r\nbegin\r\n  CookiesPath := ExtractFilePath(Application.ExeName) + '' Cookies/User1'';\r\n  CookieManager := TCefCookieManagerRef.Global;\r\n  CookieManager.SetStoragePath(CookiesPath, TRUE );\r\n  Chromium1.Load(''http://vk.com/'');\r\nend;\r\n</pre>\r\n<p>В uses проверяем, чтобы был подключен модуль ceflib</p>\r\n<p>В папку с проектом метаем содержимое из c:\\Program Files (x86)\\Borland\\Delphi7\\Lib\\dcef3\\bin\\Win32\\</p>\r\n<p>Создаем папку Cookies, в ней подпапку User1. Здесь будут лежать куки первого пользователя. Можно создать папку User2 и т.д. и потом переключаться между ними.</p>\r\n<p>Сохраняем изменения и запускаем прогу.</p>\r\n<p>Если все сделано правильно, то при клике на кнопку загрузиться ВК. Войдите под своим логином на сайт, закройте программу. Запустите её снова, нажмите на кнопку. Вы должны оказаться под своим логином, т.е. куки сработали.</p>\r\n<h3>Адресная строка</h3>\r\n<p>Давайте теперь добавим &laquo;адресную строку&raquo;. Возьмите компонент TLabeledEdit, в заголовок вбейте &laquo;Адрес&raquo;. Поместите вторую кнопку TBitBtn, и повесьте не неё такой обработчик:</p>\r\n<pre class="brush: php; toolbar: true;">procedure TForm1.BitBtn2Click (Sender: TObject);\r\nbegin\r\n  Chromium1.Load(LabeledEdit1.Text);\r\nend;\r\n</pre>\r\n<p>Теперь, если мы вобьем в поле адрес и нажмем на кнопку, то произойдет загрузка нужной страницы.</p>\r\n<p>Давайте чуть усложним задачу. Пусть при переходе по ссылкам значение адреса в поле синхронно изменяется.</p>\r\n<p>Выделяем Chromium1 на форме, жмем F11 (вызов Инспектора), переходим на вкладку Events и дважды кликаем на OnAddressChange. Добавляем код</p>\r\n<pre class="brush: php; toolbar: true;">procedure TForm1.Chromium1AddressChange(Sender: TObject;\r\n  const browser: ICefBrowser; const frame: ICefFrame; const url: ustring);\r\nbegin\r\n  LabeledEdit1.Text:=url;\r\nend;\r\n</pre>\r\n<p>Все, теперь при переходе на другую страницу из браузера её адрес отобразиться в поле.</p>\r\n<h3>Скрипты</h3>\r\n<p>Теперь рассмотрим как подгружать код JavaScript.</p>\r\n<p>Добавим третью кнопку и прицепим к ней такой обработчик:</p>\r\n<pre class="brush: php; toolbar: true;">procedure TForm1.BitBtn3Click(Sender: TObject);\r\nvar\r\n  code: ustring; \r\nbegin\r\nif (Chromium1.Browser.GetMainFrame&lt;&gt;nil) then\r\n  begin\r\n  code:=''alert("Hello!");'';\r\n  Chromium1.Browser.GetMainFrame.ExecuteJavaScript(code,'''',0);\r\n  end\r\n  else ShowMessage(''FatalError'');\r\nend; \r\n</pre>\r\n<p>GetMainFrame проверяет, загружена ли страница. GetMainFrame.ExecuteJavaScript выполняет код JS, в данном случае выводит "Hello!". Но понятно что через JS мы можем манипулировать деревом DOM, совершать различные действия (вбивать в поля данные, кликать по кнопкам, получать значения).</p>\r\n<h3>Консоль</h3>\r\n<p>Давайте теперь зацепим консоль.</p>\r\n<p>Добавим на форму компонент TMemo.</p>\r\n<p>Повесим обработчик в Chromium на OnConsoleMessage, напишем там такой код:</p>\r\n<pre class="brush: php; toolbar: true;">procedure TForm1.Chromium1ConsoleMessage(Sender: TObject;\r\n  const browser: ICefBrowser; const message, source: ustring;\r\n  line: Integer; out Result: Boolean);\r\nbegin\r\n  Memo1.Lines.Add(message);\r\nend;\r\n</pre>\r\n<h3>Исходный код страницы</h3>\r\n<p>Давайте получим весь html код страницы.</p>\r\n<p>Добавим на форму еще один компонент TMemo.</p>\r\n<p>Повесим обработчик в Chromium на OnLoadEnd, напишем там такой код:</p>\r\n<pre class="brush: php; toolbar: true;">procedure TForm1.Chromium1LoadEnd(Sender: TObject;\r\n  const browser: ICefBrowser; const frame: ICefFrame;\r\n  httpStatusCode: Integer);\r\nbegin\r\n if (frame &lt;&gt; nil) and frame.IsMain  then\r\n begin\r\n    Memo1.Lines.Add(''Загрузка страницы завершена!''); // для вывода в консоль\r\n    frame.GetSourceProc(callback);\r\n  end;\r\nend;\r\n\r\nprocedure callback(const str: ustring);\r\nbegin\r\n  Form1.Memo2.Lines.Clear; // очищаем Memo\r\n  Form1.Memo2.Lines.Add(str);\r\n  Form1.Memo2.Lines.Add(''------------end-frame--------------'');\r\n  Application.ProcessMessages;\r\nend;\r\n</pre>\r\n<h3>Блокируем ресурсы</h3>\r\n<p>Допустим мы не хотим видет какую-то рекламу. Как заблокировать загрузку ресурса по адресу? Очень просто:</p>\r\n<p>Повесим обработчик в Chromium на OnBeforeResourceLoad, напишем там такой код:</p>\r\n<pre class="brush: php; toolbar: true;">procedure TForm1.Chromium1BeforeResourceLoad(Sender: TObject;\r\n  const browser: ICefBrowser; const frame: ICefFrame;\r\n  const request: ICefRequest; out Result: Boolean);\r\nvar\r\n  url: String;\r\n  pos: Integer;\r\nbegin\r\n  Result := False; //по умолчанию разрешаем загрузку ресурса (страницы, изображения, видео...)\r\n  url:=request.GetUrl; //получаем текущий урл\r\n  pos:=PosEx(''youtube.com'', url); //ищем вхождение слова "youtube.com" в урл\r\n  if pos&gt;0 then //если слово содержиться, то\r\n  begin\r\n    Result := True; //запрещаем его загрузку. Таким образом я избавился от лишнего мусора...\r\n  end;  \r\nend;\r\n</pre>\r\n<h3>Настройка прокси</h3>\r\n<p>Обнаружилась одна неприятная особенность: своего прокси у Chromium нет. Вообще нет и похоже не предвидеться. Глянул браузеры Google Chrome и Opera - все они используют настройки прокси от системы (т.е. IE). Только Mozilla Firefox продолжает использовать собственные настройки. После долгих часов поиска понял, что похоже единственное решение - подмена каким-то образом системных настроек. Но как конкретно это сделать - не нашел, встречал только упоминания. Буду благодарен, если в комментариях оставите ссылки. Ну а сейчас единственный рабочий вариант - это прописывать параметры прокси в командной строке:</p>\r\n<pre class="brush: php; toolbar: true;">  test.exe --proxy-server=255.255.0.1:80\r\n</pre>\r\n<p>Соотвественно чтобы программно менять прокси - нужно создать две программы - одна вызывает другую с нужными параметрами...</p>\r\n<p>В параметрах командной строки также можно сменить user-agent:</p>\r\n<pre class="brush: php; toolbar: true;">  test.exe --user-agent="Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; en)"\r\n</pre>\r\n<h2>Еще исследуются&hellip;</h2>\r\n<p>Собственно, на этом и закончились мои успехи. Непонятно, как получать данные из DOM? Чтобы они были доступны не только скрипту, но и самой проге. Конечно, получив исходный код страницы можно распарсить его, но во-первых, это не универсальное решение, а во-вторых - динамически подгружаемый контент по-прежнему остается недоступным... Как получить всю DOM модель документа в любой момент времени с помощью самого компонента &ndash; увы, не разобрался. Т.е. пока что реальная польза от программы &ndash; это заполнение полей своими данными, а до полноценного парсера она не дотягивает&hellip;. &nbsp;</p>\r\n<p>&nbsp;</p>', 'chromium, delphi7', 'Работа с комопнентом Chromium в Delphi 7', '2014-08-26 09:25:29', '2014-09-22 16:17:28'),
(22, 1, 13, NULL, 1, 1, 'Регистрация доменов', 'registration-domains', 'Для регистрации доменов использую <a href="http://2domains.ru" target="_blank">2domains.ru</a>. Это партнер рег.ру, стоимость домена в зонe .ru и .рф – 99 рублей. Домен покупается на 1 год. Продление еще на год – 250 рублей.', '<p>Проверить, не занят ли домен можно <a href="http://2domains.ru/whois/whois.php" target="_blank">тут</a> , не входя в Панель управления. &nbsp;&nbsp;</p>\r\n<p>При регистрации укажите свои настоящие данные и номер телефона.</p>\r\n<p>Чтобы купить новый домен, входим в Панель Управления, пополняем счет на 99 рублей (в верхнем меню кликаем Баланс-&gt;Пополнить баланс).</p>\r\n<p>В верхнем меню кликаем Домены-&gt;Регистрация-&gt;Зарегистрировать домен. Вводим выбранное ранее имя домена, жмем на кнопку Проверить и если имя еще никто не занял &ndash; то совершаем покупку.</p>\r\n<p>Оставьте DNS сервера регистратора. Каждая смена DNS сервера &ndash; это примерно трое суток простоя. Лучше направляйте сервер по ip.</p>\r\n<p>Если Вы используете DNS сервера регистратора, то Вам доступно для редактирования управление зоной ДНС. Перейдите в Домены-&gt;Мои домены, нажмите на свой домен, откроется меню, в нем будет пункт &laquo;Управление зоной ДНС&raquo;. При клике на нем откроется редактор записей. В раздел &laquo;Добавление записей типов: A, AAAA, CNAME, MX, NS, TXT&raquo; добавьте три записи &laquo;*&raquo;, &laquo;@&raquo; и &laquo;www&raquo;, для всех записей укажите IP адрес сервера, на котором будет находиться ваш сайт.</p>\r\n<p>Не забудьте сохранить изменения.</p>\r\n<p>К сожалению в этом редакторе не поддерживается правка записей. Чтобы сменить ip на другой, удалите старые записи и добавьте их заново, с новым ip.</p>', 'Регистрация, домен, 2domains', 'Регистрация доменов', '2014-08-31 10:04:35', '2014-08-31 10:05:59'),
(23, 1, 15, NULL, 1, 1, 'Воспроизведение музыки в Delphi', 'music_reproduction_in_delphi', 'Иногда после длительного процесса надо как-то уведомить пользователя, что процесс завершился. Например, проиграть какую-то мелодию. Как это сделать с минимум усилий, не устанавливая полноценный проигрыватель?', '<p>В Delphi есть Beep (звук системного динамика), но его конечно мало, да и звучит не важно (каждый раз вздрагиваю).</p>\r\n<p>Поэтому будем использовать API функцию PlaySound.</p>\r\n<p>Подключаем в раздел uses библиотеку mmsystem.</p>\r\n<p>Вызываем асинхронное (чтобы программа не блокировалась) воспроизведение музыки:</p>\r\n<pre class="brush: php; toolbar: true;">    PlaySound(PChar(''music.wav''),0,SND_FILENAME+SND_ASYNC );\r\n</pre>\r\n<p>Проблема этой функции &ndash; что она может воспроизвести только wav. Говорят, что для прямого воспроизведения mp3 надо использовать библиотеку bass. Но мне было влом её подключать (вот если бы допустим нужно было сделать плеер &ndash; то да, но тогда уж проще воспользоваться компонентом). Решил просто переконвертировать mp3 в wav&hellip; Скачал AudioEdit Deluxe, открыл файл music.mp3 и сохранил его как ''music.wav''. Особенность &ndash; в настройках при сохранении надо указать режим Моно. Если сохранить как Стерео &ndash; то Delphi не может воспроизвести файл&hellip;.</p>', 'Delphi, mp3, AudioEdit Deluxe', 'Воспроизведение музыки в Delphi', '2014-09-03 08:01:32', NULL),
(24, 1, 1, NULL, 1, 1, 'RBAC в Yii2', 'rbac-in-yii2', 'Наконец-то я вернулся к любимому Yii. И сразу пришлось обкатывать вторую версию. О новшествах и отличиях расскажу в другой раз. Цель этой статьи – познакомится с организацией доступа по ролям пользователей в Yii2 (RBAC).', '<p>Роли пользователей будем хранить в базе данных. Для реализации задачи возьмем стандартный модуль rbac, поставляемый по молчанию в Yii2.</p>\r\n<h3>Установка</h3>\r\n<p>Сначала настроим конфиг. В компонентах пропишем</p>\r\n<pre class="brush: php; toolbar: true;">    ''components'' =&gt; [\r\n        ''authManager'' =&gt; [\r\n            ''class'' =&gt; ''yii\\rbac\\DbManager'',\r\n            ''defaultRoles'' =&gt; [\r\n                ''user'',\r\n                ''moderator'',\r\n                ''admin'',\r\n                ''superadmin''\r\n            ],\r\n        ],\r\n        ''user'' =&gt; [\r\n            ''identityClass'' =&gt; ''app\\models\\User'',\r\n            ''enableAutoLogin'' =&gt; true,\r\n        ],\r\n&hellip;\r\n]\r\n</pre>\r\n<p>У нас есть четыре роли. В модели User добавляем строковое поле role.</p>\r\n<p>Создаем таблицы правил ролей. Можно через миграции, но я сразу выполнил импорт в базу данных файла</p>\r\n<pre class="brush: php; toolbar: true;">\\vendor\\yiisoft\\yii2\\rbac\\migrations\\schema-mysql.sql\r\n</pre>\r\n<p>Пишем класс правила для ролей:</p>\r\n<pre class="brush: php; toolbar: true;">namespace app\\components\\rbac;\r\n\r\nuse Yii;\r\nuse yii\\rbac\\Rule;\r\n\r\n/**\r\n * User group rule class.\r\n */\r\nclass GroupRule extends Rule\r\n{\r\n    /**\r\n     * @inheritdoc\r\n     */\r\n    public $name = ''group'';\r\n\r\n    /**\r\n     * @inheritdoc\r\n     */\r\n    public function execute($user, $item, $params)\r\n    {\r\n        if (!Yii::$app-&gt;user-&gt;isGuest) {\r\n            $role = Yii::$app-&gt;user-&gt;identity-&gt;role;\r\n\r\n            if ($item-&gt;name === ''superadmin'') {\r\n                return $role === $item-&gt;name;\r\n            } elseif ($item-&gt;name === ''admin'') {\r\n                return $role === $item-&gt;name || $role === ''superadmin'';\r\n            } elseif ($item-&gt;name === ''moderator '') {\r\n                return $role === $item-&gt;name || $role === ''superadmin'' || $role === ''admin'';\r\n            } elseif ($item-&gt;name === ''user'') {\r\n                return $role === $item-&gt;name || $role === ''superadmin'' || $role === ''admin'' || $role === ''moderator'';\r\n            }\r\n        }\r\n        return false;\r\n    }\r\n} \r\n</pre>\r\n<p>Пишем класс консольной команды для занесения ролей в базу данных</p>\r\n<pre class="brush: php; toolbar: true;">namespace app\\commands;\r\n\r\nuse Yii;\r\nuse yii\\console\\Controller;\r\nuse app\\components\\rbac\\GroupRule;\r\nuse yii\\rbac\\DbManager;\r\n\r\n/**\r\n * RBAC console controller.\r\n */\r\nclass RbacController extends Controller\r\n{\r\n    /**\r\n     * Initial RBAC action\r\n     * @param integer $id Superadmin ID\r\n     */\r\n    public function actionInit($id = null)\r\n    {\r\n        $auth = new DbManager;\r\n        $auth-&gt;init();\r\n\r\n        $auth-&gt;removeAll(); //удаляем старые данные\r\n        // Rules\r\n        $groupRule = new GroupRule();\r\n\r\n        $auth-&gt;add($groupRule);\r\n\r\n        // Roles\r\n        $user = $auth-&gt;createRole(''user'');\r\n        $user-&gt;description = ''User'';\r\n        $user-&gt;ruleName = $groupRule-&gt;name;\r\n        $auth-&gt;add($user);\r\n\r\n        $moderator = $auth-&gt;createRole('' moderator '');\r\n        $moderator -&gt;description = ''Moderator '';\r\n        $moderator -&gt;ruleName = $groupRule-&gt;name;\r\n        $auth-&gt;add($moderator);\r\n        $auth-&gt;addChild($moderator, $user);\r\n\r\n        $admin = $auth-&gt;createRole(''admin'');\r\n        $admin-&gt;description = ''Admin'';\r\n        $admin-&gt;ruleName = $groupRule-&gt;name;\r\n        $auth-&gt;add($admin);\r\n        $auth-&gt;addChild($admin, $moderator);\r\n\r\n        $superadmin = $auth-&gt;createRole(''superadmin'');\r\n        $superadmin-&gt;description = ''Superadmin'';\r\n        $superadmin-&gt;ruleName = $groupRule-&gt;name;\r\n        $auth-&gt;add($superadmin);\r\n        $auth-&gt;addChild($superadmin, $admin);\r\n\r\n        // Superadmin assignments\r\n        if ($id !== null) {\r\n            $auth-&gt;assign($superadmin, $id);\r\n        }\r\n    }\r\n}\r\n</pre>\r\n<p>Выполняем команду</p>\r\n<pre class="brush: php; toolbar: true;">php yii rbac/init\r\n</pre>\r\n<p>Если хотим просто добавить роли или</p>\r\n<pre class="brush: php; toolbar: true;">php yii rbac/init 1\r\n</pre>\r\n<p>- если хотим привязать роль супердамина пользователю с id=1 И наконец в модели пользователей, после добавления или обновления присваиваем роль:</p>\r\n<pre class="brush: php; toolbar: true;">   public function afterSave($insert, $changedAttributes)\r\n    {\r\n        parent::afterSave($insert, $changedAttributes);\r\n        // установка роли пользователя\r\n        $auth = Yii::$app-&gt;authManager;\r\n        $name = $this-&gt;role ? $this-&gt;role : self::ROLE_USER;\r\n        $role = $auth-&gt;getRole($name);\r\n        if (!$insert) {\r\n            $auth-&gt;revokeAll($this-&gt;id);\r\n        }\r\n        $auth-&gt;assign($role, $this-&gt;id);\r\n    }\r\n</pre>\r\n<h3>Использование</h3>\r\n<p>В контролере пишем</p>\r\n<pre class="brush: php; toolbar: true;">    public function behaviors()\r\n    {\r\n        return [\r\n            ''access'' =&gt; [\r\n                ''class'' =&gt; AccessControl::className(),\r\n                ''rules'' =&gt; [\r\n                    [\r\n                        ''allow'' =&gt; true,\r\n                        ''actions''=&gt;[''index'',''view''],\r\n                        ''roles'' =&gt; [''@''],\r\n                    ],\r\n                    [\r\n                        ''allow'' =&gt; true,\r\n                        ''roles'' =&gt; [''admin''],\r\n                    ],\r\n                ],\r\n            ],\r\n    ];\r\n}\r\n</pre>\r\n<p>Мы разрешили просматривать всем зарегистрированным пользователям ''index'' и ''view'', остальные экшены доступны только админам. <br /> В любом месте приложения можно вызывать</p>\r\n<pre class="brush: php; toolbar: true;">If (Yii::$app-&gt;user-&gt;can(''admin'')) { &hellip; }\r\n</pre>\r\n<p>Для проверки роли пользователя.<br /> На этом все.</p>', 'yii2, rbac', 'Yii2 настройка rbac', '2014-12-06 13:04:43', '2014-12-08 18:48:15'),
(25, 1, 1, NULL, 1, 1, 'Yii2 справочник команд', 'yii2-reference-commands', 'Тут собрал наиболее  часто используемые команды для yii2', '<h3>Композер</h3>\r\n<p>Для линукс используем</p>\r\n<pre class="brush: php; toolbar: true;">  php composer.phar \r\n</pre>\r\n<p>Установка</p>\r\n<pre class="brush: php; toolbar: true;">  curl -s http://getcomposer.org/installer | php\r\n</pre>\r\n<p>Для винды &ndash; просто composer. Установочный файл тут: https://getcomposer.org/Composer-Setup.exe. Не забываем добавлять в PATH</p>\r\n<p>Здесь и далее команды для винды.</p>\r\n<p>Включить и установить новый пакет с использованием кэша</p>\r\n<pre class="brush: php; toolbar: true;">composer require cinghie/yii2-tcpdf "dev-master" --prefer-dist\r\n</pre>\r\n<p>Установить все новые пакеты с кешем</p>\r\n<pre class="brush: php; toolbar: true;">composer install --prefer-dist\r\n</pre>\r\n<h3>Миграции</h3>\r\n<p>Создание новой миграции <code class="php plain">migrate_name</code>:</p>\r\n<pre class="brush: php; toolbar: true;">php yii migrate/create migrate_name\r\n</pre>\r\n<p>Применить все миграции:</p>\r\n<pre class="brush: php; toolbar: true;">php yii migrate\r\n</pre>\r\n<h3>Тонкости установки</h3>\r\n<p>Для suPhp меняем владельца c рута на пользователя user1 так:</p>\r\n<pre class="brush: php; toolbar: true;">  chown -R user1:nobody public_html\r\n</pre>\r\n<p>Т.е. обязательно используем группу <strong>nobody</strong> иначе будет error 403 (в логе: htaccess pcfg_openfile: unable to check htaccess file, ensure it is readable)</p>\r\n<p>Если нет возможности сменить корень сайта на web - то можно поступить так. Создаем рядом с корневой папкой (к примеру public_html) папку приложения yii(например app). Разворачиваем там приложение, а затем удаляем public_html и делаем символическую ссылку:</p>\r\n<pre class="brush: php; toolbar: true;">  ln -s /home/site.ru/app/web public_html\r\n</pre>', 'yii2, команды', 'Yii2 справочник команд', '2014-12-08 18:47:30', '2015-02-10 08:00:29');

-- --------------------------------------------------------

--
-- Структура таблицы `blog_articles_tags_relations`
--

DROP TABLE IF EXISTS `blog_articles_tags_relations`;
CREATE TABLE IF NOT EXISTS `blog_articles_tags_relations` (
  `article_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`article_id`,`tag_id`),
  KEY `IDX_512A6F437294869C` (`article_id`),
  KEY `IDX_512A6F43BAD26311` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `blog_articles_tags_relations`
--

INSERT INTO `blog_articles_tags_relations` (`article_id`, `tag_id`) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(2, 4),
(3, 2),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(6, 7),
(6, 10),
(7, 7),
(8, 11),
(8, 12),
(9, 8),
(9, 13),
(10, 14),
(10, 15),
(11, 2),
(11, 4),
(11, 16),
(12, 17),
(12, 18),
(13, 19),
(13, 20),
(14, 21),
(14, 22),
(14, 23),
(15, 6),
(15, 7),
(15, 24),
(16, 25),
(17, 7),
(17, 26),
(18, 7),
(20, 27),
(21, 28),
(21, 29),
(22, 30),
(23, 29),
(24, 2),
(24, 31),
(25, 2),
(25, 31);

-- --------------------------------------------------------

--
-- Структура таблицы `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
CREATE TABLE IF NOT EXISTS `blog_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(10) unsigned DEFAULT NULL,
  `slug` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_DC356481989D9B62` (`slug`),
  KEY `IDX_DC3564813D8E604F` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Дамп данных таблицы `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `parent`, `slug`, `title`, `created_at`) VALUES
(1, 2, 'yii', 'Yii', '2014-02-10 07:02:14'),
(2, 3, 'php', 'PHP', '2014-02-10 07:02:14'),
(3, NULL, 'programing', 'Программирование', '2014-02-10 07:02:14'),
(4, 2, 'symfony2', 'Symfony2', '2014-02-10 07:02:14'),
(5, 3, 'js', 'JavaScript', '2014-02-10 07:02:14'),
(6, 7, 'debian', 'Debian', '2014-02-10 07:02:14'),
(7, NULL, 'system_administration', 'Системное администрирование', '2014-02-10 07:02:14'),
(8, 9, 'css', 'CSS', '2014-02-10 07:02:14'),
(9, NULL, 'imposition', 'Верстка', '2014-02-10 07:02:14'),
(10, 8, 'twitter_bootstrap', 'Twitter Bootstrap', '2014-02-10 07:02:14'),
(11, 3, 'cpp', 'C++', '2014-02-10 07:02:14'),
(12, NULL, 'soft', 'Программы (софт)', '2014-02-10 07:02:14'),
(13, NULL, 'other', 'Другое', '2014-02-10 07:02:14'),
(14, 7, 'ssh', 'SSH', '2014-02-10 07:02:14'),
(15, 3, 'delphi', 'Delphi', '2014-08-26 09:27:05');

-- --------------------------------------------------------

--
-- Структура таблицы `blog_tags`
--

DROP TABLE IF EXISTS `blog_tags`;
CREATE TABLE IF NOT EXISTS `blog_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8F6C18B6989D9B62` (`slug`),
  UNIQUE KEY `UNIQ_8F6C18B62B36786B` (`title`),
  KEY `IDX_8F6C18B67CD5541` (`weight`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=32 ;

--
-- Дамп данных таблицы `blog_tags`
--

INSERT INTO `blog_tags` (`id`, `slug`, `title`, `created_at`, `weight`) VALUES
(1, 'breadcrumbs', 'Breadcrumbs', '2014-02-10 07:02:14', 0),
(2, 'yii', 'Yii', '2014-02-10 07:02:14', 0),
(3, 'ckeditor', 'Ckeditor', '2014-02-10 07:02:14', 0),
(4, 'connect', 'Подключение', '2014-02-10 07:02:14', 0),
(5, 'formatting', 'Форматирование', '2014-02-10 07:02:14', 0),
(6, 'date_and_time', 'Дата и время', '2014-02-10 07:02:14', 0),
(7, 'symfony2', 'Symfony2', '2014-02-10 07:02:14', 0),
(8, 'commands', 'Консольные команды', '2014-02-10 07:02:14', 0),
(9, 'code_illumination', 'Подсветка кода', '2014-02-10 07:02:14', 0),
(10, 'phpstorm', 'phpStorm', '2014-02-10 07:02:14', 0),
(11, 'php', 'PHP', '2014-02-10 07:02:14', 0),
(12, 'memcached', 'Memcached', '2014-02-10 07:02:14', 0),
(13, 'debian', 'Debian', '2014-02-10 07:02:14', 0),
(14, 'css', 'CSS', '2014-02-10 07:02:14', 0),
(15, 'linear_gradient', 'Линейный градиент', '2014-02-10 07:02:14', 0),
(16, 'twitter_bootstrap', 'Twitter Bootstrap', '2014-02-10 07:02:14', 0),
(17, 'forms', 'Формы', '2014-02-10 07:02:14', 0),
(18, 'visual_sStudio_2012_cpp', 'Visual Studio 2012 C++', '2014-02-10 07:02:14', 0),
(19, 'editor', 'Редактор', '2014-02-10 07:02:14', 0),
(20, 'encoding', 'Кодировка', '2014-02-10 07:02:14', 0),
(21, 'framework', 'Фреймворк', '2014-02-10 07:02:14', 0),
(22, 'cms', 'CMS', '2014-02-10 07:02:14', 0),
(23, 'select', 'Выбор', '2014-02-10 07:02:14', 0),
(24, 'twig', 'Twig', '2014-02-10 07:02:14', 0),
(25, 'ssh', 'SSH', '2014-02-10 07:02:14', 0),
(26, 'translations', 'Переводы', '2014-07-02 12:05:11', 0),
(27, 'skype', 'Скайп', '2014-07-24 12:05:38', 0),
(28, 'chromium', 'Chromium', '2014-08-26 09:26:07', 0),
(29, 'delphi', 'Delphi', '2014-08-26 09:26:21', 0),
(30, 'domains', 'домен', '2014-08-31 10:04:56', 0),
(31, 'yii2', 'Yii2', '2014-12-08 18:47:50', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `elfinder_file`
--

DROP TABLE IF EXISTS `elfinder_file`;
CREATE TABLE IF NOT EXISTS `elfinder_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longblob NOT NULL,
  `size` int(11) NOT NULL,
  `mtime` int(11) NOT NULL,
  `mime` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `read` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `write` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locked` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hidden` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parent_name` (`parent_id`,`name`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `elfinder_file`
--


-- --------------------------------------------------------

--
-- Структура таблицы `engine_appearance_history`
--

DROP TABLE IF EXISTS `engine_appearance_history`;
CREATE TABLE IF NOT EXISTS `engine_appearance_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9078E776D1B862B8` (`hash`),
  KEY `IDX_9078E776B548B0F` (`path`),
  KEY `IDX_9078E7763C0BE965` (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `engine_appearance_history`
--


-- --------------------------------------------------------

--
-- Структура таблицы `engine_folders`
--

DROP TABLE IF EXISTS `engine_folders`;
CREATE TABLE IF NOT EXISTS `engine_folders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `folder_pid` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_file` tinyint(1) NOT NULL,
  `position` smallint(6) DEFAULT '0',
  `uri_part` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `meta` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `redirect_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `router_node_id` int(11) DEFAULT NULL,
  `permissions` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `lockout_nodes` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `template_inheritable` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_self` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6C047E64A640A07B79628CD` (`folder_pid`,`uri_part`),
  KEY `IDX_6C047E64A640A07B` (`folder_pid`),
  KEY `IDX_6C047E641B5771DD` (`is_active`),
  KEY `IDX_6C047E64FD07C8FB` (`is_deleted`),
  KEY `IDX_6C047E64462CE4F5` (`position`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `engine_folders`
--

INSERT INTO `engine_folders` (`id`, `folder_pid`, `title`, `is_file`, `position`, `uri_part`, `is_active`, `is_deleted`, `description`, `meta`, `redirect_to`, `router_node_id`, `permissions`, `lockout_nodes`, `template_inheritable`, `template_self`, `user_id`, `created_at`, `deleted_at`) VALUES
(1, NULL, 'Главная', 0, 0, NULL, 1, 0, 'Корневая папка', 'N;', NULL, NULL, 'N;', 'N;', NULL, NULL, 1, '2014-02-10 07:02:14', NULL),
(2, 1, 'Blog', 0, 0, 'blog', 1, 0, 'Папка блога', 'N;', NULL, 3, 'N;', 'N;', NULL, NULL, 0, '2014-02-10 07:02:14', NULL),
(3, 1, 'News', 0, 0, 'news', 1, 0, 'Папка новостей', 'N;', NULL, 7, 'N;', 'N;', NULL, NULL, 0, '2014-02-10 07:02:14', NULL),
(4, 1, 'About Us', 0, 0, 'about', 1, 0, 'О сайте', 'N;', NULL, NULL, 'N;', 'N;', NULL, NULL, 0, '2014-02-10 07:02:14', NULL),
(5, 1, 'Feedback', 0, 0, 'feedback', 1, 0, 'О сайте', 'N;', NULL, NULL, 'N;', 'N;', NULL, NULL, 0, '2014-02-10 07:02:14', NULL),
(6, 1, 'User', 0, 0, 'user', 1, 0, 'Аккаунт пользователя', 'N;', NULL, NULL, 'N;', 'N;', NULL, NULL, 0, '2014-02-10 07:02:14', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `engine_modules`
--

DROP TABLE IF EXISTS `engine_modules`;
CREATE TABLE IF NOT EXISTS `engine_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_BC84EEBC46C53D4C` (`is_enabled`),
  KEY `IDX_BC84EEBC8B8E8428` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `engine_modules`
--


-- --------------------------------------------------------

--
-- Структура таблицы `engine_nodes`
--

DROP TABLE IF EXISTS `engine_nodes`;
CREATE TABLE IF NOT EXISTS `engine_nodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `folder_id` int(10) unsigned DEFAULT NULL,
  `region_id` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `template` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` smallint(6) DEFAULT '0',
  `priority` smallint(6) NOT NULL,
  `is_cached` tinyint(1) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `controls_in_toolbar` smallint(6) NOT NULL,
  `is_use_eip` tinyint(1) NOT NULL DEFAULT '1',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3055D1B7162CB942` (`folder_id`),
  KEY `IDX_3055D1B71B5771DD` (`is_active`),
  KEY `IDX_3055D1B7FD07C8FB` (`is_deleted`),
  KEY `IDX_3055D1B7462CE4F5` (`position`),
  KEY `IDX_3055D1B798260155` (`region_id`),
  KEY `IDX_3055D1B7C242628` (`module`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `engine_nodes`
--

INSERT INTO `engine_nodes` (`id`, `folder_id`, `region_id`, `is_active`, `module`, `params`, `template`, `position`, `priority`, `is_cached`, `description`, `user_id`, `created_at`, `controls_in_toolbar`, `is_use_eip`, `is_deleted`, `deleted_at`) VALUES
(1, 1, 2, 1, 'Menu', 'a:6:{s:5:"depth";N;s:8:"group_id";i:1;s:9:"css_class";s:13:"nav main_menu";s:20:"selected_inheritance";b:0;s:13:"current_class";N;s:7:"menu_id";i:1;}', NULL, 0, 0, 0, 'Главное меню', 0, '2014-02-10 07:02:14', 0, 1, 0, NULL),
(2, 1, 4, 1, 'Breadcrumbs', 'a:2:{s:9:"delimiter";s:2:"»";s:17:"hide_if_only_home";b:1;}', NULL, 0, 0, 0, 'Хлебные крошки', 0, '2014-02-10 07:02:14', 0, 1, 0, NULL),
(3, 2, 1, 1, 'Blog', 'a:0:{}', NULL, 0, 0, 0, 'Блог', 0, '2014-02-10 07:02:14', 0, 1, 0, NULL),
(4, 1, 3, 1, 'Widget', 'a:4:{s:7:"node_id";i:3;s:10:"controller";s:23:"BlogWidget:categoryTree";s:8:"open_tag";s:197:"\n                <div class="portlet-decoration">\n                    <div class="portlet-title">Рубрики блога</div>\n                </div>\n                <div class="portlet-content">";s:9:"close_tag";s:6:"</div>";}', NULL, 0, 0, 0, 'Категории блога', 0, '2014-02-10 07:02:14', 0, 1, 0, NULL),
(5, 1, 3, 1, 'Widget', 'a:4:{s:7:"node_id";i:3;s:10:"controller";s:25:"BlogWidget:archiveMonthly";s:8:"open_tag";s:195:"\n                <div class="portlet-decoration">\n                    <div class="portlet-title">Архив статей</div>\n                </div>\n                <div class="portlet-content">";s:9:"close_tag";s:6:"</div>";}', NULL, 0, 0, 0, 'Архив блога', 0, '2014-02-10 07:02:14', 0, 1, 0, NULL),
(6, 1, 3, 1, 'Widget', 'a:4:{s:7:"node_id";i:3;s:10:"controller";s:19:"BlogWidget:tagCloud";s:8:"open_tag";s:191:"\n                <div class="portlet-decoration">\n                    <div class="portlet-title">Тэги блога</div>\n                </div>\n                <div class="portlet-content">";s:9:"close_tag";s:6:"</div>";}', NULL, 0, 0, 0, 'Облако тегов', 0, '2014-02-10 07:02:14', 0, 1, 0, NULL),
(7, 3, 1, 1, 'SimpleNews', 'a:1:{s:14:"items_per_page";i:10;}', NULL, 0, 0, 0, 'Новости', 0, '2014-02-10 07:02:14', 1, 1, 0, NULL),
(8, 4, 1, 1, 'Texter', 'a:2:{s:12:"text_item_id";i:1;s:6:"editor";b:1;}', NULL, 0, 0, 0, 'О сайте', 0, '2014-02-10 07:02:14', 0, 1, 0, NULL),
(9, 5, 1, 1, 'Feedback', 'a:0:{}', NULL, 0, 0, 0, 'Обратная связь', 0, '2014-02-10 07:02:14', 0, 1, 0, NULL),
(10, 1, 1, 1, 'Widget', 'a:3:{s:7:"node_id";i:3;s:10:"controller";s:15:"BlogWidget:main";s:8:"open_tag";s:546:"\n                    <h1>Добро пожаловать!</h1>\n                    <p>Меня зовут Дмитрий. Я веб-программист, занимаюсь созданием сайтов.\n                    На этом блоге находятся мои заметки по программированию. Многие идеи\n                    взяты у других авторов, часть текста - первод с английского, что-то придумал сам).\n                    </p>";}', NULL, 0, 0, 0, 'Главная страница', 0, '2014-02-10 07:02:14', 0, 1, 0, NULL),
(11, 6, 1, 1, 'User', 'a:2:{s:18:"allow_registration";b:1;s:24:"allow_password_resetting";b:1;}', NULL, 0, 0, 0, 'Аккаунт', 0, '2014-02-10 07:02:14', 0, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `engine_regions`
--

DROP TABLE IF EXISTS `engine_regions`;
CREATE TABLE IF NOT EXISTS `engine_regions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` smallint(6) DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3054D4985E237E06` (`name`),
  KEY `IDX_3054D498462CE4F5` (`position`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `engine_regions`
--

INSERT INTO `engine_regions` (`id`, `position`, `name`, `description`, `user_id`, `created_at`) VALUES
(1, 0, 'content', 'Рабочая область', 0, '2014-02-10 07:02:14'),
(2, 1, 'main_menu', 'Главное меню', 0, '2014-02-10 07:02:14'),
(3, 2, 'left_sidebar', 'Левый сайдбар', 0, '2014-02-10 07:02:14'),
(4, 3, 'breadcrumbs', 'Хлебные крошки', 0, '2014-02-10 07:02:14'),
(5, 4, 'footer', 'Подвал', 0, '2014-02-10 07:02:14');

-- --------------------------------------------------------

--
-- Структура таблицы `engine_regions_inherit`
--

DROP TABLE IF EXISTS `engine_regions_inherit`;
CREATE TABLE IF NOT EXISTS `engine_regions_inherit` (
  `region_id` int(10) unsigned NOT NULL,
  `folder_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`region_id`,`folder_id`),
  KEY `IDX_41BBC12298260155` (`region_id`),
  KEY `IDX_41BBC122162CB942` (`folder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `engine_regions_inherit`
--

INSERT INTO `engine_regions_inherit` (`region_id`, `folder_id`) VALUES
(2, 1),
(3, 1),
(4, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `engine_roles`
--

DROP TABLE IF EXISTS `engine_roles`;
CREATE TABLE IF NOT EXISTS `engine_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `position` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9B56FA8C5E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `engine_roles`
--


-- --------------------------------------------------------

--
-- Структура таблицы `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
CREATE TABLE IF NOT EXISTS `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `feedbacks`
--

INSERT INTO `feedbacks` (`id`, `title`, `email`, `text`, `created`) VALUES
(1, 'Предложение работы', 'admin@gbip.ru', 'Добрый день.\r\n\r\nЕсть проект на Yii к нему нужно сделать дополнительный блок. ТЗ по блоку можно скачать по ссылке: https://yadi.sk/i/zNUttcb1VrKa8\r\nПрошу оценить сроки и стоимость доработки.', '2014-07-07 12:40:36'),
(2, 'Проверка', 'dmitfid@rambler.ru', 'Проверка', '2014-08-26 09:15:43'),
(3, 'Вопрос', 'tempo-13@yandex.ru', 'Здравствуйте, Дмитрий!\r\nВы мне не подскажете как работать с компонентом TChromeTabs? Как добавлять вкладку, удалять... вобщем как полностью связать TChromium и TChromeTabs', '2015-03-30 11:38:26'),
(4, 'rbac', 'krusnik13@mail.ru', 'Здравствуйте, Помогите пожалуйста. делаю вроде всё как у вас в уроке описанно но на деле получаю:\r\nh:\\OpenServer\\domains\\allbus.loc>yii rbac/init\r\nException ''yii\\base\\UnknownClassException'' with message ''Unable to find ''console\\controllers\\RbacController'' in file: H:\\OpenServer\\domains\\allbus.loc/console/controllers/RbacController.php. Namespace missing?''\r\n\r\nin H:\\OpenServer\\domains\\allbus.loc\\vendor\\yiisoft\\yii2\\BaseYii.php:291\r\n\r\nStack trace:\r\n#0 [internal function]: yii\\BaseYii::autoload(''console\\\\control...'')\r\n#1 [internal function]: spl_autoload_call(''console\\\\control...'')\r\n#2 H:\\OpenServer\\domains\\allbus.loc\\vendor\\yiisoft\\yii2\\base\\Module.php(563): class_exists(''console\\\\control...'')\r\n#3 H:\\OpenServer\\domains\\allbus.loc\\vendor\\yiisoft\\yii2\\base\\Module.php(521): yii\\base\\Module->createControllerByID(''rbac'')\r\n#4 H:\\OpenServer\\domains\\allbus.loc\\vendor\\yiisoft\\yii2\\base\\Module.php(449): yii\\base\\Module->createController(''rbac/init'')\r\n#5 H:\\OpenServer\\domains\\allbus.loc\\vendor\\yiisoft\\yii2\\console\\Application.php(161): yii\\base\\Module->runAction(''rbac/init'', Array)\r\n#6 H:\\OpenServer\\domains\\allbus.loc\\vendor\\yiisoft\\yii2\\console\\Application.php(137): yii\\console\\Application->runAction(''rbac/init'', Array)\r\n#7 H:\\OpenServer\\domains\\allbus.loc\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\console\\Application->handleRequest(Object(yii\\console\\Request))\r\n#8 H:\\OpenServer\\domains\\allbus.loc\\yii(31): yii\\base\\Application->run()\r\n#9 {main}\r\n\r\nШаблон Advanced', '2015-05-04 09:34:24');

-- --------------------------------------------------------

--
-- Структура таблицы `galleries`
--

DROP TABLE IF EXISTS `galleries`;
CREATE TABLE IF NOT EXISTS `galleries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `media_collection_id` int(10) unsigned NOT NULL,
  `order_albums_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F70E6EB7B52E685C` (`media_collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `galleries`
--


-- --------------------------------------------------------

--
-- Структура таблицы `gallery_albums`
--

DROP TABLE IF EXISTS `gallery_albums`;
CREATE TABLE IF NOT EXISTS `gallery_albums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` int(10) unsigned DEFAULT NULL,
  `cover_image_id` int(11) DEFAULT NULL,
  `last_image_id` int(11) DEFAULT NULL,
  `photos_count` int(11) NOT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `position` smallint(6) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5661ABED4E7AF8F` (`gallery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `gallery_albums`
--


-- --------------------------------------------------------

--
-- Структура таблицы `gallery_photos`
--

DROP TABLE IF EXISTS `gallery_photos`;
CREATE TABLE IF NOT EXISTS `gallery_photos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` int(10) unsigned DEFAULT NULL,
  `image_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `position` smallint(6) DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AAF50C7B1137ABCF` (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `gallery_photos`
--


-- --------------------------------------------------------

--
-- Структура таблицы `media_categories`
--

DROP TABLE IF EXISTS `media_categories`;
CREATE TABLE IF NOT EXISTS `media_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `slug` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_30D688FC727ACA70` (`parent_id`),
  KEY `IDX_30D688FC989D9B62` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `media_categories`
--


-- --------------------------------------------------------

--
-- Структура таблицы `media_collections`
--

DROP TABLE IF EXISTS `media_collections`;
CREATE TABLE IF NOT EXISTS `media_collections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `default_storage_id` int(10) unsigned NOT NULL,
  `default_filter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `relative_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_relative_path_pattern` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename_pattern` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_244DA17D14E68FF3` (`default_storage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `media_collections`
--


-- --------------------------------------------------------

--
-- Структура таблицы `media_files`
--

DROP TABLE IF EXISTS `media_files`;
CREATE TABLE IF NOT EXISTS `media_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `collection_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `storage_id` int(10) unsigned NOT NULL,
  `is_preuploaded` tinyint(1) NOT NULL,
  `relative_path` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `original_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `mime_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `original_size` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_192C84E8514956FD` (`collection_id`),
  KEY `IDX_192C84E812469DE2` (`category_id`),
  KEY `IDX_192C84E85CC5DB90` (`storage_id`),
  KEY `IDX_192C84E88CDE5729` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `media_files`
--


-- --------------------------------------------------------

--
-- Структура таблицы `media_files_transformed`
--

DROP TABLE IF EXISTS `media_files_transformed`;
CREATE TABLE IF NOT EXISTS `media_files_transformed` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned NOT NULL,
  `collection_id` int(10) unsigned NOT NULL,
  `storage_id` int(10) unsigned NOT NULL,
  `filter` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1084B87D7FC45F1D93CB796C` (`filter`,`file_id`),
  KEY `IDX_1084B87D93CB796C` (`file_id`),
  KEY `IDX_1084B87D514956FD` (`collection_id`),
  KEY `IDX_1084B87D5CC5DB90` (`storage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `media_files_transformed`
--


-- --------------------------------------------------------

--
-- Структура таблицы `media_storages`
--

DROP TABLE IF EXISTS `media_storages`;
CREATE TABLE IF NOT EXISTS `media_storages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `relative_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `media_storages`
--


-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

DROP TABLE IF EXISTS `menus`;
CREATE TABLE IF NOT EXISTS `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` smallint(6) DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `properties` longtext COLLATE utf8_unicode_ci,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_727508CF5E237E06` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `position`, `name`, `description`, `properties`, `user_id`, `created_at`) VALUES
(1, 0, 'Главное меню', NULL, NULL, 1, '2014-02-10 07:02:14');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned DEFAULT NULL,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `folder_id` int(10) unsigned DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `position` smallint(6) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `properties` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `user_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `open_in_new_window` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `IDX_70B2CA2A5550C4ED` (`pid`),
  KEY `IDX_70B2CA2ACCD7E912` (`menu_id`),
  KEY `IDX_70B2CA2A162CB942` (`folder_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `pid`, `menu_id`, `folder_id`, `is_active`, `position`, `title`, `description`, `url`, `properties`, `user_id`, `created_at`, `updated_at`, `open_in_new_window`) VALUES
(1, NULL, 1, 1, 1, 0, 'Главная', NULL, NULL, 'N;', 1, '2014-02-10 07:02:14', NULL, 0),
(2, NULL, 1, 4, 1, 0, 'О сайте', NULL, NULL, 'N;', 1, '2014-02-10 07:02:14', NULL, 0),
(3, NULL, 1, 5, 1, 0, 'Контакты', NULL, NULL, 'N;', 1, '2014-02-10 07:02:14', NULL, 0),
(4, NULL, 1, 2, 1, 0, 'Блог', NULL, NULL, 'N;', 1, '2014-02-10 07:02:14', NULL, 0),
(5, NULL, 1, 3, 1, 0, 'Новости', NULL, NULL, 'N;', 1, '2014-02-10 07:02:14', NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `data` longblob NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `session`
--

INSERT INTO `session` (`id`, `user_id`, `data`, `time`) VALUES
('j2nt06m5pc8d2re8g67pji1js3', 2, 0x5f7366325f617474726962757465737c613a323a7b733a32353a225f637372662f736d6172745f636f72655f73657474696e6773223b733a34333a22374378727350495a523349716a6b4f642d5946424861695843422d33317054316d53304d51676358536d38223b733a32343a225f73656375726974795f736d6172745f636f72655f636d73223b733a3731393a22433a36383a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c41757468656e7469636174696f6e5c546f6b656e5c52656d656d6265724d65546f6b656e223a3633373a7b613a333a7b693a303b733a31373a227361726730343874307364686673646667223b693a313b733a353a2261646d696e223b693a323b733a3537333a22613a343a7b693a303b433a33383a22536d617274436f72655c42756e646c655c434d5342756e646c655c456e746974795c55736572223a3231393a7b613a393a7b693a303b733a38383a227133347942553246682b754f4c6a38742b7359754d52333632486e624862696d33704e693833462b4b692f53696741464f5150594f7453677669714338794c796d6735573664464c4d6b745a2f4b636e4241715677673d3d223b693a313b733a33313a22636d776d787061723833776f386b6b346b306b676f6b38676f7363676f6363223b693a323b733a343a22726f6f74223b693a333b733a343a22726f6f74223b693a343b623a303b693a353b623a303b693a363b623a303b693a373b623a313b693a383b693a323b7d7d693a313b623a313b693a323b613a323a7b693a303b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a31363a22524f4c455f53555045525f41444d494e223b7d693a313b4f3a34313a2253796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c65223a313a7b733a34373a220053796d666f6e795c436f6d706f6e656e745c53656375726974795c436f72655c526f6c655c526f6c6500726f6c65223b733a393a22524f4c455f55534552223b7d7d693a333b613a303a7b7d7d223b7d7d223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a333a7b733a313a2275223b693a313433363339303238353b733a313a2263223b693a313433363339303238353b733a313a226c223b733a313a2230223b7d, '2015-07-09 03:18:05');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bundle` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E545A0C5A57B32FD5E237E06` (`bundle`,`name`),
  KEY `IDX_E545A0C5A57B32FD` (`bundle`),
  KEY `IDX_E545A0C55E237E06` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `bundle`, `name`, `value`, `serialized`) VALUES
(1, 'cms', 'site_full_name', 'Dmitry Xe''s Personal Site', 0),
(2, 'cms', 'site_short_name', 'dmitxe.ru', 0),
(3, 'cms', 'html_title_delimiter', '&ndash;', 0),
(4, 'cms', 'appearance_editor', 'ace', 0),
(5, 'cms', 'appearance_editor_theme', 'idle_fingers', 0),
(6, 'cms', 'twitter_bootstrap_version', '2', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `simple_news`
--

DROP TABLE IF EXISTS `simple_news`;
CREATE TABLE IF NOT EXISTS `simple_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `annotation` longtext COLLATE utf8_unicode_ci,
  `text` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `instance_id` int(10) unsigned DEFAULT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  `annotation_widget` longtext COLLATE utf8_unicode_ci,
  `publish_date` datetime NOT NULL,
  `end_publish_date` datetime DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B232FBE9989D9B62` (`slug`),
  KEY `IDX_B232FBE93A51721D` (`instance_id`),
  KEY `IDX_B232FBE946C53D4C` (`is_enabled`),
  KEY `IDX_B232FBE98B8E8428` (`created_at`),
  KEY `IDX_B232FBE978B553BA` (`publish_date`),
  KEY `IDX_B232FBE9B80531F1` (`end_publish_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `simple_news`
--

INSERT INTO `simple_news` (`id`, `title`, `slug`, `annotation`, `text`, `created_at`, `updated_at`, `instance_id`, `image_id`, `annotation_widget`, `publish_date`, `end_publish_date`, `is_enabled`) VALUES
(1, 'Переезд с шаред-хостинга на VPS', 'moving_from_shared-hosting_on_vps', 'Наконец-то блог переместился с шаред-хостинга на VPS.', 'Наконец-то блог переместился с шаред-хостинга на VPS. По цене получилось примерно тоже самое, но возможностей на VPS гораздо больше. И сайт шустрее работать стал.', '2014-02-10 07:02:14', '2013-09-05 09:10:55', 1, NULL, NULL, '2014-02-10 07:02:14', NULL, 1),
(2, 'Сайт перешел на фреймворк Symfony2', 'moving_on_symfony2', 'Свершилось! После месяца интенсивных работ над движком SmartCore мы смогли перевести мой блог на Symfony2.', 'Свершилось! После месяца интенсивных работ над движком SmartCore мы смогли перевести мой блог на Symfony2.\n            До этого момента блог работал на фреймворке Yii. Yii весьма неплох, но все же было принято решение осваивать Symfony2 и развивать движок SmartCore.Работа над ним и над самим сайтом продолжается. В планах создать функционал, не хуже чем на CMS Wordpress, а так же перевести магазин с CMS Joomla…', '2014-02-10 07:02:14', '2013-09-05 11:49:32', 1, NULL, NULL, '2014-02-10 07:02:14', NULL, 1),
(3, 'Обновление ядра сайта', 'site_updating', 'Сайт полностью перешел на CMS SmartCore.', 'Сайт полностью перешел на CMS SmartCore. До этого использовались отдельные бандлы из движка, теперь же сайт переписан начисто.\n            Былв отключана система комментариев от FOS, вместо них используется Disqus.', '2014-02-10 07:02:14', '2014-02-10 13:48:42', 1, NULL, NULL, '2014-02-10 13:48:42', NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `simple_news_instances`
--

DROP TABLE IF EXISTS `simple_news_instances`;
CREATE TABLE IF NOT EXISTS `simple_news_instances` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `media_collection_id` int(10) unsigned DEFAULT NULL,
  `use_image` tinyint(1) NOT NULL,
  `use_annotation_widget` tinyint(1) NOT NULL,
  `use_end_publish_date` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_98EDD0015E237E06` (`name`),
  KEY `IDX_98EDD001B52E685C` (`media_collection_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `simple_news_instances`
--

INSERT INTO `simple_news_instances` (`id`, `media_collection_id`, `use_image`, `use_annotation_widget`, `use_end_publish_date`, `created_at`, `name`) VALUES
(1, NULL, 0, 0, 0, '2014-07-06 01:02:11', 'Default news');

-- --------------------------------------------------------

--
-- Структура таблицы `sitemap_urls`
--

DROP TABLE IF EXISTS `sitemap_urls`;
CREATE TABLE IF NOT EXISTS `sitemap_urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_visited` tinyint(1) NOT NULL,
  `loc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `referer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_hash` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` longtext COLLATE utf8_unicode_ci,
  `lastmod` datetime DEFAULT NULL,
  `changefreq` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` double DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_365093828852ACDC` (`loc`),
  KEY `IDX_365093829A62B8C7` (`title_hash`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=91 ;

--
-- Дамп данных таблицы `sitemap_urls`
--

INSERT INTO `sitemap_urls` (`id`, `is_visited`, `loc`, `referer`, `title_hash`, `title`, `lastmod`, `changefreq`, `priority`, `status`) VALUES
(1, 1, '/', NULL, '84ce67700a3c720841690f77eeb4623d', 'Dmitry Xe''s Personal Site', NULL, NULL, 1, 200),
(2, 1, '/about/', '/', '53b2d8bd5199c57b591f8f4a3fe6b0b9', 'About Us – dmitxe.ru', NULL, NULL, NULL, 200),
(3, 1, '/feedback/', '/', 'f80103e050f6bf6a9f4786c76dcbe078', 'Feedback – dmitxe.ru', NULL, NULL, NULL, 200),
(4, 1, '/blog/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(5, 1, '/news/', '/', 'aa17178d04e76de6615cf144686b172f', 'News – dmitxe.ru', NULL, NULL, NULL, 200),
(6, 1, '/blog/category/programing/', '/', '402208d9e6ee879989f4edeaebb09a1c', 'Программирование – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(7, 1, '/blog/category/programing/php/', '/', '69687f1e4356b0232e8f3470827b5718', 'PHP – Программирование – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(8, 1, '/blog/category/programing/php/yii/', '/', 'a34121f55c6840cfbbf47e6646f63e2c', 'Yii – PHP – Программирование – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(9, 1, '/blog/category/programing/php/symfony2/', '/', '7cf6e8e8660f281d6a9f2fe98395ce41', 'Symfony2 – PHP – Программирование – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(10, 1, '/blog/category/programing/js/', '/', 'b6e7c07bda221a112513d46001eb8935', 'JavaScript – Программирование – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(11, 1, '/blog/category/programing/cpp/', '/', 'c127704a7604b45961bb4372c3a50d40', 'C++ – Программирование – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(12, 1, '/blog/category/programing/delphi/', '/', '5198bae33b61e86e0c7da4d0d0eed1af', 'Delphi – Программирование – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(13, 1, '/blog/category/system_administration/', '/', '7bd5c0a81c45984e2bda2d8be7a2ae8e', 'Системное администрирование – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(14, 1, '/blog/category/system_administration/debian/', '/', '37063d7ce7da763360f234e932942e6a', 'Debian – Системное администрирование – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(15, 1, '/blog/category/system_administration/ssh/', '/', '1c84b6bbff028738bb862051cd31027a', 'SSH – Системное администрирование – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(16, 1, '/blog/category/imposition/', '/', '1f4e09fd5ebf972a153e1857da9457b1', 'Верстка – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(17, 1, '/blog/category/imposition/css/', '/', '09292afd0294354a8008e9621638334e', 'CSS – Верстка – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(18, 1, '/blog/category/imposition/css/twitter_bootstrap/', '/', '4bd46dc52c76269d544c4ee93058713a', 'Twitter Bootstrap – CSS – Верстка – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(19, 1, '/blog/category/soft/', '/', 'ac3ade8f23e16f5ffeefb63d9be9e28d', 'Программы (софт) – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(20, 1, '/blog/category/other/', '/', 'fc81545a7bc7af8bf6c72ead51885570', 'Другое – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(21, 1, '/blog/archive/2014/9/', '/', '4e27985623448d4043c8bcc871f556ee', 'Архив статей за Сентябрь 2014 года – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(22, 1, '/blog/archive/2014/8/', '/', 'cbd4bd8bb7c44d8227c00e30671c60d0', 'Архив статей за Август 2014 года – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(23, 1, '/blog/archive/2014/7/', '/', 'edf75b1ead01e06550d606f62eaeb86f', 'Архив статей за Июль 2014 года – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(24, 1, '/blog/archive/2014/2/', '/', 'f7ba3e71716615e1675165a951af1960', 'Архив статей за Февраль 2014 года – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(25, 1, '/blog/archive/2013/9/', '/', '8a9b0ee479cb75965995533cd5753bb7', 'Архив статей за Сентябрь 2013 года – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(26, 1, '/blog/archive/2013/8/', '/', '2a31786c68c313c9ef72c101b35d45e6', 'Архив статей за Август 2013 года – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(27, 1, '/blog/archive/2013/6/', '/', '05a7c7ca09ed248c1269eddba8e55822', 'Архив статей за Июнь 2013 года – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(28, 1, '/blog/archive/2013/1/', '/', '867d9f6d0e8b04bc547b2e335151923b', 'Архив статей за Январь 2013 года – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(29, 1, '/blog/archive/2012/2/', '/', '26606652885ae5bd32a73afbb6219fa2', 'Архив статей за Февраль 2012 года – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(30, 1, '/blog/archive/2011/11/', '/', 'eb806dab6e0850c2249c711e31903db7', 'Архив статей за Ноябрь 2011 года – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(31, 1, '/blog/tag/breadcrumbs/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(32, 1, '/blog/tag/yii/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(33, 1, '/blog/tag/ckeditor/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(34, 1, '/blog/tag/connect/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(35, 1, '/blog/tag/formatting/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(36, 1, '/blog/tag/date_and_time/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(37, 1, '/blog/tag/symfony2/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(38, 1, '/blog/tag/commands/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(39, 1, '/blog/tag/code_illumination/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(40, 1, '/blog/tag/phpstorm/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(41, 1, '/blog/tag/php/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(42, 1, '/blog/tag/memcached/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(43, 1, '/blog/tag/debian/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(44, 1, '/blog/tag/css/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(45, 1, '/blog/tag/linear_gradient/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(46, 1, '/blog/tag/twitter_bootstrap/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(47, 1, '/blog/tag/forms/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(48, 1, '/blog/tag/visual_sStudio_2012_cpp/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(49, 1, '/blog/tag/editor/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(50, 1, '/blog/tag/encoding/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(51, 1, '/blog/tag/framework/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(52, 1, '/blog/tag/cms/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(53, 1, '/blog/tag/select/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(54, 1, '/blog/tag/twig/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(55, 1, '/blog/tag/ssh/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(56, 1, '/blog/tag/translations/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(57, 1, '/blog/tag/skype/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(58, 1, '/blog/tag/chromium/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(59, 1, '/blog/tag/delphi/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(60, 1, '/blog/tag/domains/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(61, 1, '/blog/music_reproduction_in_delphi.html', '/', 'd94f89f9463182734104b2b4222767a0', 'Воспроизведение музыки в Delphi – Delphi – Программирование – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(62, 1, '/blog/registration-domains.html', '/', '7180316b713d2aedcf75f27c9fa3af34', 'Регистрация доменов – Другое – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(63, 1, '/blog/chromium.html', '/', '12cb73306b054eec312d58d18b3c726d', 'Chromium – Delphi – Программирование – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(64, 1, '/blog/we-disconnect-advertising-in-skype.html', '/', 'a337504ac22712432e699629a55eebaf', 'Отключаем рекламу в скайпе – Программы (софт) – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(65, 1, '/blog/mysql-an-insert-across-the-field-from-other-table.html', '/', '06e35074eb909fec574c9f5516055901', 'Mysql вставка по полю из другой таблицы – Программирование – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(66, 1, '/blog/login-event-listener-in-symfony2.html', '/', '1188015af7df8e113a97100284c11fb2', 'Слушатель события Входа на сайт в Symfony 2 – Symfony2 – Программирование – PHP – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(67, 1, '/blog/translations_in_symfony2.html', '/', '6602d29fea29698ee46e8bbfac910559', 'Переводы (локализация) в Symfony 2 – Symfony2 – Программирование – PHP – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(68, 1, '/blog/commands_ssh.html', '/', 'ef5f619d44666ba293a9f2f09f99b5e4', 'Команды ssh – SSH – Системное администрирование – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(69, 1, '/blog/twig_in_symfony2_work_with_date_and_time.html', '/', '3b2a40fb691997d7f68f11103d7416dd', 'Twig в Symfony2: работа с датой и временем. – Symfony2 – Программирование – PHP – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(70, 1, '/blog/debain7_hot_commands_of_the_server.html', '/', 'd4b590be0ff5232ca62cf36de3616953', 'Debain7 – горячие команды сервера – Debian – Системное администрирование – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(71, 1, '/blog/page/1/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(72, 1, '/blog/page/2/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(73, 1, '/blog/page/3/', '/', 'd2a8d4fdd708c38c03e337395b9c103f', 'Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(74, 1, '/contacts/', '/about/', 'dd4cf23d82c09867aeb83d828865f0fe', 'Smart Core CMS: An Error Occurred: Not Found', NULL, NULL, NULL, 200),
(75, 1, '/news/moving_from_shared-hosting_on_vps.html', '/news/', '08cf562f202934d1bc814faaa27dcc0d', 'Переезд с шаред-хостинга на VPS – News – dmitxe.ru', NULL, NULL, NULL, 200),
(76, 1, '/news/moving_on_symfony2.html', '/news/', 'c34f49dc475523588c48c94bdafebaac', 'Сайт перешел на фреймворк Symfony2 – News – dmitxe.ru', NULL, NULL, NULL, 200),
(77, 1, '/news/site_updating.html', '/news/', 'fc630f61c03692f7a7947ba74a124a7d', 'Обновление ядра сайта – News – dmitxe.ru', NULL, NULL, NULL, 200),
(78, 1, '/blog/installation_memcached_on_windows7_x64_php_5_4_17.html', '/blog/category/programing/', '4231d820e4ffd3a615592cb789fab04a', 'Установка Memcached на Windows 7 x64 (php 5.4.17) – PHP – Программирование – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(79, 1, '/blog/adjustment_symfony2_in_phpstorm.html', '/blog/category/programing/', '8263c47329d97c6be4748c292ff98a3a', 'Настройка Symfony2 в PhpStorm – Symfony2 – Программирование – PHP – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(80, 1, '/blog/fourth.html', '/blog/category/programing/', '92019b055cfeb52f0d3d354d16164538', 'Ссылки на Symfony2 – Symfony2 – Программирование – PHP – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(81, 1, '/blog/s2_sik_knd.html', '/blog/category/programing/', 'b6d6069b2b1e443711adf9e423dbc71c', 'Symfony2: справочник команд – Symfony2 – Программирование – PHP – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(82, 1, '/blog/formatting_of_date_and_time_in_yii.html', '/blog/category/programing/php/', 'cf1ce48790966a247352ca9d4053b233', 'Форматирование даты и времени в Yii – Yii – Программирование – PHP – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(83, 1, '/blog/breadcrumbs_yii.html', '/blog/category/programing/php/', '5a075194bc168eb2ac50966732772497', 'Хлебные крошки в Yii – Yii – Программирование – PHP – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(84, 1, '/blog/how_to_connect_ckeditor_to_framework_yii.html', '/blog/category/programing/php/', 'a278e598c0f1a56e9834e57a7751a43e', 'Как подключить Ckeditor к фреймворку Yii – Yii – Программирование – PHP – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(85, 1, '/blog/highlight_code_on_site.html', '/blog/category/programing/js/', '1e51c4c2c02ee9afcbe79fee08f8feb4', 'Подсвечиваем код на сайте – JavaScript – Программирование – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(86, 1, '/blog/create_forms_in_visual_sStudio_2012.html', '/blog/category/programing/cpp/', 'c999a6dc8533e3ba6f255f4fb0e5b8c0', 'Создаем формы в Visual Studio 2012 – C++ – Программирование – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(87, 1, '/blog/connect_twitter_bootstrap_to_yii.html', '/blog/category/imposition/', '246baeeff706880e2897bdbf4aa6456f', 'Подключаем Twitter Bootstrap к Yii – Twitter Bootstrap – Верстка – CSS – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(88, 1, '/blog/css_linear_gradient_of_background.html', '/blog/category/imposition/', '66641ad921db313a994888b77cf10955', 'CSS – линейный градиент фона – CSS – Верстка – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(89, 1, '/blog/notepad_plus_plus.html', '/blog/category/soft/', '4a6b561a862b30bb508036bd22b2f368', 'NotePad++ – Программы (софт) – Blog – dmitxe.ru', NULL, NULL, NULL, 200),
(90, 1, '/blog/framework_vs_cms.html', '/blog/category/other/', 'dbd4fcc446f77211287779a7708af06f', 'Что выбрать: фреймворк или CMS – Другое – Blog – dmitxe.ru', NULL, NULL, NULL, 200);

-- --------------------------------------------------------

--
-- Структура таблицы `sliders`
--

DROP TABLE IF EXISTS `sliders`;
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` smallint(6) DEFAULT NULL,
  `height` smallint(6) DEFAULT NULL,
  `mode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `library` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slide_properties` longtext COLLATE utf8_unicode_ci,
  `pause_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `sliders`
--


-- --------------------------------------------------------

--
-- Структура таблицы `slides`
--

DROP TABLE IF EXISTS `slides`;
CREATE TABLE IF NOT EXISTS `slides` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slider_id` int(10) unsigned NOT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  `file_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `original_file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` smallint(6) DEFAULT '0',
  `properties` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B8C02091D7DF1668` (`file_name`),
  KEY `IDX_B8C020912CCC9638` (`slider_id`),
  KEY `IDX_B8C02091462CE4F5` (`position`),
  KEY `IDX_B8C02091A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `slides`
--


-- --------------------------------------------------------

--
-- Структура таблицы `texter`
--

DROP TABLE IF EXISTS `texter`;
CREATE TABLE IF NOT EXISTS `texter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editor` smallint(6) NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci,
  `meta` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `texter`
--

INSERT INTO `texter` (`id`, `locale`, `editor`, `text`, `meta`, `created_at`, `user_id`, `updated_at`) VALUES
(1, 'ru', 1, '<p>На этом сайте собраны различная полезная информация по тематике сайтостроения.</p>\n<p>Информация больше собрана для себя, впрочем, надеюсь, что она будет также полезна и другим программистам.</p>\n<p>Если Вам нужно создать сайт под ключ - свяжитесь со мной через <a href="/contacts/">форму обратной связи</a>.</p>\n<p>Данный блог написан на фреймворке <a href="http://symfony.com/" target="_blank">Symfony2</a>.</p>', 'a:0:{}', '2014-02-10 07:02:14', 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `texter_history`
--

DROP TABLE IF EXISTS `texter_history`;
CREATE TABLE IF NOT EXISTS `texter_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `item_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `editor` smallint(6) NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci,
  `meta` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_82529097126F525E` (`item_id`),
  KEY `IDX_82529097FD07C8FB` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `texter_history`
--


-- --------------------------------------------------------

--
-- Структура таблицы `unicat__configurations`
--

DROP TABLE IF EXISTS `unicat__configurations`;
CREATE TABLE IF NOT EXISTS `unicat__configurations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `media_collection_id` int(10) unsigned DEFAULT NULL,
  `default_structure_id` int(10) unsigned DEFAULT NULL,
  `entities_namespace` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_inheritance` tinyint(1) NOT NULL DEFAULT '1',
  `items_per_page` smallint(5) unsigned NOT NULL DEFAULT '10',
  `created_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F622D4625E237E06` (`name`),
  UNIQUE KEY `UNIQ_F622D4622B36786B` (`title`),
  KEY `IDX_F622D462B52E685C` (`media_collection_id`),
  KEY `IDX_F622D4627E2E521` (`default_structure_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `unicat__configurations`
--


-- --------------------------------------------------------

--
-- Структура таблицы `unicat__structures`
--

DROP TABLE IF EXISTS `unicat__structures`;
CREATE TABLE IF NOT EXISTS `unicat__structures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `configuration_id` int(10) unsigned DEFAULT NULL,
  `title_form` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entries` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `is_required` tinyint(1) DEFAULT NULL,
  `is_default_inheritance` tinyint(1) NOT NULL DEFAULT '0',
  `is_tree` tinyint(1) NOT NULL DEFAULT '1',
  `properties` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` smallint(6) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B933004773F32DD8` (`configuration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `unicat__structures`
--


-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `firstname`, `lastname`, `created_at`) VALUES
(1, 'admin', 'admin', 'XeDmitry@yandex.ru', 'xedmitry@yandex.ru', 1, '1kf88gzsdl6scs8w8kkk4o0kgo4c8ww', 'BMcHSRHkmIbPIGIkkfC909k9lwlQxGp8FwUJROxrYk8sOQYEyitmtiKE7g3PRT+djndv71TbOY7C3ayl4QbQqQ==', '2015-02-10 07:47:22', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}', 0, NULL, '', '', '2014-02-10 07:02:14'),
(2, 'root', 'root', 'root@mail.ru', 'root@mail.ru', 1, 'cmwmxpar83wo8kk4k0kgok8goscgocc', 'q34yBU2Fh+uOLj8t+sYuMR362HnbHbim3pNi83F+Ki/SigAFOQPYOtSgviqC8yLymg5W6dFLMktZ/KcnBAqVwg==', '2015-07-09 03:18:50', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}', 0, NULL, '', '', '2014-02-10 07:02:14'),
(3, 'tester', 'tester', 'tester@mail.ru', 'tester@mail.ru', 1, 'a7dqix1vsm0ckcw0oo0c4cc80skkcg0', 'dnp8bcDbJfIFPBVK0q4KJTZnxpnc/5sks8dZ+DTUuRitERmRHtfnEgqmDcOPbEgf/sr9IT5WSpBhbPvFyBM0NQ==', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '', '', '2014-02-10 07:02:14');

-- --------------------------------------------------------

--
-- Структура таблицы `webforms`
--

DROP TABLE IF EXISTS `webforms`;
CREATE TABLE IF NOT EXISTS `webforms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_ajax` tinyint(1) NOT NULL DEFAULT '0',
  `is_use_captcha` tinyint(1) NOT NULL DEFAULT '0',
  `send_button_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `send_notice_emails` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `final_text` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_641866195E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `webforms`
--


-- --------------------------------------------------------

--
-- Структура таблицы `webforms_fields`
--

DROP TABLE IF EXISTS `webforms_fields`;
CREATE TABLE IF NOT EXISTS `webforms_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `web_form_id` int(10) unsigned DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `params_yaml` longtext COLLATE utf8_unicode_ci,
  `type` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `position` smallint(6) DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4FE98D465E237E06` (`name`),
  KEY `IDX_4FE98D46B75935E3` (`web_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `webforms_fields`
--


-- --------------------------------------------------------

--
-- Структура таблицы `webforms_messages`
--

DROP TABLE IF EXISTS `webforms_messages`;
CREATE TABLE IF NOT EXISTS `webforms_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `web_form_id` int(10) unsigned DEFAULT NULL,
  `data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `comment` longtext COLLATE utf8_unicode_ci,
  `status` smallint(6) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `ip_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_24719905B75935E3` (`web_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `webforms_messages`
--


--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `blog_articles`
--
ALTER TABLE `blog_articles`
  ADD CONSTRAINT `FK_CB80154F12469DE2` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`),
  ADD CONSTRAINT `FK_CB80154FF675F31B` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `blog_articles_tags_relations`
--
ALTER TABLE `blog_articles_tags_relations`
  ADD CONSTRAINT `FK_512A6F43BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `blog_tags` (`id`),
  ADD CONSTRAINT `FK_512A6F437294869C` FOREIGN KEY (`article_id`) REFERENCES `blog_articles` (`id`);

--
-- Ограничения внешнего ключа таблицы `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD CONSTRAINT `FK_DC3564813D8E604F` FOREIGN KEY (`parent`) REFERENCES `blog_categories` (`id`);

--
-- Ограничения внешнего ключа таблицы `engine_folders`
--
ALTER TABLE `engine_folders`
  ADD CONSTRAINT `FK_6C047E64A640A07B` FOREIGN KEY (`folder_pid`) REFERENCES `engine_folders` (`id`);

--
-- Ограничения внешнего ключа таблицы `engine_nodes`
--
ALTER TABLE `engine_nodes`
  ADD CONSTRAINT `FK_3055D1B798260155` FOREIGN KEY (`region_id`) REFERENCES `engine_regions` (`id`),
  ADD CONSTRAINT `FK_3055D1B7162CB942` FOREIGN KEY (`folder_id`) REFERENCES `engine_folders` (`id`);

--
-- Ограничения внешнего ключа таблицы `engine_regions_inherit`
--
ALTER TABLE `engine_regions_inherit`
  ADD CONSTRAINT `FK_41BBC122162CB942` FOREIGN KEY (`folder_id`) REFERENCES `engine_folders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_41BBC12298260155` FOREIGN KEY (`region_id`) REFERENCES `engine_regions` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `FK_F70E6EB7B52E685C` FOREIGN KEY (`media_collection_id`) REFERENCES `media_collections` (`id`);

--
-- Ограничения внешнего ключа таблицы `gallery_albums`
--
ALTER TABLE `gallery_albums`
  ADD CONSTRAINT `FK_5661ABED4E7AF8F` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`);

--
-- Ограничения внешнего ключа таблицы `gallery_photos`
--
ALTER TABLE `gallery_photos`
  ADD CONSTRAINT `FK_AAF50C7B1137ABCF` FOREIGN KEY (`album_id`) REFERENCES `gallery_albums` (`id`);

--
-- Ограничения внешнего ключа таблицы `media_categories`
--
ALTER TABLE `media_categories`
  ADD CONSTRAINT `FK_30D688FC727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `media_categories` (`id`);

--
-- Ограничения внешнего ключа таблицы `media_collections`
--
ALTER TABLE `media_collections`
  ADD CONSTRAINT `FK_244DA17D14E68FF3` FOREIGN KEY (`default_storage_id`) REFERENCES `media_storages` (`id`);

--
-- Ограничения внешнего ключа таблицы `media_files`
--
ALTER TABLE `media_files`
  ADD CONSTRAINT `FK_192C84E85CC5DB90` FOREIGN KEY (`storage_id`) REFERENCES `media_storages` (`id`),
  ADD CONSTRAINT `FK_192C84E812469DE2` FOREIGN KEY (`category_id`) REFERENCES `media_categories` (`id`),
  ADD CONSTRAINT `FK_192C84E8514956FD` FOREIGN KEY (`collection_id`) REFERENCES `media_collections` (`id`);

--
-- Ограничения внешнего ключа таблицы `media_files_transformed`
--
ALTER TABLE `media_files_transformed`
  ADD CONSTRAINT `FK_1084B87D5CC5DB90` FOREIGN KEY (`storage_id`) REFERENCES `media_storages` (`id`),
  ADD CONSTRAINT `FK_1084B87D514956FD` FOREIGN KEY (`collection_id`) REFERENCES `media_collections` (`id`),
  ADD CONSTRAINT `FK_1084B87D93CB796C` FOREIGN KEY (`file_id`) REFERENCES `media_files` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `FK_70B2CA2A162CB942` FOREIGN KEY (`folder_id`) REFERENCES `engine_folders` (`id`),
  ADD CONSTRAINT `FK_70B2CA2A5550C4ED` FOREIGN KEY (`pid`) REFERENCES `menu_items` (`id`),
  ADD CONSTRAINT `FK_70B2CA2ACCD7E912` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`);

--
-- Ограничения внешнего ключа таблицы `simple_news`
--
ALTER TABLE `simple_news`
  ADD CONSTRAINT `FK_B232FBE93A51721D` FOREIGN KEY (`instance_id`) REFERENCES `simple_news_instances` (`id`);

--
-- Ограничения внешнего ключа таблицы `simple_news_instances`
--
ALTER TABLE `simple_news_instances`
  ADD CONSTRAINT `FK_98EDD001B52E685C` FOREIGN KEY (`media_collection_id`) REFERENCES `media_collections` (`id`);

--
-- Ограничения внешнего ключа таблицы `slides`
--
ALTER TABLE `slides`
  ADD CONSTRAINT `FK_B8C020912CCC9638` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`);

--
-- Ограничения внешнего ключа таблицы `texter_history`
--
ALTER TABLE `texter_history`
  ADD CONSTRAINT `FK_82529097126F525E` FOREIGN KEY (`item_id`) REFERENCES `texter` (`id`);

--
-- Ограничения внешнего ключа таблицы `unicat__configurations`
--
ALTER TABLE `unicat__configurations`
  ADD CONSTRAINT `FK_F622D4627E2E521` FOREIGN KEY (`default_structure_id`) REFERENCES `unicat__structures` (`id`),
  ADD CONSTRAINT `FK_F622D462B52E685C` FOREIGN KEY (`media_collection_id`) REFERENCES `media_collections` (`id`);

--
-- Ограничения внешнего ключа таблицы `unicat__structures`
--
ALTER TABLE `unicat__structures`
  ADD CONSTRAINT `FK_B933004773F32DD8` FOREIGN KEY (`configuration_id`) REFERENCES `unicat__configurations` (`id`);

--
-- Ограничения внешнего ключа таблицы `webforms_fields`
--
ALTER TABLE `webforms_fields`
  ADD CONSTRAINT `FK_4FE98D46B75935E3` FOREIGN KEY (`web_form_id`) REFERENCES `webforms` (`id`);

--
-- Ограничения внешнего ключа таблицы `webforms_messages`
--
ALTER TABLE `webforms_messages`
  ADD CONSTRAINT `FK_24719905B75935E3` FOREIGN KEY (`web_form_id`) REFERENCES `webforms` (`id`);

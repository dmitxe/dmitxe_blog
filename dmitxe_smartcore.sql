-- phpMyAdmin SQL Dump
-- version 3.3.10.4
-- http://www.phpmyadmin.net
--
-- Хост: localhost:3306
-- Время создания: Фев 09 2014 г., 12:27
-- Версия сервера: 5.6.13
-- Версия PHP: 5.5.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `dmitxe_blog2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `blog_articles`
--

DROP TABLE IF EXISTS `blog_articles`;
CREATE TABLE IF NOT EXISTS `blog_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image_id` int(11) DEFAULT NULL,
  `is_commentable` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
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
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Дамп данных таблицы `blog_articles`
--

INSERT INTO `blog_articles` (`id`, `author_id`, `category_id`, `image_id`, `is_commentable`, `enabled`, `title`, `slug`, `annotation`, `text`, `keywords`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 1, 1, 'Хлебные крошки в Yii', 'breadcrumbs_yii', 'Хлебные крошки (Breadcrumbs) - это строка навигации до текущей страницы, сделанная из ссылок на родительские элементы. В Yii есть удобное средство для работы с хлебными крошками - виджет zii CBreadcrumbs http://www.yiiframework.com/doc/api/1.1/CBreadcrumbs<br />\r\n	Хочу описать, как подключить CBreadcrumbs.', '<p></p>\r\n<hr id="readmore" />\r\n<p>\r\n	В контроллере определяем общедоступную переменную-массив хлебных крошек. public $breadcrumbs=array();<br />\r\n	В layout view вставляем</p>\r\n<div class="highlight">\r\n	<pre class="brush:php">\r\n	&lt;?php if(isset($this-&gt;breadcrumbs)):?&gt;\r\n		&lt;?php $this-&gt;widget(&#39;zii.widgets.CBreadcrumbs&#39;, array(\r\n			&#39;links&#39;=&gt;$this-&gt;breadcrumbs,\r\n                        &#39;homeLink&#39;=&gt;CHtml::link(&#39;Главная&#39;,&#39;/&#39; ),\r\n		)); ?&gt;&lt;!-- breadcrumbs --&gt;\r\n	&lt;?php endif?&gt;</pre>\r\n</div>\r\n<p>\r\n	Здесь links &ndash; массив ссылок навигации, мы берём его из текущего контроллера.<br />\r\n	homeLink &ndash; ссылка на главную страницу.<br />\r\n	Теперь во view не забываем определить массив:</p>\r\n<div class="highlight">\r\n	<pre class="brush:php">\r\n$this-&gt;breadcrumbs=array(\r\n	&#39;Записи&#39;=&gt;array(&#39;index&#39;),\r\n	$model-&gt;title,\r\n);</pre>\r\n</div>\r\n<p>\r\n	Вот и всё.</p>\r\n', 'Yii, хлебные крошки', 'Как создать хлебные крошки в Yii', '2011-11-26 10:06:15', NULL),
(2, 1, 1, NULL, 1, 1, 'Как подключить Ckeditor к фреймворку Yii', 'how_to_connect_ckeditor_to_framework_yii', 'Часто возникает необходимость использовать визуальный редактор на сайте. Есть несколько весьма популярных WYSIWYNG-редакторов. Один из них - Ckeditor. Сегодня я расскажу, как подключить Ckeditor к Yii.', '<p></p>\r\n<hr id="readmore" />\r\n<p>\r\n	Шаг первый: скачиваем сам редактор с официального сайта: <a href="http://ckeditor.com/download" target="_blank">http://ckeditor.com/download</a><br />\r\n	Распаковываем архив в корень сайта.<br />\r\n	Шаг второй: скачиваем расширение Yii ckeditor-integration <a href="http://www.yiiframework.com/extension/ckeditor-integration/">отсюда</a>.<br />\r\n	Распаковываем в папку protected/extensions.<br />\r\n	Шаг третий: подключаем к форме наш редактор:</p>\r\n<div class="highlight">\r\n	<pre class="brush: php">\r\n&lt;?php\r\n$this-&gt;widget(&#39;ext.ckeditor.CKEditorWidget&#39;,array(\r\n  &quot;model&quot;=&gt;$model,                 # Модель данных\r\n  &quot;attribute&quot;=&gt;&#39;content&#39;,          # Аттрибут в модели\r\n  &quot;defaultValue&quot;=&gt;$model-&gt;content, #Значение по умолчанию\r\n\r\n  &quot;config&quot; =&gt; array(\r\n      &quot;height&quot;=&gt;&quot;400px&quot;,\r\n      &quot;width&quot;=&gt;&quot;100%&quot;,\r\n      &quot;toolbar&quot;=&gt;&quot;Full&quot;, #панель инструментов\r\n      &quot;defaultLanguage&quot;=&gt;&quot;ru&quot;, # Язык по умолчанию\r\n      ),\r\n   &quot;ckEditor&quot;=&gt;Yii::app()-&gt;basePath.&quot;/../ckeditor/ckeditor.php&quot;,\r\n                                  # Путь к ckeditor.php\r\n  &quot;ckBasePath&quot;=&gt;Yii::app()-&gt;baseUrl.&quot;/ckeditor/&quot;,\r\n                                  # адрес к редактору\r\n  ) ); ?&gt;</pre>\r\n</div>\r\n<div class="code">\r\n	Все параметры конфига редактора смотрим <a href="http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html">здесь</a></div>\r\n', 'Yii, Ckeditor, подключение', 'В статье рассказывается о том, как быстро и правильно подключить Ckeditor к Yii', '2011-11-23 13:20:50', NULL),
(3, 1, 1, NULL, 1, 1, 'Форматирование даты и времени в Yii', 'formatting_of_date_and_time_in_yii', 'Передо мной встала такая задача: как в Yii вывести дату, отформатированную в родном, русском формате. Оказывается, очень просто. Во-первых, надо установить русский язык в конфигурационном файле приложения, и, во-вторых, воспользоваться методом компонента&nbsp; приложения CDateFormatter-&gt;format().', '<p></p>\r\n<hr id="readmore" />\r\n<p>\r\n	Итак, приступим. В конфигурационном файле пропишем две строчки, которые установят русификацию для сайта:</p>\r\n<div class="highlight">\r\n	<pre class="brush: php">\r\n   &#39;sourceLanguage&#39; =&gt; &#39;en&#39;,\r\n    &#39;language&#39; =&gt; &#39;ru&#39;,</pre>\r\n</div>\r\n<p>\r\n	Здесь sourceLanguage &ndash; язык, на котором написан сам сайт. У меня он, естественно, английский. Ну а текущий язык &ndash; language &ndash; русский.<br />\r\n	Теперь в том месте, где хотим вывести отформатированную дату, добавим такой код:</p>\r\n<div class="highlight">\r\n	<pre class="brush: php">\r\n	echo Yii::app()-&gt;dateFormatter-&gt;format(&quot;dd MMMM y, HH:mm&quot;, $vardatetime);</pre>\r\n</div>\r\n<p>\r\n	Выведет дату и время в таком формате:&nbsp; 29 ноября 2011, 16:41<br />\r\n	Метод format принимает два параметра: первый &ndash; шаблон времени в стандарте Юникода, второй &ndash; время в unix timestamp или Mysql DATETIME. Вот и всё.<br />\r\n	Более подробно о CDateFormatter смотрите <a href="http://www.yiiframework.com/doc/api/1.1/CDateFormatter" target="_blank">здесь</a><br />\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n', 'Yii, формат, дата', 'Как правильно и грамотно отформатировать дату и время в Yii', '2012-02-25 15:28:38', NULL),
(4, 1, 4, NULL, 1, 1, 'Symfony2: справочник команд', 's2_sik_knd', 'В этой статье буду писать самые часто используемые команды Симфони. Как ни странно, но на Симфони без командной строки ну никак. Полгода-год назад помнил многие команды наизусть, а сейчас, особенно после работы с Магенто, в голове чистый лист.', '<p></p>\r\n<hr id="readmore" />\r\n<p>\r\n	Инсталляция проекта:</p>\r\n<pre class="brush: php; toolbar: true;">\r\n composer install --prefer-dist</pre>\r\n<p>\r\n	Обновление проекта:</p>\r\n<pre class="brush: php; toolbar: true;">\r\n composer update --prefer-dist</pre>\r\n<p>\r\n	Обновление бандла:</p>\r\n<pre class="brush: php; toolbar: true;">\r\n composer update friendsofsymfony/user-bundle</pre>\r\n<p>\r\n	Создание базы:</p>\r\n<pre class="brush: php; toolbar: true;">\r\nphp app/console doctrine:database:create</pre>\r\n<p>\r\n	Создание таблиц:</p>\r\n<pre class="brush: php; toolbar: true;">\r\nphp app/console doctrine:schema:create</pre>\r\n<p>\r\n	Загрузка фикстур:</p>\r\n<pre class="brush: php; toolbar: true;">\r\nphp app/console doctrine:fixtures:load</pre>\r\n<p>\r\n	Обновление схемы базы:</p>\r\n<pre class="brush: php; toolbar: true;">\r\nphp app/console doctrine:schema:update --force</pre>\r\n<p>\r\n	Создание бандла:</p>\r\n<pre class="brush: php; toolbar: true;">\r\nphp app/console generate:bundle --namespace=Acme/HelloBundle --format=yml</pre>\r\n<p>\r\n	Очистка кэша:</p>\r\n<pre class="brush: php; toolbar: true;">\r\nphp app/console cache:clear --env=prod --no-debug</pre>\r\n<p>\r\n	Отладка роутеров:</p>\r\n<pre class="brush: php; toolbar: true;">\r\nphp app/console router:debug</pre>\r\n<p>\r\n	Показать все сервисы и классы связанные с сервисом:</p>\r\n<pre class="brush: php; toolbar: true;">\r\nphp app/console container:debug</pre>\r\n<p>\r\n	Показать приватные сервисы :</p>\r\n<pre class="brush: php; toolbar: true;">\r\nphp app/console container:debug --show-private</pre>\r\n<p>\r\n	Показать сервис по его id :</p>\r\n<pre class="brush: php; toolbar: true;">\r\nphp app/console container:debug my_mailer</pre>\r\n<p>\r\n	Обновить ассеты :</p>\r\n<pre class="brush: php; toolbar: true;">\r\n1. php app/console assetic:dump\r\n2. php app/console assets:install\r\n</pre>\r\n<p>\r\n	Примечание. Иногда бывает нужно явно указать --env=prod</p>\r\n', 'Symfony, команды', 'Самые часто используемые команды  Symfony2', '2013-08-07 17:19:21', NULL),
(5, 1, 5, NULL, 1, 1, 'Подсвечиваем код на сайте', 'highlight_code_on_site', 'Давно мечтал о нормальной подсветке кода php, html и css. Наконец-то у меня выдалось время и я посветил этому вопросу несколько часов. Итак, небольшой обзор существующих способов подсветки показал, что её (подсветку) можно делать или не стороне клиента, или на стороне сервера. Для себя я сразу решил, что свой сервер грузить лишней работой не стоит. В общем, решил искать реализацию на JavaScript. Конечно, при отключённом js мои посетители не увидят подсветки, но таких, надеюсь, будет мало))', '<p></p>\r\n<hr id="readmore" />\r\n<p>\r\n	После гугления наткнулся на симпатичную статью. В ней описывался компактный скрипт highlight: <a href="http://softwaremaniacs.org/soft/highlight/">http://softwaremaniacs.org/soft/highlight/</a></p>\r\n<p>\r\n	Увы, после подключения подсветки кода я не увидел. Зато мой &laquo;любимый&raquo; IE подсветил ошибку на JavaScript. Мол, объект не поддерживает какое-то там свойство. Как Вы наверное понимаете, копаться в чужом коде и искать ошибку я не стал. Не подключается &ndash; и ладно, ищем другой скрипт.</p>\r\n<p>\r\n	Кандидатом номер два стал SyntaxHighlighter от Alex Gorbatchev. Особенность скрипта &ndash; что он не требует jQuery (хотя я не считаю это преимуществом) и можно указать только те языки, которые нужны. &nbsp;После скачивания и настройки подсветка кода тут же заработала, что очень и очень меня порадовало!</p>\r\n<p>\r\n	Архив качаем отсюда: <a href="http://alexgorbatchev.com/SyntaxHighlighter/download/">http://alexgorbatchev.com/SyntaxHighlighter/download/</a></p>\r\n<p>\r\n	Расскажу о некоторых особенностях настройки. Извлеките из скаченного архива и подключите следующие файлы:</p>\r\n<ol>\r\n	<li>\r\n		shCore.js</li>\r\n	<li>\r\n		shCore.css</li>\r\n	<li>\r\n		shThemeDefault.css</li>\r\n</ol>\r\n<p>\r\n	Далее определитесь с языками, подсветка коих Вам нужна. Так, я выбрал себе css, html и php. Чтобы они заработали, надо подключить следующие файлы:&nbsp; shBrushCss.js,&nbsp; shBrushXml.js, shBrushPhp.js.</p>\r\n<p>\r\n	И последний шаг &ndash; инициализация скрипта. Добавьте скрипт со строчкой</p>\r\n<pre class="brush: js; toolbar: true;">\r\nSyntaxHighlighter.all();</pre>\r\n<p>\r\n	- и подсветка заработает.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	На этом собственно все. Заключительный штрих &ndash; у себя я отключил боковую панельку (полоса прокрутки+ссылка на сайт автора) командой SyntaxHighlighter.defaults[&#39;toolbar&#39;] = false;</p>\r\n<p>\r\n	Как пользоваться подсветкой? Используйте тег &lt;pre&gt;с классом brush:[язык подсветки]. Т.е. для php это будет выглядеть так:</p>\r\n<p>\r\n	&nbsp;</p>\r\n<pre class="brush: js; toolbar: true;">\r\n	&lt;pre class=&quot;brush: php; toolbar: true;&quot;&gt;echo &quot;Привет, мир!&quot;; &lt;/pre&gt;</pre>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Скриптом я доволен.</p>\r\n', 'подсветка кода, highlight', 'Как подсветить код на сайте: используем highlight', '2013-01-29 17:28:47', NULL),
(6, 1, 4, NULL, 1, 1, 'Настройка Symfony2 в PhpStorm', 'adjustment_symfony2_in_phpstorm', 'По горячим следам, пока помню, напишу об интеграции поддержки Symfony2 в phpStorm.', '<p></p>\r\n<hr id="readmore" />\r\n<p>\r\n	Нам потребуется плагин: <a href="http://plugins.jetbrains.com/plugin/7219?pr=phpStorm">http://plugins.jetbrains.com/plugin/7219?pr=phpStorm</a></p>\r\n<p>\r\n	Устанавливаем его (File-&gt;Settings-&gt;Plugins, кнопка Install From Disk)</p>\r\n<p>\r\n	Перезапуcкаем PhpStorm. Идем в File-&gt;Settings-&gt;Symfony2 Plugin, ставим галку на Enable Plugin, проверяем пути (у меня var/cache/dev/appDevUrlGenerator.php и var/cache/dev/translations), в Container добавляем путь.</p>\r\n<p>\r\n	Ввводим команду php bin/warmup_cache</p>', 'phpStorm, Symfony2', 'Интеграции поддержки Symfony2 в phpStorm', '2013-08-10 10:14:05', NULL),
(7, 1, 4, NULL, 1, 1, 'Ссылки на Symfony2', 'fourth', 'Ссылки на полезную литературу по Symfony2', '<p></p>\r\n<hr id="readmore" /><p>Работа с контейнером сервисов: <a href="http://symfony.com/doc/current/book/service_container.html" target="_blank">http://symfony.com/doc/current/book/service_container.html</a></p>\r\n<p>Поиск бандлов для Symfony2: на сайте <a href="http://knpbundles.com/" target="_blank">KnpBundles</a></p>', NULL, NULL, '2013-08-10 10:14:05', NULL),
(8, 1, 2, NULL, 1, 1, 'Установка Memcached на Windows 7 x64 (php 5.4.17)', 'installation_memcached_on_windows7_x64_php_5_4_17', 'Встала задача поставить себе memcached. В интернете есть много мануалов, но они в основном под 32-разрядные версии. Т.к. у меня 64-разрядный php, то возникли определенные трудности…', '<p></p>\r\n<hr id="readmore" />\r\n<p>\r\n	Начать с того, что 64-раздяную версию самого &nbsp;memcache найти не так-то просто. На официальном сайт лежат сырые исходники: <a href="http://code.google.com/p/memcached/downloads/list">http://code.google.com/p/memcached/downloads/list</a></p>\r\n<p>\r\n	Компилировать их показалось задачей сложной и страшной. После интенсивного поиска в гугле нашел вот <a href="http://s3.amazonaws.com/downloads.northscale.com/memcached-win64-1.4.4-14.zip">тут</a> файлы версии 1.4.4-14 под Windows x64. Версия устаревшая, но выхода у меня не было (гугл показывал еще более старые версия), скачал себе эту.</p>\r\n<p>\r\n	Создал на диске себе папку <strong>memcached</strong> &nbsp;и распаковал туда архив. Далее запустил командную строку (от имени Администратора!) и выполнил</p>\r\n<pre class="brush: php; toolbar: true;">\r\n	C:\\memcached\\memcached.exe -d install</pre>\r\n<p>\r\n	Пошел смотреть в Службы, как встал memcached (Панель управления-&gt;Администрирование-&gt;Службы) &ndash; служба с таким именем появилась. Запустил её, в свойствах прописал автоматический запуск.</p>\r\n<p>\r\n	Осталось только подключиться к php. После поисков нашел тут: <a href="http://www.mediafire.com/download/8d3vd26z3fg6bf1/php_memcache-svn20120301-5.4-VC9-x64.zip">http://www.mediafire.com/download/8d3vd26z3fg6bf1/php_memcache-svn20120301-5.4-VC9-x64.zip</a> - похожее на нужную версию.</p>\r\n<p>\r\n	Однако при копировании вдруг обнаружил, что расширение (у меня php 5.4.17) php_memcache.dll уже есть&hellip; Решил, что &laquo;из коробки&raquo; будет надежнее.</p>\r\n<p>\r\n	Прописал в php.ini в разделе с расширениями</p>\r\n<pre class="brush: php; toolbar: true;">\r\n	[PHP_MEMCACHED]\r\n	extension = php_memcache.dll</pre>\r\n<p>\r\n	Перезапустил апач, убедился, что php_info() вывел memcache</p>\r\n<p>\r\n	Запустил тестовый файлик, ничего не сломалось.&nbsp; Ну посмотрим, как дальше себя поведет php&hellip;</p>\r\n<p>\r\n	P.S. Так файлы на просторах интернета имеет тенденцию теряться (сколько я нерабочих ссылок сегодня нашел!), то прикладываю свой архивчик: <a href="/media/memcached.zip">скачать</a></p>\r\n', 'php 5.4, Memcached, Windows 7 x64', 'Как установить поддержку Memcached php 5.4 на Windows 7 x64', '2013-08-27 19:38:21', NULL),
(9, 1, 6, NULL, 1, 1, 'Debain7 – горячие команды сервера', 'debain7_hot_commands_of_the_server', 'Тут собрал команды, которые все время приходится использовать на сервере (ОС – Debain7)', '<hr id="readmore" />\r\n<p>Запуск apache:</p>\r\n<div class="highlight">	<pre class="brush: cpp">/etc/init.d/apache2 start</pre></div>\r\n<p>Остановка apache:</p>\r\n<div class="highlight">	<pre class="brush: cpp">/etc/init.d/apache2 stop</pre></div>\r\n<p>Перезапуск apache:</p>\r\n<div class="highlight">	<pre class="brush: cpp"> /etc/init.d/apache2 restart</pre></div>\r\n', 'Debain7, команды', 'Часто используемые команды в Debain7', '2013-08-29 22:09:51', NULL),
(10, 1, 8, NULL, 1, 1, 'CSS – линейный градиент фона', 'css_linear_gradient_of_background', 'Как сделать градиент фону, не прибегая к помощи фоновых рисунков? Современные браузеры поддерживают градиентную заливку с помощью CSS.', '<p></p>\r\n<hr id="readmore" />\r\n<div class="highlight">\r\n	<pre class="brush: css">\r\nbackground:#EFEFEF; /*цвет фона кнопки для браузеров без поддержки CSS3*/\r\nbackground: -webkit-gradient(linear, left top, left bottom, from(#3437CD), to(#538BFF)); /* для Webkit браузеров */\r\nbackground: -moz-linear-gradient(top,  #3437CD, #538BFF); /* для Firefox */\r\nbackground-image: -o-linear-gradient(top,  #3437CD,  #538BFF); /* для Opera 11 */\r\nfilter:  progid:DXImageTransform.Microsoft.gradient(startColorstr=&#39;#3437CD&#39;, endColorstr=&#39;#538BFF&#39;); /* фильтр для IE */\r\n\r\n</pre>\r\n</div>\r\n<p>\r\n	Чтобы сохранить&nbsp; кроссбраузерность, приходиться писать под каждый интернет-браузер отдельное правило CSS. Особо обрабатывается IE.&nbsp; В каждом правиле участвует два цвета &ndash; начальный и конечный.</p>\r\n', 'градиент фона, css', 'Создание градиента без помощи фоновых рисунков', '2012-02-25 17:03:11', NULL),
(11, 1, 10, NULL, 1, 1, 'Подключаем Twitter Bootstrap к Yii', 'connect_twitter_bootstrap_to_yii', 'Совсем недавно мне рассказали о такой классной вещи, как фреймворк css от Твиттера - Twitter Bootstrap. Раньше, максимум, что я использовал - это "reset css". Все остальное писал ручками. Каждый раз - одно и то же. Что, понятно, отрицательно сказывалось на производительности. Немного поработав с этим фреймворком (оформление админки на Симфони 2) - пришел к выводу, что вещь это безусловно полезная. Реально ускоряет работу в разы. И вот я решил перевести и свой блог на Yii к этому же виду.', '<p></p>\r\n<hr id="readmore" />\r\n<p>\r\n	Перво-наперво скачал сам Twitter Bootstrap с гитхаба: <a href="https://github.com/twitter/bootstrap">https://github.com/twitter/bootstrap</a>. Т.е я качал вместе с исходниками на языку less, т.к. планировал самостоятельно компилировать из них css. Вы же может скачать уже скомпилированные файлы, например, отсюда: <a href="http://bootstrap.veliovgroup.com/">http://bootstrap.veliovgroup.com/</a> Но в этом случае уже нельзя будет изменять расцветку ну и вообще вносить изменения&hellip; В общем, я остановился на сырых исходниках.</p>\r\n<p>\r\n	Компилировать исходники less я решил с помощью расширения Yii-less: <a href="http://www.yiiframework.com/extension/yii-less/">http://www.yiiframework.com/extension/yii-less/</a></p>\r\n<p>\r\n	Скачиваем данное расширение, ложем его в папку protected/extensions. В конфиге регистрируем новый&nbsp; behaviors:</p>\r\n<pre class="brush: php; toolbar: true;">\r\n	&#39;behaviors&#39;=&gt;array(\r\n	    &#39;ext.yii-less.components.LessCompilationBehavior&#39;,\r\n	)\r\n</pre>\r\n<p>\r\n	Регистрируем расширение как компонент:</p>\r\n<pre class="brush: php; toolbar: true;">\r\n&#39;components&#39;=&gt;array(\r\n  &#39;lessCompiler&#39;=&gt;array(\r\n    &#39;class&#39;=&gt;&#39;ext.yii-less.components.LessCompiler&#39;,\r\n    &#39;paths&#39;=&gt;array(\r\n      // you can access to the compiled file on this path\r\n      &#39;/css/bootstrap.css&#39; =&gt; array(\r\n        &#39;precompile&#39; =&gt; true, // whether you want to cache the generation\r\n        &#39;paths&#39; =&gt; array(&#39;/less/bootstrap.less&#39;) //paths of less files. you can specify multiple files.\r\n      ),\r\n    ),\r\n  ),\r\n),\r\n</pre>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	И в лайоте пишем Yii::app()-&gt;clientScript-&gt;registerCssFile(&#39;/css/bootstrap.css&#39;)</p>\r\n<p>\r\n	Все, теперь при первом запуске в нашем ассете будет новый файл. Как альтернатива &ndash; можно компилировать файлы на стороне клиента (<a href="https://github.com/cloudhead/less.js">https://github.com/cloudhead/less.js</a>)&nbsp; &ndash; но, на мой взгляд, это сильно скажется на производительности&hellip;.</p>\r\n<p>\r\n	Одной проблемой меньше. Остался вопрос с подсветкой кода на less. Мой редактор (NetBeans) по умолчанию не распознает less. Исправляем это с помощь плагина scss-editor <a href="http://code.google.com/p/scss-editor/">http://code.google.com/p/scss-editor/</a></p>\r\n<ol>\r\n	<li>\r\n		Качаем плагин, ставим его в NetBeans</li>\r\n	<li>\r\n		Ассоциируем с ним файлы Less &ndash; Сервис -&gt;Параметры -&gt;Файлы,&nbsp; создаем новое расширение less и в списке &laquo;Связанный тип файлов&raquo; задаем ему &laquo;text/x-scss&raquo;</li>\r\n</ol>\r\n<p style="margin-left:18.0pt;">\r\n	Перезапускаем NetBeans &ndash; и подсветка появилась!</p>\r\n<p style="margin-left:18.0pt;">\r\n	Напоследок замечу, что для Yii есть готовое решение в виде расширения yii-bootstrap: <a href="http://www.cniska.net/yii-bootstrap/" target="_blank">http://www.cniska.net/yii-bootstrap/</a> - но я его не пробовал. Лень разбираться&hellip;</p>\r\n	<p><b>UPD</b> На Symfony2 этот же дизайн встал без проблем</p>\r\n', 'yii, twitter bootstap, подключение', 'Как подключить Twitter Bootstrap к Yii', '2013-01-29 17:42:26', NULL),
(12, 1, 11, NULL, 1, 1, 'Создаем формы в Visual Studio 2012', 'create_forms_in_visual_sStudio_2012', 'Сегодня решил повозиться с Microsoft Visual Studio 2012 C++ - попробовать создать свою форму. Начал искать компоненты (как в Delphi) - но нигде их не нашел!', '<p></p>\r\n<hr id="readmore" />\r\n<p>\r\n	Погуглил и понял, что именно в 2012 версии, именно для языка C++ разработчики решили убрать поддержку Windows Forms Application. На просторах буржуйского интернета нашел замечательное решение. Нужно скачать шаблон <a href="http://dmitxe.ru/media/VS2012CPPWinForms.zip">http://dmitxe.ru/media/VS2012CPPWinForms.zip</a> и скопировать его в C:\\Program Files (x86)\\Microsoft Visual Studio 11.0\\VC\\vcprojects\\vcNET\\ - при этом лучше на всякий случай сделать бэкап файла &quot;vcNET.vsdir&quot;. Использование: Файл-&gt;Проект-&gt;Шаблоны-&gt;Visual C++ -&gt; CLR-&gt;MC++ WinApp</p>\r\n<p>\r\n	Источник:&nbsp; <a href="http://www.t-hart.org/vs2012/">http://www.t-hart.org/vs2012/</a></p>\r\n', 'форма, Visual Studio 2012 C++', 'Как создать приложение Windows Forms Application в Visual Studio 2012 C++', '2013-06-06 20:31:23', NULL),
(13, 1, 12, NULL, 1, 1, 'NotePad++', 'notepad_plus_plus', 'Часто возникает необходимость быстрой перекодировки файла (например, из ansi в utf8, или наоборот). Есть замечательный (и притом бесплатный) редактор - NotePad++. С помощью него можно легко перекодировать файл из одной кодировки в другую. В этом редакторе есть даже подсветка кода. Конечно, я предпочитаю работать где-нибудь в Adobe Dreamweaver, NuSphere PHPED или в NetBeans. Но эти монстры подолгу грузятся, а иногда хочется быстро подправить код и тут же закрыть файл. Для этого как раз подойдёт NotePad++', '<p></p>\r\n<hr id="readmore" />\r\n<p>\r\n	Есть одна особенность перекодирования в utf8. Для преобразования кодировки&nbsp; файла выбираем в меню &laquo;Кодировки&raquo;-&gt; &laquo;Преобразовать в utf8&nbsp; без BOM&raquo;. Если выбрать просто &laquo;Преобразовать в utf8&raquo;, тогда случиться трагедия &ndash; страница перестанет правильно отображаться в браузере. Преобразование в ANSI таких проблем не имеет &ndash; есть только одно действие.<br />\r\n	Программа качается <a href="http://notepad-plus-plus.org/download/" target="_blank">отсюда</a>.<br />\r\n	&nbsp;</p>\r\n', 'редактор, кодировка', 'Как перекодировать файл с помощью NotePad++', '2012-02-25 15:34:43', NULL),
(14, 1, 13, NULL, 1, 1, 'Что выбрать: фреймворк или CMS', 'framework_vs_cms', 'Свое знакомство с сайтостроением я начал с написания простейшего кода на HTML. Сайт получился, естественно, статическим. Следующий проект делал уже на PHP. Времени на написание ушло много, в результате у меня начала создаваться собственная CMS. К сожалению, данный факт осмыслил не сразу. А как только понял, что приду к CMS, решил не изобретать велосипед, освоил Joomla и WordPress.', '<p></p>\r\n<hr id="readmore" />\r\n<p>\r\n	&nbsp;Разработка стандартных сайтов (блогов, форумов и т.д.) пошла на ура. Но вся проблема оказалась в том, что многим заказчикам нужна некая особая, нестандартная функциональность. Реализовать которую в рамках данной CMS оказывается совсем непросто. Приходиться писать новые расширения или модифицировать существующий код. Времени такая работа занимает много, к тому же из-за взаимодействия с ядром CMS код не оптимальный. В общем, встал вопрос &ndash; что же проще &ndash; писать свою CMS или мучиться с существующими.</p>\r\n<p>\r\n	И тут я вспомнил о фреймворках. &nbsp;Фреймворк &ndash; это каркас для веб-приложения, а CMS &ndash; готовая система управления контентом. Наверное, можно фреймворк можно сравнить с кирпичами, из которых можно построить самые причудливые строения, а CMS &ndash; это стандартный дом.</p>\r\n<p>\r\n	После обзора самых популярных фреймворков я остановил свой выбор на Yii. Понравился достаточно строгий подход, относительная простота изучения (конечно, CodeIgniter осваивается легче, но возможности Yii богаче).</p>\r\n<p>\r\n	Теперь написать собственную, уникальную CMS стало гораздо проще. Конечно, стандартные проекты быстрее реализовать на готовой CMS, но многие проекты имею тенденцию превращаться из стандартных в нестандартные.</p>\r\n<p>\r\n	Этот блог я написал на Yii. А вот другой мой блог &ndash; netopus.ru написан CMS WordPress. Использовалась одна из бесплатных тем для WordPress.</p>\r\n<p><b>UPD</b> В сентябре 2013 года блог перешел на Symfony2 (движок SmartCore)</p>\r\n', 'фреймворк, CMS, выбор', 'Преимущества и недостатки фреймворка над CMS', '2011-11-23 13:15:19', NULL),
(15, 1, 4, NULL, 1, 1, 'Twig в Symfony2: работа с датой и временем.', 'twig_in_symfony2_work_with_date_and_time', 'Поначалу возник недоуменный вопрос: как в twig отдать дату в нужном формате? Неужели дату можно форматировать только в контролере? Но погуглив, нашел ответы на свои вопросы.', '<p></p>\r\n<hr id="readmore" />\r\n<p>Форматирование даты:</p>\r\n<pre class="brush: php; toolbar: true;">\r\n	var_date|date("d.m.y")\r\n</pre>\r\n<p>Получение текущей даты:</p>\r\n<pre class="brush: php; toolbar: true;">\r\n	"new"|date("d.m.y")\r\n</pre>\r\n<p>Интернационализация:</p>\r\n<p>1. Подключаем сервис в конфиге Symfony2</p>\r\n<pre class="brush: php; toolbar: true;">\r\n	services:\r\n        twig_extension.intl:\r\n            class: Twig_Extensions_Extension_Intl\r\n            tags: [{ name: "twig.extension" }]\r\n</pre>\r\n<p>2. Пример вызова</p>\r\n<pre class="brush: php; toolbar: true;">\r\n	{{ item.date|localizeddate("none", "none", null, null, "dd. LLLL YYYY") }}\r\n</pre>\r\n', 'Symfony2, Twig, дата и время', 'Symfony2 работа с датой и временем из Twig', '2013-09-05 18:19:56', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `blog_articles_tags_relations`
--

DROP TABLE IF EXISTS `blog_articles_tags_relations`;
CREATE TABLE IF NOT EXISTS `blog_articles_tags_relations` (
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
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
(15, 24);

-- --------------------------------------------------------

--
-- Структура таблицы `blog_categories`
--

DROP TABLE IF EXISTS `blog_categories`;
CREATE TABLE IF NOT EXISTS `blog_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `slug` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_DC356481989D9B62` (`slug`),
  KEY `IDX_DC3564813D8E604F` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Дамп данных таблицы `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `parent`, `slug`, `title`, `created_at`) VALUES
(1, 2, 'yii', 'Yii', '2014-02-09 09:09:22'),
(2, 3, 'php', 'PHP', '2014-02-09 09:09:22'),
(3, NULL, 'programing', 'Программирование', '2014-02-09 09:09:22'),
(4, 2, 'symfony2', 'Symfony2', '2014-02-09 09:09:22'),
(5, 3, 'js', 'JavaScript', '2014-02-09 09:09:22'),
(6, 7, 'debian', 'Debian', '2014-02-09 09:09:22'),
(7, NULL, 'os', 'Операционные системы', '2014-02-09 09:09:22'),
(8, 9, 'css', 'CSS', '2014-02-09 09:09:22'),
(9, NULL, 'imposition', 'Верстка', '2014-02-09 09:09:22'),
(10, 8, 'twitter_bootstrap', 'Twitter Bootstrap', '2014-02-09 09:09:22'),
(11, 3, 'cpp', 'C++', '2014-02-09 09:09:22'),
(12, NULL, 'soft', 'Программы (софт)', '2014-02-09 09:09:22'),
(13, NULL, 'other', 'Другое', '2014-02-09 09:09:22');

-- --------------------------------------------------------

--
-- Структура таблицы `blog_tags`
--

DROP TABLE IF EXISTS `blog_tags`;
CREATE TABLE IF NOT EXISTS `blog_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8F6C18B6989D9B62` (`slug`),
  UNIQUE KEY `UNIQ_8F6C18B62B36786B` (`title`),
  KEY `weight` (`weight`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

--
-- Дамп данных таблицы `blog_tags`
--

INSERT INTO `blog_tags` (`id`, `slug`, `title`, `created_at`, `weight`) VALUES
(1, 'breadcrumbs', 'Breadcrumbs', '2014-02-09 09:09:22', 0),
(2, 'yii', 'Yii', '2014-02-09 09:09:22', 0),
(3, 'ckeditor', 'Ckeditor', '2014-02-09 09:09:22', 0),
(4, 'connect', 'Подключение', '2014-02-09 09:09:22', 0),
(5, 'formatting', 'Форматирование', '2014-02-09 09:09:22', 0),
(6, 'date_and_time', 'Дата и время', '2014-02-09 09:09:22', 0),
(7, 'symfony2', 'Symfony2', '2014-02-09 09:09:22', 0),
(8, 'commands', 'Консольные команды', '2014-02-09 09:09:22', 0),
(9, 'code_illumination', 'Подсветка кода', '2014-02-09 09:09:22', 0),
(10, 'phpstorm', 'phpStorm', '2014-02-09 09:09:22', 0),
(11, 'php', 'PHP', '2014-02-09 09:09:22', 0),
(12, 'memcached', 'Memcached', '2014-02-09 09:09:22', 0),
(13, 'debian', 'Debian', '2014-02-09 09:09:22', 0),
(14, 'css', 'CSS', '2014-02-09 09:09:22', 0),
(15, 'linear_gradient', 'Линейный градиент', '2014-02-09 09:09:22', 0),
(16, 'twitter_bootstrap', 'Twitter Bootstrap', '2014-02-09 09:09:22', 0),
(17, 'forms', 'Формы', '2014-02-09 09:09:22', 0),
(18, 'visual_sStudio_2012_cpp', 'Visual Studio 2012 C++', '2014-02-09 09:09:22', 0),
(19, 'editor', 'Редактор', '2014-02-09 09:09:22', 0),
(20, 'encoding', 'Кодировка', '2014-02-09 09:09:22', 0),
(21, 'framework', 'Фреймворк', '2014-02-09 09:09:22', 0),
(22, 'cms', 'CMS', '2014-02-09 09:09:22', 0),
(23, 'select', 'Выбор', '2014-02-09 09:09:22', 0),
(24, 'twig', 'Twig', '2014-02-09 09:09:22', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `engine_blocks`
--

DROP TABLE IF EXISTS `engine_blocks`;
CREATE TABLE IF NOT EXISTS `engine_blocks` (
  `block_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `position` smallint(6) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by_user_id` int(11) NOT NULL,
  `create_datetime` datetime NOT NULL,
  PRIMARY KEY (`block_id`),
  UNIQUE KEY `UNIQ_2FCE65B45E237E06` (`name`),
  KEY `position` (`position`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `engine_blocks`
--

INSERT INTO `engine_blocks` (`block_id`, `position`, `name`, `descr`, `create_by_user_id`, `create_datetime`) VALUES
(1, 0, 'content', 'Рабочая область', 0, '2014-02-09 09:09:22'),
(2, 1, 'main_menu', 'Главное меню', 0, '2014-02-09 09:09:22'),
(3, 2, 'left_sidebar', 'Левый сайдбар', 0, '2014-02-09 09:09:22'),
(4, 3, 'breadcrumbs', 'Хлебные крошки', 0, '2014-02-09 09:09:22'),
(5, 4, 'footer', 'Подвал', 0, '2014-02-09 09:09:22');

-- --------------------------------------------------------

--
-- Структура таблицы `engine_blocks_inherit`
--

DROP TABLE IF EXISTS `engine_blocks_inherit`;
CREATE TABLE IF NOT EXISTS `engine_blocks_inherit` (
  `block_id` smallint(6) NOT NULL,
  `folder_id` int(11) NOT NULL,
  PRIMARY KEY (`block_id`,`folder_id`),
  KEY `IDX_372DC759E9ED820C` (`block_id`),
  KEY `IDX_372DC759162CB942` (`folder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `engine_blocks_inherit`
--

INSERT INTO `engine_blocks_inherit` (`block_id`, `folder_id`) VALUES
(2, 1),
(3, 1),
(4, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `engine_folders`
--

DROP TABLE IF EXISTS `engine_folders`;
CREATE TABLE IF NOT EXISTS `engine_folders` (
  `folder_id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_pid` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_file` tinyint(1) DEFAULT NULL,
  `position` smallint(6) DEFAULT NULL,
  `uri_part` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `descr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `redirect_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `router_node_id` int(11) DEFAULT NULL,
  `has_inherit_nodes` tinyint(1) DEFAULT NULL,
  `permissions` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `lockout_nodes` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `template_inheritable` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template_self` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by_user_id` int(11) NOT NULL,
  `create_datetime` datetime NOT NULL,
  PRIMARY KEY (`folder_id`),
  UNIQUE KEY `folder_pid_uri_part` (`folder_pid`,`uri_part`),
  KEY `IDX_6C047E64A640A07B` (`folder_pid`),
  KEY `is_active` (`is_active`),
  KEY `is_deleted` (`is_deleted`),
  KEY `position` (`position`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `engine_folders`
--

INSERT INTO `engine_folders` (`folder_id`, `folder_pid`, `title`, `is_file`, `position`, `uri_part`, `is_active`, `is_deleted`, `descr`, `meta`, `redirect_to`, `router_node_id`, `has_inherit_nodes`, `permissions`, `lockout_nodes`, `template_inheritable`, `template_self`, `create_by_user_id`, `create_datetime`) VALUES
(1, NULL, 'Главная', 0, 0, NULL, 1, 0, 'Корневая папка', 'N;', NULL, NULL, 1, 'N;', 'N;', NULL, NULL, 1, '2014-02-09 09:09:22'),
(2, 1, 'Blog', 0, 0, 'blog', 1, 0, 'Папка блога', 'N;', NULL, 3, 0, 'N;', 'N;', NULL, NULL, 0, '2014-02-09 09:09:22'),
(3, 1, 'News', 0, 0, 'news', 1, 0, 'Папка новостей', 'N;', NULL, 7, 0, 'N;', 'N;', NULL, NULL, 0, '2014-02-09 09:09:22'),
(4, 1, 'Pages', 0, 0, 'pages', 1, 0, 'Страницы сайта', 'N;', NULL, NULL, 0, 'N;', 'N;', NULL, NULL, 0, '2014-02-09 09:09:22'),
(5, 1, 'About Us', 0, 0, 'about', 1, 0, 'О сайте', 'N;', NULL, NULL, 0, 'N;', 'N;', NULL, NULL, 0, '2014-02-09 09:09:22'),
(6, 1, 'Feedback', 0, 0, 'feedback', 1, 0, 'О сайте', 'N;', NULL, NULL, 0, 'N;', 'N;', NULL, NULL, 0, '2014-02-09 09:09:22');

-- --------------------------------------------------------

--
-- Структура таблицы `engine_nodes`
--

DROP TABLE IF EXISTS `engine_nodes`;
CREATE TABLE IF NOT EXISTS `engine_nodes` (
  `node_id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_id` int(11) DEFAULT NULL,
  `block_id` smallint(6) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `params` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `template` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` smallint(6) DEFAULT NULL,
  `priority` smallint(6) NOT NULL,
  `is_cached` tinyint(1) DEFAULT NULL,
  `descr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_by_user_id` int(11) NOT NULL,
  `create_datetime` datetime NOT NULL,
  PRIMARY KEY (`node_id`),
  KEY `IDX_3055D1B7162CB942` (`folder_id`),
  KEY `IDX_3055D1B7E9ED820C` (`block_id`),
  KEY `is_active` (`is_active`),
  KEY `position` (`position`),
  KEY `module` (`module`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `engine_nodes`
--

INSERT INTO `engine_nodes` (`node_id`, `folder_id`, `block_id`, `is_active`, `module`, `params`, `template`, `position`, `priority`, `is_cached`, `descr`, `create_by_user_id`, `create_datetime`) VALUES
(1, 1, 2, 1, 'Menu', 'a:4:{s:5:"depth";d:0;s:8:"group_id";i:1;s:9:"css_class";s:3:"nav";s:20:"selected_inheritance";b:0;}', NULL, 0, 0, 0, 'Главное меню', 0, '2014-02-09 09:09:22'),
(2, 1, 4, 1, 'Breadcrumbs', 'a:2:{s:9:"delimiter";s:2:"»";s:17:"hide_if_only_home";b:1;}', NULL, 0, 0, 0, 'Хлебные крошки', 0, '2014-02-09 09:09:22'),
(3, 2, 1, 1, 'Blog', 'a:0:{}', NULL, 0, 0, 0, 'Блог', 0, '2014-02-09 09:09:22'),
(4, 1, 3, 1, 'Widget', 'a:3:{s:7:"node_id";s:1:"3";s:10:"controller";s:23:"BlogWidget:categoryTree";s:6:"params";N;}', NULL, 0, 0, 0, 'Категории блога', 0, '2014-02-09 09:09:22'),
(5, 1, 3, 1, 'Widget', 'a:3:{s:7:"node_id";s:1:"3";s:10:"controller";s:25:"BlogWidget:archiveMonthly";s:6:"params";N;}', NULL, 0, 0, 0, 'Архив блога', 0, '2014-02-09 09:09:22'),
(6, 1, 3, 1, 'Widget', 'a:3:{s:7:"node_id";s:1:"3";s:10:"controller";s:19:"BlogWidget:tagCloud";s:6:"params";N;}', NULL, 0, 0, 0, 'Облако тегов', 0, '2014-02-09 09:09:22'),
(7, 3, 1, 1, 'News', 'a:0:{}', NULL, 0, 0, 0, 'Новости', 0, '2014-02-09 09:09:22'),
(8, 5, 1, 1, 'Texter', 'a:2:{s:12:"text_item_id";i:1;s:6:"editor";b:1;}', NULL, 0, 0, 0, 'О сайте', 0, '2014-02-09 09:09:22'),
(9, 6, 1, 1, 'Feedback', 'a:0:{}', NULL, 0, 0, 0, 'Обратная связь', 0, '2014-02-09 09:09:22');

-- --------------------------------------------------------

--
-- Структура таблицы `engine_roles`
--

DROP TABLE IF EXISTS `engine_roles`;
CREATE TABLE IF NOT EXISTS `engine_roles` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `position` smallint(6) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `feedbacks`
--


-- --------------------------------------------------------

--
-- Структура таблицы `front_end_libraries`
--

DROP TABLE IF EXISTS `front_end_libraries`;
CREATE TABLE IF NOT EXISTS `front_end_libraries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `related_by` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `proirity` smallint(6) NOT NULL,
  `current_version` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `files` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1786D7FB5E237E06` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `front_end_libraries`
--

INSERT INTO `front_end_libraries` (`id`, `name`, `related_by`, `proirity`, `current_version`, `files`) VALUES
(1, 'jquery', NULL, 1000, '1.9.1', 'jquery.min.js'),
(2, 'bootstrap', 'jquery', 0, '2.3.2', 'css/bootstrap.min.css,css/bootstrap-responsive.min.css,js/bootstrap.min.js'),
(3, 'jquery-cookie', 'jquery', 0, '1.3.1', 'jquery.cookie.js'),
(4, 'less', NULL, 0, '1.3.3', 'less.min.js');

-- --------------------------------------------------------

--
-- Структура таблицы `front_end_libraries_paths`
--

DROP TABLE IF EXISTS `front_end_libraries_paths`;
CREATE TABLE IF NOT EXISTS `front_end_libraries_paths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lib_id` int(11) NOT NULL,
  `version` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `version_lib` (`version`,`lib_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `front_end_libraries_paths`
--

INSERT INTO `front_end_libraries_paths` (`id`, `lib_id`, `version`, `path`) VALUES
(1, 1, '1.9.1', 'jquery/1.9.1/'),
(2, 2, '2.3.2', 'bootstrap/2.3.2/'),
(3, 3, '1.3.1', 'jquery-cookie/1.3.1/'),
(4, 4, '1.3.3', 'less/1.3.3/');

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `folder_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `position` smallint(6) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `properties` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `create_by_user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `IDX_7D053A935550C4ED` (`pid`),
  KEY `IDX_7D053A93FE54D947` (`group_id`),
  KEY `IDX_7D053A93162CB942` (`folder_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `menu`
--

INSERT INTO `menu` (`item_id`, `pid`, `group_id`, `folder_id`, `is_active`, `position`, `title`, `descr`, `url`, `properties`, `create_by_user_id`, `created`, `updated`) VALUES
(1, NULL, 1, 1, 1, 0, 'Главная', NULL, NULL, 'N;', 1, '2014-02-09 09:09:22', NULL),
(2, NULL, 1, 5, 1, 0, 'О сайте', NULL, NULL, 'N;', 1, '2014-02-09 09:09:22', NULL),
(3, NULL, 1, 6, 1, 0, 'Контакты', NULL, NULL, 'N;', 1, '2014-02-09 09:09:22', NULL),
(4, NULL, 1, 2, 1, 0, 'Блог', NULL, NULL, 'N;', 1, '2014-02-09 09:09:22', NULL),
(5, NULL, 1, 3, 1, 0, 'Новости', NULL, NULL, 'N;', 1, '2014-02-09 09:09:22', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `menu_groups`
--

DROP TABLE IF EXISTS `menu_groups`;
CREATE TABLE IF NOT EXISTS `menu_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `position` smallint(6) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `properties` longtext COLLATE utf8_unicode_ci,
  `create_by_user_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `UNIQ_232A61A85E237E06` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `menu_groups`
--

INSERT INTO `menu_groups` (`group_id`, `position`, `name`, `descr`, `properties`, `create_by_user_id`, `created`) VALUES
(1, 0, 'Главное меню', NULL, NULL, 1, '2014-02-09 09:09:22');

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `annotation` longtext COLLATE utf8_unicode_ci,
  `text` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1DD39950989D9B62` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `title`, `slug`, `annotation`, `text`, `created`, `updated`) VALUES
(1, 'Сайт перешел на фреймворк Symfony2', 'moving_on_symfony2', 'Свершилось! После месяца интенсивных работ над движком SmartCore мы смогли перевести мой блог на Symfony2.', 'До этого момента блог работал на фреймворке Yii. Yii весьма неплох, но все же было принято решение осваивать Symfony2 и развивать движок SmartCore.Работа над ним и над самим сайтом продолжается. В планах создать функционал, не хуже чем на CMS Wordpress, а так же перевести магазин с CMS Joomla…', '2014-02-09 09:09:22', '2013-09-05 11:49:32'),
(2, 'Переезд с шаред-хостинга на VPS', 'moving_from_shared-hosting_on_vps', 'Наконец-то блог переместился с шаред-хостинга на VPS.', 'По цене получилось примерно тоже самое, но возможностей на VPS гораздо больше. И сайт шустрее работать стал.', '2014-02-09 09:09:22', '2013-09-05 09:10:55');

-- --------------------------------------------------------

--
-- Структура таблицы `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `session`
--

INSERT INTO `session` (`id`, `user_id`, `data`, `time`) VALUES
('6gan8bjt3h8tb2s8qd15fcrtt6', 2, '_sf2_attributes|a:9:{s:27:"genemu_form.captcha.options";a:12:{s:5:"width";i:100;s:6:"height";i:30;s:6:"format";s:3:"png";s:16:"background_color";s:6:"DDDDDD";s:12:"border_color";s:6:"000000";s:5:"chars";a:10:{i:0;i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:5;i:5;i:6;i:6;i:7;i:7;i:8;i:8;i:9;i:9;}s:6:"length";i:4;s:5:"fonts";a:5:{i:0;s:75:"E:/www/loc/Dmitxe/dmitxe_blog/app/../web/bundles/genemuform/fonts/akbar.ttf";i:1;s:78:"E:/www/loc/Dmitxe/dmitxe_blog/app/../web/bundles/genemuform/fonts/brushcut.ttf";i:2;s:76:"E:/www/loc/Dmitxe/dmitxe_blog/app/../web/bundles/genemuform/fonts/molten.ttf";i:3;s:78:"E:/www/loc/Dmitxe/dmitxe_blog/app/../web/bundles/genemuform/fonts/planetbe.ttf";i:4;s:77:"E:/www/loc/Dmitxe/dmitxe_blog/app/../web/bundles/genemuform/fonts/whoobub.ttf";}s:9:"font_size";i:18;s:10:"font_color";a:5:{i:0;s:6:"252525";i:1;s:6:"8B8787";i:2;s:6:"550707";i:3;s:6:"3526E6";i:4;s:6:"88531E";}s:9:"grayscale";b:0;s:4:"code";N;}s:19:"genemu_form.captcha";s:32:"38e0fea70e6ca1b6d7ce6f6d62f6b3ce";s:27:"_csrf/smart_module_feedback";s:43:"clI_1uZyq6sR-IWKe06IMKdTl97h_2oszdP_LEJa6js";s:18:"_csrf/authenticate";s:43:"0NkXUEzdAX-4yL-fMI7mGhM9tTST7Slv8j0Sy9XQ1Io";s:24:"_security_smart_core_cms";s:743:"C:74:"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken":655:{a:3:{i:0;N;i:1;s:11:"admin_login";i:2;s:607:"a:4:{i:0;C:42:"SmartCore\\Bundle\\FOSUserBundle\\Entity\\User":249:{a:2:{i:0;s:0:"";i:1;s:219:"a:9:{i:0;s:88:"mme+A0hyKPL1yoAef1fYD0NpKjDuRZyX+r/Pjss0BlGkyv5/kCMVSNvWjlY71KP48fzPaq9jeUeHQ+0i6rfCJg==";i:1;s:31:"la6i928s7y8w8wwg0w8ggo8880w84ww";i:2;s:4:"root";i:3;s:4:"root";i:4;b:0;i:5;b:0;i:6;b:0;i:7;b:1;i:8;i:2;}";}}i:1;b:1;i:2;a:2:{i:0;O:41:"Symfony\\Component\\Security\\Core\\Role\\Role":1:{s:47:"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role";s:16:"ROLE_SUPER_ADMIN";}i:1;O:41:"Symfony\\Component\\Security\\Core\\Role\\Role":1:{s:47:"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role";s:9:"ROLE_USER";}}i:3;a:0:{}}";}}";s:23:"_csrf/smart_core_folder";s:43:"wGQ9FPrbPeREHWN_NilQ4rh5iABBi4CJuu_WelSHzYM";s:21:"_csrf/smart_core_node";s:43:"ZiOlqRbY45ENUyKz27JPKOsP7nWfVBywXSCa9swvgW8";s:22:"_csrf/smart_core_block";s:43:"OPjrZBs1aWIV_5qB91EoQtHUzq5KwVevWguwa-x2IJk";s:21:"_csrf/smart_core_user";s:43:"VEFBJbQN4dx0gDYKo73BmAkF535vlFkCVt5pfZlvVS8";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:"u";i:1391923643;s:1:"c";i:1391923435;s:1:"l";s:1:"0";}', '2014-02-09 12:27:23'),
('9d5l7kqp2b8qsfjj0mrif415n5', 0, '_sf2_attributes|a:2:{s:33:"_security.admin_login.target_path";s:45:"http://dmitxe.mysite/admin/structure/block/3/";s:18:"_csrf/authenticate";s:43:"4o4JGELYmVkWAIqhaWfJl4a0ws-RNjTLXy1wI3BjYbQ";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:"u";i:1391922575;s:1:"c";i:1391922574;s:1:"l";s:1:"0";}', '2014-02-09 09:09:35'),
('eqa9migctlbd39tf4pf7okad06', 0, '_sf2_attributes|a:5:{s:27:"genemu_form.captcha.options";a:12:{s:5:"width";i:100;s:6:"height";i:30;s:6:"format";s:3:"png";s:16:"background_color";s:6:"DDDDDD";s:12:"border_color";s:6:"000000";s:5:"chars";a:10:{i:0;i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:5;i:5;i:6;i:6;i:7;i:7;i:8;i:8;i:9;i:9;}s:6:"length";i:4;s:5:"fonts";a:5:{i:0;s:75:"E:/www/loc/Dmitxe/dmitxe_blog/app/../web/bundles/genemuform/fonts/akbar.ttf";i:1;s:78:"E:/www/loc/Dmitxe/dmitxe_blog/app/../web/bundles/genemuform/fonts/brushcut.ttf";i:2;s:76:"E:/www/loc/Dmitxe/dmitxe_blog/app/../web/bundles/genemuform/fonts/molten.ttf";i:3;s:78:"E:/www/loc/Dmitxe/dmitxe_blog/app/../web/bundles/genemuform/fonts/planetbe.ttf";i:4;s:77:"E:/www/loc/Dmitxe/dmitxe_blog/app/../web/bundles/genemuform/fonts/whoobub.ttf";}s:9:"font_size";i:18;s:10:"font_color";a:5:{i:0;s:6:"252525";i:1;s:6:"8B8787";i:2;s:6:"550707";i:3;s:6:"3526E6";i:4;s:6:"88531E";}s:9:"grayscale";b:0;s:4:"code";N;}s:19:"genemu_form.captcha";s:32:"744078b7e19d39d1b0607b716e3268b9";s:27:"_csrf/smart_module_feedback";s:43:"clI_1uZyq6sR-IWKe06IMKdTl97h_2oszdP_LEJa6js";s:33:"_security.admin_login.target_path";s:28:"http://dmitxe-blog:88/admin/";s:18:"_csrf/authenticate";s:43:"0NkXUEzdAX-4yL-fMI7mGhM9tTST7Slv8j0Sy9XQ1Io";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:"u";i:1391923449;s:1:"c";i:1391923435;s:1:"l";s:1:"0";}', '2014-02-09 12:24:09'),
('esgbv56gpp768ttpdidbv099c5', 1, '_sf2_attributes|a:7:{s:18:"_csrf/authenticate";s:43:"4o4JGELYmVkWAIqhaWfJl4a0ws-RNjTLXy1wI3BjYbQ";s:24:"_security_smart_core_cms";s:745:"C:74:"Symfony\\Component\\Security\\Core\\Authentication\\Token\\UsernamePasswordToken":657:{a:3:{i:0;N;i:1;s:11:"admin_login";i:2;s:609:"a:4:{i:0;C:42:"SmartCore\\Bundle\\FOSUserBundle\\Entity\\User":251:{a:2:{i:0;s:0:"";i:1;s:221:"a:9:{i:0;s:88:"yAHc2VTy9+rgG1THHjcYqEXCx7KSgJ0xOwmLI/9kStyv/ZGcd0vISe01R6+RNWdCX9RAob2XVFIyEW3T268eYw==";i:1;s:31:"8nq4tqgz0cso808sc84kcoos40c8s00";i:2;s:5:"admin";i:3;s:5:"admin";i:4;b:0;i:5;b:0;i:6;b:0;i:7;b:1;i:8;i:1;}";}}i:1;b:1;i:2;a:2:{i:0;O:41:"Symfony\\Component\\Security\\Core\\Role\\Role":1:{s:47:"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role";s:16:"ROLE_SUPER_ADMIN";}i:1;O:41:"Symfony\\Component\\Security\\Core\\Role\\Role":1:{s:47:"\0Symfony\\Component\\Security\\Core\\Role\\Role\0role";s:9:"ROLE_USER";}}i:3;a:0:{}}";}}";s:22:"_csrf/smart_core_block";s:43:"4OLxFzPGa4cCLWx6G-TKtCjGTH6W3kz2iStTgTPXwG0";s:27:"genemu_form.captcha.options";a:12:{s:5:"width";i:100;s:6:"height";i:30;s:6:"format";s:3:"png";s:16:"background_color";s:6:"DDDDDD";s:12:"border_color";s:6:"000000";s:5:"chars";a:10:{i:0;i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:5;i:5;i:6;i:6;i:7;i:7;i:8;i:8;i:9;i:9;}s:6:"length";i:4;s:5:"fonts";a:5:{i:0;s:82:"D:/WebServers/home/dmitxe.mysite/www/app/../web/bundles/genemuform/fonts/akbar.ttf";i:1;s:85:"D:/WebServers/home/dmitxe.mysite/www/app/../web/bundles/genemuform/fonts/brushcut.ttf";i:2;s:83:"D:/WebServers/home/dmitxe.mysite/www/app/../web/bundles/genemuform/fonts/molten.ttf";i:3;s:85:"D:/WebServers/home/dmitxe.mysite/www/app/../web/bundles/genemuform/fonts/planetbe.ttf";i:4;s:84:"D:/WebServers/home/dmitxe.mysite/www/app/../web/bundles/genemuform/fonts/whoobub.ttf";}s:9:"font_size";i:18;s:10:"font_color";a:5:{i:0;s:6:"252525";i:1;s:6:"8B8787";i:2;s:6:"550707";i:3;s:6:"3526E6";i:4;s:6:"88531E";}s:9:"grayscale";b:0;s:4:"code";N;}s:19:"genemu_form.captcha";s:32:"b6f8d7bf9ae426aff4db46de660992a9";s:27:"_csrf/smart_module_feedback";s:43:"QD9Nw1PLrX_Lfc6ExRj0OnMOfo_bpwl2P836auSQd3c";s:21:"_csrf/smart_core_node";s:43:"k0rZ6CpV9JKD9Fcg5eKxgJOluukaQjSlaWumLN9fvUM";}_sf2_flashes|a:0:{}_sf2_meta|a:3:{s:1:"u";i:1391923058;s:1:"c";i:1391922574;s:1:"l";s:1:"0";}', '2014-02-09 09:17:41');

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
  `title_dublicates` int(11) NOT NULL,
  `lastmod` datetime DEFAULT NULL,
  `changefreq` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `priority` double DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_365093828852ACDC` (`loc`),
  KEY `title_hash` (`title_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `sitemap_urls`
--


-- --------------------------------------------------------

--
-- Структура таблицы `sliders`
--

DROP TABLE IF EXISTS `sliders`;
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `width` smallint(6) DEFAULT NULL,
  `height` smallint(6) DEFAULT NULL,
  `mode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `library` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slide_properties` longtext COLLATE utf8_unicode_ci,
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slider_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `file_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `original_file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` smallint(6) NOT NULL,
  `properties` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B8C02091D7DF1668` (`file_name`),
  KEY `IDX_B8C020912CCC9638` (`slider_id`),
  KEY `position` (`position`),
  KEY `user_id` (`user_id`)
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
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editor` smallint(6) NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci,
  `meta` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `created` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `texter`
--

INSERT INTO `texter` (`item_id`, `locale`, `editor`, `text`, `meta`, `created`, `user_id`) VALUES
(1, 'ru', 1, '<p>На этом сайте собраны различная полезная информация по тематике сайтостроения.</p>\r\n<p>Информация больше собрана для себя, впрочем, надеюсь, что она будет также полезна и другим программистам.</p>\r\n<p>Если Вам нужно создать сайт под ключ - свяжитесь со мной через <a href="/contacts/">форму обратной связи</a>.</p>\r\n<p>Данный блог написан на фреймворке <a href="http://symfony.com/" target="_blank">Symfony2</a>.</p>', 'a:0:{}', '2014-02-09 09:09:22', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `texter_history`
--

DROP TABLE IF EXISTS `texter_history`;
CREATE TABLE IF NOT EXISTS `texter_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_deleted` tinyint(1) NOT NULL,
  `item_id` int(11) NOT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `editor` smallint(6) NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `meta` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `created` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `is_deleted` (`is_deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `texter_history`
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
  `facebook_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`, `firstname`, `lastname`, `facebook_id`, `created`) VALUES
(1, 'admin', 'admin', 'XeDmitry@yandex.ru', 'xedmitry@yandex.ru', 1, '8nq4tqgz0cso808sc84kcoos40c8s00', 'yAHc2VTy9+rgG1THHjcYqEXCx7KSgJ0xOwmLI/9kStyv/ZGcd0vISe01R6+RNWdCX9RAob2XVFIyEW3T268eYw==', '2014-02-09 09:09:38', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}', 0, NULL, '', '', '', '2014-02-09 09:09:22'),
(2, 'root', 'root', 'root@mail.ru', 'root@mail.ru', 1, 'la6i928s7y8w8wwg0w8ggo8880w84ww', 'mme+A0hyKPL1yoAef1fYD0NpKjDuRZyX+r/Pjss0BlGkyv5/kCMVSNvWjlY71KP48fzPaq9jeUeHQ+0i6rfCJg==', '2014-02-09 12:24:12', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:16:"ROLE_SUPER_ADMIN";}', 0, NULL, '', '', '', '2014-02-09 09:09:22'),
(3, 'tester', 'tester', 'tester@mail.ru', 'tester@mail.ru', 1, 'm0pqnyqmd00c04cccgwkggkcggwkgkk', '9aE8CM1KWaZ0dkewc9KPFBnbr6ljh+P0sYuMseEXNp3uZ7NUwyujwQ/VUpSqFEGXIeendlp4CjNOD2KOtsIdTw==', NULL, 0, 0, NULL, NULL, NULL, 'a:0:{}', 0, NULL, '', '', '', '2014-02-09 09:09:22');

-- --------------------------------------------------------

--
-- Структура таблицы `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_FF8AB7E05E237E06` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `users_groups`
--

INSERT INTO `users_groups` (`id`, `name`, `roles`) VALUES
(1, 'blogger', 'a:1:{i:0;s:12:"ROLE_BLOGGER";}'),
(2, 'admin', 'a:1:{i:0;s:10:"ROLE_ADMIN";}');

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
-- Ограничения внешнего ключа таблицы `engine_blocks_inherit`
--
ALTER TABLE `engine_blocks_inherit`
  ADD CONSTRAINT `FK_372DC759162CB942` FOREIGN KEY (`folder_id`) REFERENCES `engine_folders` (`folder_id`),
  ADD CONSTRAINT `FK_372DC759E9ED820C` FOREIGN KEY (`block_id`) REFERENCES `engine_blocks` (`block_id`);

--
-- Ограничения внешнего ключа таблицы `engine_folders`
--
ALTER TABLE `engine_folders`
  ADD CONSTRAINT `FK_6C047E64A640A07B` FOREIGN KEY (`folder_pid`) REFERENCES `engine_folders` (`folder_id`);

--
-- Ограничения внешнего ключа таблицы `engine_nodes`
--
ALTER TABLE `engine_nodes`
  ADD CONSTRAINT `FK_3055D1B7E9ED820C` FOREIGN KEY (`block_id`) REFERENCES `engine_blocks` (`block_id`),
  ADD CONSTRAINT `FK_3055D1B7162CB942` FOREIGN KEY (`folder_id`) REFERENCES `engine_folders` (`folder_id`);

--
-- Ограничения внешнего ключа таблицы `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `FK_7D053A93162CB942` FOREIGN KEY (`folder_id`) REFERENCES `engine_folders` (`folder_id`),
  ADD CONSTRAINT `FK_7D053A935550C4ED` FOREIGN KEY (`pid`) REFERENCES `menu` (`item_id`),
  ADD CONSTRAINT `FK_7D053A93FE54D947` FOREIGN KEY (`group_id`) REFERENCES `menu_groups` (`group_id`);

--
-- Ограничения внешнего ключа таблицы `slides`
--
ALTER TABLE `slides`
  ADD CONSTRAINT `FK_B8C020912CCC9638` FOREIGN KEY (`slider_id`) REFERENCES `sliders` (`id`);

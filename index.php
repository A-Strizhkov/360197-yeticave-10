<?php
date_default_timezone_set("Europe/Moscow");
require_once('functions.php');
require_once('templates/date.php');
$page_content = include_template('main.php', ['categories' => $categories,'lots' => $lots]);
$layout_content = include_template('layout.php', [
    'content' => $page_content,
    'categories' => $categories,
    'title' => 'Главная страница',
    'is_auth' => rand(0, 1),
    'user_name' => 'Андрей',
]);
print ($layout_content);
?>




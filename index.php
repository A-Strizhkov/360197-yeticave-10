<?php
date_default_timezone_set("Europe/Moscow");
require_once('functions.php');
require_once('templates/date.php');
require_once 'init.php';
if (!$link) {
    $error = mysqli_connect_error();
    $content = include_template('error.php', ['error' => $error]);
}
else {
    $sql = 'SELECT `id`, `name`,`symbol_code` FROM categories';
    $result = mysqli_query($link, $sql);
    if ($result) {
        while($row = $result->fetch_assoc()){
            $categories[] = $row;
        }
    }
    else {
        $error = mysqli_error($link);
        $content = include_template('error.php', ['error' => $error]);
    }
}
    $sql = 'SELECT title, start_price, image_link, category_id FROM lots ORDER BY created_at DESC
LIMIT 1';
    if ($res = mysqli_query($link, $sql)) {
        while($row = $result->fetch_assoc()){
    // передаем в шаблон результат выполнения
             $content = include_template('main.php', ['lots' => $lots]);}
        }
    else {
        $content = include_template('error.php', ['error' => mysqli_error($link)]);
    }

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



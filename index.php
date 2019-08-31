<?php
date_default_timezone_set("Europe/Moscow");
require_once('functions.php');
require_once('templates/date.php');
require_once 'init.php';
//$con = mysqli_connect("localhost", "root", "12345", "yeticave");
//if ($con == false) {
//    print("Ошибка подключения: "
//        . mysqli_connect_error());
//}
//else {
//    print("Соединение установлено");
// выполнение запросов
//}
if (!$link) {
    $error = mysqli_connect_error();
    $content = include_template('error.php', ['error' => $error]);
}
else {
    $sql = 'SELECT `id`, `name` FROM categories';
    $result = mysqli_query($link, $sql);
    if ($result) {
        $categories = mysqli_fetch_all($result, MYSQLI_ASSOC);
    }
    else {
        $error = mysqli_error($link);
        $content = include_template('error.php', ['error' => $error]);
    }
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



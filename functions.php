<?php

function include_template($name, $data)
{
    $name = 'templates/' . $name;
    $result = '';

    if (!file_exists($name)) {
        return $result;
    }

    ob_start();
    extract($data);
    require $name;

    $result = ob_get_clean();

    return $result;
}

function format_price($num)
{
    ceil($num);

    if ($num >= 1000) {
        $num = number_format($num, 0, '', ' ');

    }

    return $num .= " ₽";
}

function esc($str)
{
    $text = strip_tags($str);

    return $text;
}

function format_date($dt_end)
{
    $dt_end = strtotime($dt_end); //получает unixtime введеной даты
    $dt_now = strtotime("now"); // получает unixtime  текущей даты и времени
    $dt_diff = $dt_end - $dt_now; // разница  между полученными значениями
    $hours = floor($dt_diff / 3600); // кол-во часов
    $minutes = floor(($dt_diff % 3600) / 60); // кол-во минут
    if ($hours < 10 ){
        $hours = str_pad($hours, 2, "0", STR_PAD_LEFT);
    }
    if ($minutes < 10){
        $minutes = str_pad($minutes, 2, "0", STR_PAD_LEFT);
    };
    $dt_return = array($hours,$minutes) ; // получает массив со значениями часов и минут

    return $dt_return;// возвращает массив
}
?>



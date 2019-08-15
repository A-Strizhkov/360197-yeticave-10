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
};

function format_price(
    $num
)
{
    ceil($num);

    if ($num >= 1000) {
        $num = number_format($num, 0, '', ' ');

    }

    return $num .= " ₽";
};

function esc($str
)
{
    //$text = htmlspecialchars($str);
    $text = strip_tags($str);

    return $text;
};

?>



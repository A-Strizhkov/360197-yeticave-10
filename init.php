<?php
require_once 'functions.php';
//require_once 'config/db.php';

$link = mysqli_connect("localhost", "root", "12345", "yeticave");
mysqli_set_charset($link, "utf8");
print_r ($link);

$categories = [];
$content = '';

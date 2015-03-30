<?php
$replacements=[
    "%PKG%"=>"assets",
    "%CLASSNAME%"=>ucfirst(explode("/",explode(".",$argv[1])[0])[count(explode("/",explode(".",$argv[1])[0]))-1]),
    "%FILENAME%"=>$argv[1]
];
$conts=str_replace(array_keys($replacements),array_values($replacements),file_get_contents("templates/img.as"));
file_put_contents("src/assets/".ucfirst(explode("/",explode(".",$argv[1])[0])[count(explode("/",explode(".",$argv[1])[0]))-1]).".as",$conts);
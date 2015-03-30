<?php
$conts="";
$conts=file_get_contents("templates/makefile.in");
$econts=explode("\n",$conts);
$svars=explode(",",array_shift($econts));
$conts=join("\n",$econts);
foreach($svars as $var)
{
  list($name,$value)=explode("=",$var);
  $vars[$name]=$value;
}
$vardeclarations="";
foreach($vars as $name=>$value)
{
  $vardeclarations.="$name:=$(shell cat .settings/$name 2>>/dev/null)".PHP_EOL;
}
$resetsettings="reset-settings:".PHP_EOL."\tmkdir -p .settings".PHP_EOL;
foreach($vars as $name=>$value)
{
  $resetsettings.="\techo \"$value\">.settings/$name".PHP_EOL;
}
$setdefault="setdefault:".PHP_EOL;
foreach($vars as $name=>$value)
{
  $setdefault.="\techo \"$($name)\">.settings/$name".PHP_EOL;
}
$conts=$vardeclarations.$conts.$resetsettings.$setdefault;
file_put_contents("makefile",$conts);

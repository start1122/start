<?php

function create_file(string $filename){
//检测文件是否存在，不存在则创建
	
if(file_exists($filename))
	{
		return false;
	}

//检测目录是否存在，不存在则创建

if(!file_exists(dirname($filename)))

//创建目录，可以创建多级

	{
	mkdir(dirname($filename),0777,true);
	}


if(file_put_contents($filename,'')!==false)  //文件投放路径


	{
	return true;
	}
	return false;
	
}//function 闭环完成  一个func一个功能，  func后面属于功能的命名， 使用时调用该功能即可即可即可即可即可可可可可可

	
var_dump(create_file('a/4.txt'));


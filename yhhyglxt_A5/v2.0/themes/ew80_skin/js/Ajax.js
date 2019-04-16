function createxmlhttp()
	{
		xmlhttpobj = false;
		try{
			xmlhttpobj = new XMLHttpRequest;
		}catch(e){
			try{
				xmlhttpobj=new ActiveXObject("MSXML2.XMLHTTP");
			}catch(e2){
				try{
					xmlhttpobj=new ActiveXObject("Microsoft.XMLHTTP");
				}catch(e3){
					xmlhttpobj = false;
				}
			}
		}
		return xmlhttpobj; 
	}

function checkcompany(Company)
	{
		var xmlhttpobj = createxmlhttp();
		if(xmlhttpobj){
			xmlhttpobj.open('GET',"../Skin/Default/Js/Ajax.asp?action=Companys&Company="+escape(Company)+ "&number="+Math.random()+"",true);
			xmlhttpobj.onreadystatechange=function(){
				if(xmlhttpobj.readyState == 4){		//客户端完成请求
					  if(xmlhttpobj.status == 200){	//服务端完成处理并返回数据
						  var ResponseText = xmlhttpobj.responseText;
						  if(ResponseText == ""){	//service返回了错误信息
								//alert("yes");
							  document.getElementById("check1").innerHTML = ResponseText;
						  }else{
							  //alert("no");
							  document.getElementById("check1").innerHTML = ResponseText;
						  }
					  }else{
						  document.getElementById("check1").innerHTML = '读取错误';//服务器出现异常
					  }
				  }else{
						document.getElementById("check1").innerHTML = '正在加载...';//请求未完成时的提示信息
				}
			}
			xmlhttpobj.send(null);//向服务器发送请求
		}else{
			document.getElementById("check1").innerHTML = '浏览器不兼容';//创建未成功
		}
	}

	
function getArea(AreaData)
	{
		if(AreaData==0){
			document.getElementById("Squarediv").innerHTML="<select name='Squares' class='int'><option value='' selected>未选择大类</option></select>";
			return;
		};
		var xmlhttpobj = createxmlhttp();
		if(xmlhttpobj){
			xmlhttpobj.open('GET',"../Skin/Default/Js/Ajax.asp?action=Area&AreaData="+escape(AreaData)+ "&number="+Math.random()+"",true);
			xmlhttpobj.onreadystatechange=function(){
				if(xmlhttpobj.readyState == 4){		//客户端完成请求
					  if(xmlhttpobj.status == 200){	//服务端完成处理并返回数据
						  var ResponseText = xmlhttpobj.responseText;
						  if(ResponseText == ""){	//service返回了错误信息
								//alert("yes");
							  document.getElementById("Squarediv").innerHTML = ResponseText;
						  }else{
							  //alert("no");
							  document.getElementById("Squarediv").innerHTML = ResponseText;
						  }
					  }else{
						  document.getElementById("Squarediv").innerHTML = '读取错误';//服务器出现异常
					  }
				  }else{
						document.getElementById("Squarediv").innerHTML = '正在加载...';//请求未完成时的提示信息
				}
			}
			xmlhttpobj.send(null);//向服务器发送请求
		}else{
			document.getElementById("Squarediv").innerHTML = '浏览器不兼容';//创建未成功
		}
	}
	
	function getSquare(str){
		document.getElementById('Square').value= str.value ;
	}
	
function getTrade(TradeData)
	{
		if(TradeData==0){
			document.getElementById("Stradediv").innerHTML="<select name='Strade' class='int'><option value='' selected>未选择大类</option></select>";
			return;
		};
		var xmlhttpobj = createxmlhttp();
		if(xmlhttpobj){
			xmlhttpobj.open('GET',"../Skin/Default/Js/Ajax.asp?action=Trade&TradeData="+escape(TradeData)+ "&number="+Math.random()+"",true);
			xmlhttpobj.onreadystatechange=function(){
				if(xmlhttpobj.readyState == 4){		//客户端完成请求
					  if(xmlhttpobj.status == 200){	//服务端完成处理并返回数据
						  var ResponseText = xmlhttpobj.responseText;
						  if(ResponseText == ""){	//service返回了错误信息
								//alert("yes");
							  document.getElementById("Stradediv").innerHTML = ResponseText;
						  }else{
							  //alert("no");
							  document.getElementById("Stradediv").innerHTML = ResponseText;
						  }
					  }else{
						  document.getElementById("Stradediv").innerHTML = '读取错误';//服务器出现异常
					  }
				  }else{
						document.getElementById("Stradediv").innerHTML = '正在加载...';//请求未完成时的提示信息
				}
			}
			xmlhttpobj.send(null);//向服务器发送请求
		}else{
			document.getElementById("Stradediv").innerHTML = '浏览器不兼容';//创建未成功
		}
	}
	function getStrade(str){
		document.getElementById('Strade').value= str.value ;
	}
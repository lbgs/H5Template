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
				if(xmlhttpobj.readyState == 4){		//�ͻ����������
					  if(xmlhttpobj.status == 200){	//�������ɴ�����������
						  var ResponseText = xmlhttpobj.responseText;
						  if(ResponseText == ""){	//service�����˴�����Ϣ
								//alert("yes");
							  document.getElementById("check1").innerHTML = ResponseText;
						  }else{
							  //alert("no");
							  document.getElementById("check1").innerHTML = ResponseText;
						  }
					  }else{
						  document.getElementById("check1").innerHTML = '��ȡ����';//�����������쳣
					  }
				  }else{
						document.getElementById("check1").innerHTML = '���ڼ���...';//����δ���ʱ����ʾ��Ϣ
				}
			}
			xmlhttpobj.send(null);//���������������
		}else{
			document.getElementById("check1").innerHTML = '�����������';//����δ�ɹ�
		}
	}

	
function getArea(AreaData)
	{
		if(AreaData==0){
			document.getElementById("Squarediv").innerHTML="<select name='Squares' class='int'><option value='' selected>δѡ�����</option></select>";
			return;
		};
		var xmlhttpobj = createxmlhttp();
		if(xmlhttpobj){
			xmlhttpobj.open('GET',"../Skin/Default/Js/Ajax.asp?action=Area&AreaData="+escape(AreaData)+ "&number="+Math.random()+"",true);
			xmlhttpobj.onreadystatechange=function(){
				if(xmlhttpobj.readyState == 4){		//�ͻ����������
					  if(xmlhttpobj.status == 200){	//�������ɴ�����������
						  var ResponseText = xmlhttpobj.responseText;
						  if(ResponseText == ""){	//service�����˴�����Ϣ
								//alert("yes");
							  document.getElementById("Squarediv").innerHTML = ResponseText;
						  }else{
							  //alert("no");
							  document.getElementById("Squarediv").innerHTML = ResponseText;
						  }
					  }else{
						  document.getElementById("Squarediv").innerHTML = '��ȡ����';//�����������쳣
					  }
				  }else{
						document.getElementById("Squarediv").innerHTML = '���ڼ���...';//����δ���ʱ����ʾ��Ϣ
				}
			}
			xmlhttpobj.send(null);//���������������
		}else{
			document.getElementById("Squarediv").innerHTML = '�����������';//����δ�ɹ�
		}
	}
	
	function getSquare(str){
		document.getElementById('Square').value= str.value ;
	}
	
function getTrade(TradeData)
	{
		if(TradeData==0){
			document.getElementById("Stradediv").innerHTML="<select name='Strade' class='int'><option value='' selected>δѡ�����</option></select>";
			return;
		};
		var xmlhttpobj = createxmlhttp();
		if(xmlhttpobj){
			xmlhttpobj.open('GET',"../Skin/Default/Js/Ajax.asp?action=Trade&TradeData="+escape(TradeData)+ "&number="+Math.random()+"",true);
			xmlhttpobj.onreadystatechange=function(){
				if(xmlhttpobj.readyState == 4){		//�ͻ����������
					  if(xmlhttpobj.status == 200){	//�������ɴ�����������
						  var ResponseText = xmlhttpobj.responseText;
						  if(ResponseText == ""){	//service�����˴�����Ϣ
								//alert("yes");
							  document.getElementById("Stradediv").innerHTML = ResponseText;
						  }else{
							  //alert("no");
							  document.getElementById("Stradediv").innerHTML = ResponseText;
						  }
					  }else{
						  document.getElementById("Stradediv").innerHTML = '��ȡ����';//�����������쳣
					  }
				  }else{
						document.getElementById("Stradediv").innerHTML = '���ڼ���...';//����δ���ʱ����ʾ��Ϣ
				}
			}
			xmlhttpobj.send(null);//���������������
		}else{
			document.getElementById("Stradediv").innerHTML = '�����������';//����δ�ɹ�
		}
	}
	function getStrade(str){
		document.getElementById('Strade').value= str.value ;
	}
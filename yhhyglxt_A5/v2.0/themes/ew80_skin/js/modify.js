/* idΪҪ�޸ĵļ�¼ID,v�ǵ�ǰĬ��ֵ,tablename����,fnameΪ�ֶ���,gnameΪid���ֶ��� */
function forder(id,v,tablename,fname,gname,str5)
{
	str='<input type="text" size="3" value="'+id+'">';
	
	str2='<input id="kk'+id+'" type="text" style="border:1px solid #ddd; ime-mode:Disabled; cursor:hand;width:80px;" value="'+v+'" onblur="fchangeorder('+id+',this.value,\''+v+'\',\''+tablename+'\',\''+fname+'\',\''+gname+'\',\''+str5+'\');">';
	
	$("#"+str5+id).html(str2);		
	$("#kk"+id).focus();
	$("#kk"+id).select();
}
/* idΪ��¼ID,v1ΪĬ��ֵ,vΪ�޸ĺ��ֵ,fnameΪ�ֶ���,gnameΪID�ֶ������Զ���ŵ��Ǹ��ֶε��ֶ���,str5Ϊҳ�����Ǹ�span��ID */
function fchangeorder(id,v,v1,t1,fname,gname,str5)
{	
	 $.post("../Skin/Default/Js/modify.asp",{id:id,v:v,t1:t1,fname:fname,gname:gname},
		 function(data){			 	
			if(data==1)
			{
				
				str='<input type="text" value="'+v+'" style="border:1px solid #fff; ime-mode:Disabled; cursor:hand;width:80px;" onClick="forder(\''+id+'\',\''+v+'\',\''+t1+'\',\''+fname+'\',\''+gname+'\',\''+str5+'\');">'
				$("#"+str5+id).html(str);
			}
			else
			{
				$("#"+str5+id).html(v1);
			}			
		 }   
	 );  
}
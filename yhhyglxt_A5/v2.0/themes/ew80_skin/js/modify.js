/* id为要修改的记录ID,v是当前默认值,tablename表名,fname为字段名,gname为id的字段名 */
function forder(id,v,tablename,fname,gname,str5)
{
	str='<input type="text" size="3" value="'+id+'">';
	
	str2='<input id="kk'+id+'" type="text" style="border:1px solid #ddd; ime-mode:Disabled; cursor:hand;width:80px;" value="'+v+'" onblur="fchangeorder('+id+',this.value,\''+v+'\',\''+tablename+'\',\''+fname+'\',\''+gname+'\',\''+str5+'\');">';
	
	$("#"+str5+id).html(str2);		
	$("#kk"+id).focus();
	$("#kk"+id).select();
}
/* id为记录ID,v1为默认值,v为修改后的值,fname为字段名,gname为ID字段名，自动编号的那个字段的字段名,str5为页面上那个span的ID */
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
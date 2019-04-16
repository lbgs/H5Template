$(document).ready(function(){
	$('ul li a').bind("click",function(){
		$('ul > li > a').each(function(i){
			$(this).removeClass("active");
		});
		this.blur();
		this.className = "active";
	})
});
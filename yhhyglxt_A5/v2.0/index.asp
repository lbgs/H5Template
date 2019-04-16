<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><%=webname%></title>
<meta name="description" content="<%=descriptions%>">
<meta name="keyword" content="<%=keywords%>">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="/theme/default/images/favicon.png">
<link href="css/amazeui.min.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/time.js"></script>
<script src="js/popup.mini.js"></script>
<SCRIPT language="javascript">
function browserRedirect() {
    var sUserAgent = navigator.userAgent.toLowerCase();
    var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
    var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
    var bIsMidp = sUserAgent.match(/midp/i) == "midp";
    var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
    var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
    var bIsAndroid = sUserAgent.match(/android/i) == "android";
    var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
    var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
    if ((bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) ){
        window.location.href="wap/";
    }
}
browserRedirect();
</SCRIPT>
<style type="text/css">
<!--
.user {
	width: 800px;
	margin-top: 80px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
	text-align: center;
}
.user .text{
	height: 45px;
	width: 100%;
	font-size: 20px;
	line-height: 35px;
}
.user .img{
	padding: 10px;
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
<body>
<%response.write("<script>parent.location.replace('wap');</script>")
%>
</body>
</html>
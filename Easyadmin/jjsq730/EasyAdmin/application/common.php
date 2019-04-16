<?php

use think\Db;
use app\common\model\AuthRule as AuthRuleModel;
use app\common\Hook;
use think\Hook AS thinkHook;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
use think\Request;

use think\Cache;
use think\Loader;
use think\Url;

function getgradenamebyid($id){
	$name=Db::name('usergrade')->where('id',$id)->value('name');
	return $name;
}
function routerurl($url,$arr=array()){
	if(empty($arr)){
		$str=url($url);
	}else{
		$str=url($url,$arr);
	}
	
	
	$str=str_replace('admin.php', 'index.php', $str);
	
	return $str;
}

function remove_xss($val)
{
	$val = htmlspecialchars_decode($val);
	$val = strip_tags($val, '<img><attach><u><p><b><i><a><strike><pre><code><font><blockquote><span><ul><li><table><tbody><tr><td><ol><iframe><embed>');
	$val = preg_replace('/([\x00-\x08,\x0b-\x0c,\x0e-\x19])/', '', $val);
	$search = 'abcdefghijklmnopqrstuvwxyz';
	$search .= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
	$search .= '1234567890!@#$%^&*()';
	$search .= '~`";:?+/={}[]-_|\'\\';
	for ($i = 0; $i < strlen($search); $i++) {
		$val = preg_replace('/(&#[xX]0{0,8}'.dechex(ord($search[$i])).';?)/i', $search[$i], $val);
		$val = preg_replace('/(�{0,8}'.ord($search[$i]).';?)/', $search[$i], $val);
	}
	
	$ra1 = array('embed', 'iframe', 'frame', 'ilayer', 'layer', 'javascript', 'vbscript', 'expression', 'applet', 'meta', 'xml', 'blink', 'link', 'script', 'object', 'frameset', 'bgsound', 'title', 'base');
	$ra2 = array('onabort', 'onactivate', 'onafterprint', 'onafterupdate', 'onbeforeactivate', 'onbeforecopy', 'onbeforecut', 'onbeforedeactivate', 'onbeforeeditfocus', 'onbeforepaste', 'onbeforeprint', 'onbeforeunload', 'onbeforeupdate', 'onblur', 'onbounce', 'oncellchange', 'onchange', 'onclick', 'oncontextmenu', 'oncontrolselect', 'oncopy', 'oncut', 'ondataavailable', 'ondatasetchanged', 'ondatasetcomplete', 'ondblclick', 'ondeactivate', 'ondrag', 'ondragend', 'ondragenter', 'ondragleave', 'ondragover', 'ondragstart', 'ondrop', 'onerror', 'onerrorupdate', 'onfilterchange', 'onfinish', 'onfocus', 'onfocusin', 'onfocusout', 'onhelp', 'onkeydown', 'onkeypress', 'onkeyup', 'onlayoutcomplete', 'onload', 'onlosecapture', 'onmousedown', 'onmouseenter', 'onmouseleave', 'onmousemove', 'onmouseout', 'onmouseover', 'onmouseup', 'onmousewheel', 'onmove', 'onmoveend', 'onmovestart', 'onpaste', 'onpropertychange', 'onreadystatechange', 'onreset', 'onresize', 'onresizeend', 'onresizestart', 'onrowenter', 'onrowexit', 'onrowsdelete', 'onrowsinserted', 'onscroll', 'onselect', 'onselectionchange', 'onselectstart', 'onstart', 'onstop', 'onsubmit', 'onunload');
	$ra = array_merge($ra1, $ra2);

	$found = true;
	while ($found == true) {
		$val_before = $val;
		for ($i = 0; $i < sizeof($ra); $i++) {
			$pattern = '/';
			for ($j = 0; $j < strlen($ra[$i]); $j++) {
				if ($j > 0) {
					$pattern .= '(';
					$pattern .= '(&#[xX]0{0,8}([9ab]);)';
					$pattern .= '|';
					$pattern .= '|(�{0,8}([9|10|13]);)';
					$pattern .= ')*';
				}
				$pattern .= $ra[$i][$j];
			}
			$pattern .= '/i';
			$replacement = substr($ra[$i], 0, 2).'<x>'.substr($ra[$i], 2);
			$val = preg_replace($pattern, $replacement, $val);
			if ($val_before == $val) {
				$found = false;
			}
		}
	}
	$val=htmlspecialchars($val);
	return $val;
}
function point_note($score,$uid,$controller,$pointid=0){
	
	
	if($score!=0){
		
		if($controller=='login'){
		
			$time=time();
			$maptime['add_time']=array('gt',$time-24*60*60);
			$maptime['uid']=$uid;
			$maptime['controller']='login';
		
			$count=Db::name('point_note')->where($maptime)->count();
			if($count>0){
					
			}else{
				Db::name('user')->where('id',$uid)->setInc('point',$score);
				$data['uid']=$uid;
				$data['add_time']=time();
				$data['controller']=$controller;
				$data['score']=$score;
				$data['pointid']=$pointid;
				Db::name('point_note')->insert($data);
				//根据用户积分提升或降低用户等级
		
				$data=Db::name('user')->where('id',$uid)->find();
		
		
		
				$map['score']=array('elt',$data['point']);
		
				$res=Db::name('usergrade')->where($map)->order('score desc')->limit(1)->value('id');
		
				if(!empty($res)&&$res!=$data['grades']){
					Db::name('user')->where('id',$uid)->setField('grades',$res);
				}
			}
		}else{
		
			Db::name('user')->where('id',$uid)->setInc('point',$score);
			$data['uid']=$uid;
			$data['add_time']=time();
			$data['controller']=$controller;
			$data['score']=$score;
			$data['pointid']=$pointid;
			Db::name('point_note')->insert($data);
			//根据用户积分提升或降低用户等级
		
			$data=Db::name('user')->where('id',$uid)->find();
		
		
		
			$map['score']=array('elt',$data['point']);
		
			$res=Db::name('usergrade')->where($map)->order('score desc')->limit(1)->value('id');
		
			if(!empty($res)&&$res!=$data['grades']){
				Db::name('user')->where('id',$uid)->setField('grades',$res);
			}
		
		
		}
		
		
		
		
		
	}
	

	
	

	
	return;
	
	
}
function getpoint($uid,$controller,$pointid){
	$map['uid']=$uid;
	$map['pointid']=$pointid;
	$map['controller']=$controller;
	$res=Db::name('Point_note')->where($map)->value('score');
	return $res;
}



/**
 * 加载模型
 */
function load_model($name = '', $module = '')
{

	// 回溯跟踪
	$backtrace_array = debug_backtrace(false, 1);

	// 调用者目录名称
	$current_directory_name = basename(dirname($backtrace_array[0]['file']));

	// 设置模块
	!empty($module) && $name = $module.'/'.$name;

	// 返回的对象
	$return_object = null;

	// 加载模型规则
	switch ($current_directory_name) {

		case LAYER_CONTROLLER_NAME : $return_object = model($name, LAYER_LOGIC_NAME); break;
		case LAYER_LOGIC_NAME      : $return_object = model($name, LAYER_MODEL_NAME); break;
		case LAYER_SERVICE_NAME    : $return_object = model($name, LAYER_MODEL_NAME); break;
		case LAYER_MODEL_NAME      : $return_object = model($name, LAYER_MODEL_NAME); break;
		default                    : $return_object = model($name, LAYER_LOGIC_NAME); break;
	}

	return $return_object;
}

/**
 * 获取插件类的类名
 * @param $name 插件名
 * @param string $type 返回命名空间类型
 * @param string $class 当前类名
 * @return string
 */
function get_addon_class($name = '', $class = null)
{

	$name = \think\Loader::parseName($name);

	$class = \think\Loader::parseName(is_null($class) ? $name : $class, 0);

	return $namespace = "addons\\" . $name . "\\" . $class;
}


function D($name='',$layer='') {
	
	if(empty($name)) return new Think\Model;
	static $_model  =   array();
	$layer          =   $layer? :'model';
	
	
	
	
	if(isset($_model[$name]))
		return $_model[$name];
	$class          =   parse_res_name($name,$layer);
	
	if(class_exists($class)) {
		$model      =   new $class(basename($name));
	}elseif(false === strpos($name,'/')){
		// 自动加载公共模块下面的模型
		
			$class      =   '\\common\\'.$layer.'\\'.$name;
		
		$model      =   class_exists($class)? new $class($name) : new Think\Model($name);
	}else {
		Think\Log::record('D方法实例化没找到模型类'.$class,Think\Log::NOTICE);
		$model      =   new Think\Model(basename($name));
	}
	$_model[$name.$layer]  =  $model;
	
	return $model;
}

/**
 * 字符串命名风格转换
 * type 0 将Java风格转换为C的风格 1 将C风格转换为Java的风格
 * @param string $name 字符串
 * @param integer $type 转换类型
 * @return string
 */
function parse_name($name, $type=0) {
	if ($type) {
		return ucfirst(preg_replace_callback('/_([a-zA-Z])/', function($match){return strtoupper($match[1]);}, $name));
	} else {
		return strtolower(trim(preg_replace("/[A-Z]/", "_\\0", $name), "_"));
	}
}
/**
 * 解析资源地址并导入类库文件
 * 例如 module/controller addon://module/behavior
 * @param string $name 资源地址 格式：[扩展://][模块/]资源名
 * @param string $layer 分层名称
 * @return string
 */
function parse_res_name($name,$layer,$level=1){
	if(strpos($name,'://')) {// 指定扩展资源
		list($extend,$name)  =   explode('://',$name);
	}else{
		$extend  =   '';
	}
	if(strpos($name,'/') && substr_count($name, '/')>=$level){ // 指定模块
		list($module,$name) =  explode('/',$name,2);
	}else{
		$module =   Request::instance()->module();
	}
	$array  =   explode('/',$name);
	$class  =   $module.'\\'.$layer;
	
	foreach($array as $name){
		$class  .=   '\\'.parse_name($name, 1);
	}


	// 导入资源类库
	if($extend){ // 扩展资源
		$class      =  $extend.'\\'.$class;
	}
	
	return $class;//.$layer;
}
function AURL($name,$layer='',$level=0) {
	static $_action = array();
	$layer  =   $layer? : 'Controller';

	$class  =   parse_res_name($name,$layer);
   
    return $class;
}
function A($name,$layer='',$level=0) {
	static $_action = array();
	$layer  =   $layer? : 'controller';
	
	
	if(isset($_action[$name.$layer]))
		return $_action[$name.$layer];

	$class  =   parse_res_name($name,$layer);

	if(class_exists($class)) {
		$action             =   new $class();
		$_action[$name.$layer]     =   $action;
		
	
		
		return $action;
	}else {
		return false;
	}
}
function get_cover($cover_id, $field = null)
{
	if (empty($cover_id)) {
		return false;
	}
	$picture = Db::name('file')->find($cover_id);



	return WEB_URL.$picture[$field];
}


function gethook($controller,$name){
	
	Hook::call($controller ,$name);
	
}

function int_to_string(&$data,$map=array('status'=>array(1=>'正常',-1=>'删除',0=>'禁用',2=>'未审核',3=>'草稿'))) {
	if($data === false || $data === null ){
		return $data;
	}
	$data = (array)$data;
	foreach ($data as $key => $row){
		foreach ($map as $col=>$pair){
			if(isset($row[$col]) && isset($pair[$row[$col]])){
				$data[$key][$col.'_text'] = $pair[$row[$col]];
			}
		}
	}
	return $data;
}
/**
 * 字符串转换为数组，主要用于把分隔符调整到第二个参数
 * @param  string $str  要分割的字符串
 * @param  string $glue 分割符
 * @return array
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function str2arr($str, $glue = ','){
	return explode($glue, $str);
}
/**
 * 数组转换为字符串，主要用于把分隔符调整到第二个参数
 * @param  array  $arr  要连接的数组
 * @param  string $glue 分割符
 * @return string
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function arr2str($arr, $glue = ','){
	return implode($glue, $arr);
}
/**
 * 对查询结果集进行排序
 * @access public
 * @param array  $list 查询结果
 * @param string $field 排序的字段名
 * @param array  $sortby 排序类型
 * asc正向排序 desc逆向排序 nat自然排序
 * @return array
 */
function list_sort_by($list, $field, $sortby = 'asc')
{
	
	if (is_array($list)) {
		$refer =array(); $resultSet = array();
		
		foreach ($list as $i => $data){
			
			
			$refer[$i] = $data[$field];
			
		}
			
		
		switch ($sortby) {
			case 'asc': // 正向排序
				asort($refer);
				break;
			case 'desc': // 逆向排序
				arsort($refer);
				break;
			case 'nat': // 自然排序
				natcasesort($refer);
				break;
		}
		foreach ($refer as $key => $val)
			$resultSet[] = & $list[$key];
		return $resultSet;
	}
	return false;
}

/**
 * 处理插件钩子
 * @param string $hook 钩子名称
 * @param mixed  $params 传入参数
 * @return void
 */
function hook($hook, $params = array())
{

	\Think\Hook::listen($hook, $params);
}



/**
 * 获取插件类的配置文件数组
 * @param string $name 插件名
 */
function get_addon_config($name)
{
	$class = get_addon_class($name);
	if (class_exists($class)) {
		$addon = new $class();
		return $addon->getConfig();
	} else {
		return array();
	}
}

function addonurl($name,$action){
	
	
	return get_addon_class($name).'\\'.$action;
	
	
}

/**
 * 插件显示内容里生成访问插件的url
 * @param string $url url
 * @param array  $param 参数
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function addons_url($url, $param = array(),$json=false)
{
	$url        =  parse_url($url);
	$addons     =  $url['scheme'];
	$controller =  $url['host'];
	$action     =  $url['path'];
	
	/* 基础参数 */
	$params_array = array(
			'addon_name'      => $addons,
			'controller_name' => $controller,
			'action_name'     => substr($action, 1),
			'json'=>$json
	);
	
	$params = array_merge($params_array, $param); //添加额外参数
	
	return url('addons/execute', $params);
	
	


}
















function userhead($userhead){
	if($userhead==''){
		return '/public/images/default.png';
	}else{
		return $userhead;
	}
}
function getweburl($controller,$action,$name='',$value=''){
	if (Cache::has('site_config')) {
		$site_config = Cache::get('site_config');
	} else {
		$site_config = Db::name('system')->field('value')->where('name', 'site_config')->find();
		$site_config = unserialize($site_config['value']);
		Cache::set('site_config', $site_config);
	}
	
	if($site_config['site_wjt']==1){
		if($name!=''){
			$arr=array($name=>$value);
			$url=url($controller."/".$action,$arr);
		}else{
			$url=url($controller."/".$action);
		}
		
	}else{
	if($name!=''){
			$arr=array($name=>$value);
			$url=url($controller."/".$action,$arr);
		}else{
			$url=url($controller."/".$action);
		}
	}
	
	return $url;
	
}
function sendmail($switch){
	
	ignore_user_abort();//关闭浏览器后，继续执行php代码
	set_time_limit(0);//程序执行时间无限制
	$sleep_time = 5;//多长时间执行一次
	
	while($switch){
		
		$msg=date("Y-m-d H:i:s").$switch;
		file_put_contents("log.log",$msg,FILE_APPEND);//记录日志
		sleep($sleep_time);//等待时间，进行下一次操作。
	}
	exit();
	
}
function getbaseurl(){
	$baseUrl = str_replace('\\','',dirname($_SERVER['SCRIPT_NAME']));
    $baseUrl = empty($baseUrl) ? '/' : '/'.trim($baseUrl,'/').'/';
    return $baseUrl;
}
function asyn_sendmail($data)
{
	$query = http_build_query($data);
	$request = Request::instance();
	//$baseUrl = str_replace('\\','',dirname($_SERVER['SCRIPT_NAME']));
    	//$baseUrl = empty($baseUrl) ? '/' : '/'.trim($baseUrl,'/').'/';
	$domain=$_SERVER['HTTP_HOST'];

	$url='http://'.$domain.getbaseurl().'index.php/Index/send_mail/'.'?'.$query;

	

	
	$par=time();
	//$sessionid=session_id();
	
	
	
	$fp = stream_socket_client("tcp://".$domain.":80", $errno, $errstr, 3);
	$out="POST ".$url." HTTP/1.1\r\n";
	$out.="Host: typecho.org\r\n";
	//$out.="User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13"."\r\n";
	$out.="Content-type: application/x-www-form-urlencoded\r\n";
	//$out.="PHPSESSID=".$sessionid."0\r\n";
	$out.="Content-Length: " . strlen($par) . "\r\n";
	$out.="Connection: close\r\n\r\n";
	$out.=$par."\r\n\r\n";
	fputs($fp, $out);
	
	
	
	

/* 
	
while (!feof($fp))
{
    echo fgets($fp, 1280);
}   */
fclose($fp); 




}
/*	$domain=$_SERVER['HTTP_HOST'];

	$url=url('Index/send_mail',array('email'=>$email));
	
	$par=time();

	$header="GET $url HTTP/1.0\r\n";

	$header.="Content-Type: application/x-www-form-urlencoded\r\n";

	$header.="Content-Length: ".strlen($par)."\r\n\r\n";

	$fp=stream_socket_client($domain.':80',$errno,$errstr,30);

	fputs($fp,$header.$par);
	
	echo fputs($fp,$header.$par);
	fclose($fp); */

	

/**
 * 用常规方式发送邮件。
 */
function send_mail_local($to = '', $subject = '', $body = '', $from_name = '', $attachment = null,$reply_email='',$reply_name='')
{
	
	$site_config = Db::name('system')->field('value')->where('name', 'site_config')->find();
	$site_config = unserialize($site_config['value']);
	


	
	
	$mail = new PHPMailer(true);
	$mail->CharSet = 'UTF-8'; //设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码
	
	

	// 服务器设置
	$mail->SMTPDebug = 2;                                    // 开启Debug
	$mail->isSMTP();                                        // 使用SMTP

	$mail->Host = $site_config['smtp_server']; // SMTP 服务器
	$mail->Port =$site_config['smtp_port']; // SMTP服务器的端口号
	$mail->Username = $site_config['smtp_user']; // SMTP服务器用户名
	$mail->Password = $site_config['smtp_pass']; // SMTP服务器密码
	
	
	$mail->SMTPAuth = true;                                    // 开启SMTP验证
	

	$mail->SMTPSecure = 'tls';                                // 开启TLS 可选
	
	// 收件人
//	$mail->setFrom('17309981908@163.com', 'SandBoxCn');            // 来自
//	$mail->addAddress('176314141@qq.com', 'George.Haung');        // 添加一个收件人
	//$mail->addAddress('176314141@qq.com');                        // 可以只传邮箱地址
	
	if ($to == '') {
		$to =$site_config['smtp_cs'];//邮件地址为空时，默认使用后台默认邮件测试地址
	}
	if ($from_name == '') {
		$from_name = $site_config['site_title'];
	//发送者名称为空时，默认使用网站名称
	}
	if ($subject == '') {
		$subject =  $site_config['seo_title']; //邮件主题为空时，默认使用网站标题
	}
	if ($body == '') {
		$body =  $site_config['seo_description'];//邮件内容为空时，默认使用网站描述
	}
	
	$from_email = $site_config['smtp_user'];
	
	$reply_email = '';
	$reply_name = '';
	
	$mail->SetFrom($from_email, $from_name);
	$replyEmail = $reply_email ? $reply_email : $from_email;
	$replyName = $reply_name ? $reply_name : $from_name;
	//$mail->addReplyTo('173099819081@163.com', 'SandBoxCn');        // 回复地址,回复时显示在地址栏中
	$mail->AddReplyTo($replyEmail, $replyName);
	$mail->Subject = $subject;
	$mail->MsgHTML($body); //解析
	$mail->AddAddress($to, $from_name);
	/* 	if (is_array($attachment)) { // 添加附件
	 foreach ($attachment as $file) {
	 is_file($file) && $mail->AddAttachment($file);
	 }
	 } */
	// 附件
	//$mail->addAttachment('/var/tmp/file.tar.gz');                // 添加附件
//	$mail->addAttachment('/tmp/image.jpg', 'new.jpg');            // 可以设定名字

	
	
	
	return $mail->Send() ? true : $mail->ErrorInfo; //返回错误信息
	





	
}
function iconurl($icon,$type){
	
	if($icon!=0&&$icon!=''){
	
	if($type==2){
		
		return "<i class='iconfont icon-".$icon."'></i>";
	}else {
		
		return "<img src='".$icon."' />";
	}
	}else{
		
			return "空";
		
	}
}
function getcommentbyid($id){

		$children = Db::name('comment')->where(['id' =>$id])->find();
		//此时查询都是前台会员

$content=getusernamebyid($children['uid']).':'.htmlspecialchars_decode($children['content']);
	
		return $content;


}
function getuserinfobyid($uid){
	if($uid==0){
		return '所有人';
	}else{
		$children = Db::name('user')->where(['id' =>$uid])->find();
		//此时查询都是前台会员
		
		
		
		return $children;
	
	}
	
	
}
function getusernamebyid($uid){
if($uid==0){
	return '所有人';
}else{
	$children = Db::name('user')->where(['id' =>$uid])->find();
	if(empty($children)){
		
		$children = Db::name('admin_user')->where(['id' =>$uid])->find();
		return $children['username'];
	}else{
		return $children['username'];
	}
	
}
	


}
function getforumbyid($id){
	if($id==0){
		return '无此帖';
	}else{
		$children = Db::name('forum')->where(['id' =>$id])->find();
		if(empty($children)){

			
			return '无此帖';
		}else{
			return $children['title'];
		}

	}



}
function friendlyDate($sTime,$type = 'normal',$alt = 'false') {
	if (!$sTime)
		return '';
	//sTime=源时间，cTime=当前时间，dTime=时间差
	$cTime      =   time();
	$dTime      =   $cTime - $sTime;
	$dDay       =   intval(date("z",$cTime)) - intval(date("z",$sTime));
	//$dDay     =   intval($dTime/3600/24);
	$dYear      =   intval(date("Y",$cTime)) - intval(date("Y",$sTime));
	//normal：n秒前，n分钟前，n小时前，日期
	if($type=='normal'){
		if( $dTime < 60 ){
			if($dTime < 10){
				return '刚刚';    //by yangjs
			}else{
				return intval(floor($dTime / 10) * 10)."秒前";
			}
		}elseif( $dTime < 3600 ){
			return intval($dTime/60)."分钟前";
			//今天的数据.年份相同.日期相同.
		}elseif( $dYear==0 && $dDay == 0  ){
			//return intval($dTime/3600)."小时前";
			return '今天'.date('H:i',$sTime);
		}elseif($dYear==0){
			return date("m月d日 H:i",$sTime);
		}else{
			return date("Y-m-d",$sTime);
		}
	}elseif($type=='mohu'){
		if( $dTime < 60 ){
			return $dTime."秒前";
		}elseif( $dTime < 3600 ){
			return intval($dTime/60)."分钟前";
		}elseif( $dTime >= 3600 && $dDay == 0  ){
			return intval($dTime/3600)."小时前";
		}elseif( $dDay > 0 && $dDay<=7 ){
			return intval($dDay)."天前";
		}elseif( $dDay > 7 &&  $dDay <= 30 ){
			return intval($dDay/7) . '周前';
		}elseif( $dDay > 30 ){
			return intval($dDay/30) . '个月前';
		}
		//full: Y-m-d , H:i:s
	}elseif($type=='full'){
		return date("Y-m-d , H:i:s",$sTime);
	}elseif($type=='ymd'){
		return date("Y-m-d",$sTime);
	}else{
		if( $dTime < 60 ){
			return $dTime."秒前";
		}elseif( $dTime < 3600 ){
			return intval($dTime/60)."分钟前";
		}elseif( $dTime >= 3600 && $dDay == 0  ){
			return intval($dTime/3600)."小时前";
		}elseif($dYear==0){
			return date("Y-m-d H:i:s",$sTime);
		}else{
			return date("Y-m-d H:i:s",$sTime);
		}
	}
}
/*
 * 来判断导航链接内部外部从而生成新链接
 * 
 * 
 * */
function getnavlink($link,$sid){
	if($sid==1){
	
		$arr=explode(',', $link);
		
		$url=$arr[0];
		
		array_shift($arr);
		if(empty($arr)){
			
			$link=routerurl($url);
			
		}else{
			$m=1;
			$queue=array();
			foreach ($arr as $k =>$v){
			
				if($m==1){
					$n=$v;
			        $m=2;
					 
				}else{
					$b=$v;
			        $queue[$n]=$b;
					$m=1;
				}
			}
			if(empty($queue)){
				$link=routerurl($url);
			}else{
				$link=routerurl($url,$queue);
			}
			
			
			
		}
		
		
	
	
	
	
	}
	
	return $link;
}


function dir_create($path, $mode = 0777)
{
	if (is_dir($path)) {
		return TRUE;
	}
	$ftp_enable = 0;
	$path = dir_path($path);
	$temp = explode('/', $path);
	$cur_dir = '';
	$max = count($temp) - 1;
	for ($i = 0; $i < $max; $i++) {
		$cur_dir .= $temp[$i] . '/';
		if (@is_dir($cur_dir)) {
			continue;
		}
		@mkdir($cur_dir, 0777, true);
		@chmod($cur_dir, 0777);
	}
	return is_dir($path);
}
function format_bytes($size, $delimiter = '') {
	$units = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'];
	for ($i = 0; $size >= 1024 && $i < 6; $i++) $size /= 1024;
	return round($size, 2) . $delimiter . $units[$i];
}

//用于生成用户密码的随机字符
function generate_password( $length = 8 ) {
	// 密码字符集，可任意添加你需要的字符
	$chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
	$password ='';
	for ( $i = 0; $i < $length; $i++ )
	{
	// 这里提供两种字符获取方式
	// 第一种是使用 substr 截取$chars中的任意一位字符；
	// 第二种是取字符数组 $chars 的任意元素
	// $password .= substr($chars, mt_rand(0, strlen($chars) – 1), 1);
	$password .= $chars[ mt_rand(0, strlen($chars) - 1) ];
}
			return $password;
}
/**
 * 获取分类所有子分类
 * @param int $cid 分类ID
 * @return array|bool
 */
function get_category_children($cid)
{
    if (empty($cid)) {
        return false;
    }

    $children = Db::name('category')->where(['path' => ['like', "%,{$cid},%"]])->select();

    return array2tree($children);
}

/**
 * 根据分类ID获取文章列表（包括子分类）
 * @param int   $cid   分类ID
 * @param int   $limit 显示条数
 * @param array $where 查询条件
 * @param array $order 排序
 * @param array $filed 查询字段
 * @return bool|false|PDOStatement|string|\think\Collection
 */
function get_articles_by_cid($cid, $limit = 10, $where = [], $order = [], $filed = [])
{
    if (empty($cid)) {
        return false;
    }

    $ids = Db::name('category')->where(['path' => ['like', "%,{$cid},%"]])->column('id');
    $ids = (!empty($ids) && is_array($ids)) ? implode(',', $ids) . ',' . $cid : $cid;

    $fileds = array_merge(['id', 'cid', 'title', 'introduction', 'thumb', 'reading', 'publish_time'], (array)$filed);
    $map    = array_merge(['cid' => ['IN', $ids], 'status' => 1, 'publish_time' => ['<= time', date('Y-m-d H:i:s')]], (array)$where);
    $sort   = array_merge(['is_top' => 'DESC', 'sort' => 'DESC', 'publish_time' => 'DESC'], (array)$order);

    $article_list = Db::name('article')->where($map)->field($fileds)->order($sort)->limit($limit)->select();

    return $article_list;
}

/**
 * 根据分类ID获取文章列表，带分页（包括子分类）
 * @param int   $cid       分类ID
 * @param int   $page_size 每页显示条数
 * @param array $where     查询条件
 * @param array $order     排序
 * @param array $filed     查询字段
 * @return bool|\think\paginator\Collection
 */
function get_articles_by_cid_paged($cid, $page_size = 15, $where = [], $order = [], $filed = [])
{
    if (empty($cid)) {
        return false;
    }

    $ids = Db::name('category')->where(['path' => ['like', "%,{$cid},%"]])->column('id');
    $ids = (!empty($ids) && is_array($ids)) ? implode(',', $ids) . ',' . $cid : $cid;

    $fileds = array_merge(['id', 'cid', 'title', 'introduction', 'thumb', 'reading', 'publish_time'], (array)$filed);
    $map    = array_merge(['cid' => ['IN', $ids], 'status' => 1, 'publish_time' => ['<= time', date('Y-m-d H:i:s')]], (array)$where);
    $sort   = array_merge(['is_top' => 'DESC', 'sort' => 'DESC', 'publish_time' => 'DESC'], (array)$order);

    $article_list = Db::name('article')->where($map)->field($fileds)->order($sort)->paginate($page_size);

    return $article_list;
}

/**
 * 数组层级缩进转换
 * @param array $array 源数组
 * @param int   $pid
 * @param int   $level
 * @return array
 */
function array2level($array, $pid = 0, $level = 1)
{
    static $list = [];
   
    foreach ($array as $v) {
    	
    	
        if ($v['pid'] == $pid) {
        	
            $v['level'] = $level;
            $list[]     = $v;
       
            array2level($array, $v['id'], $level + 1);
        }
    }

    return $list;
}

/**
 * 构建层级（树状）数组
 * @param array  $array          要进行处理的一维数组，经过该函数处理后，该数组自动转为树状数组
 * @param string $pid_name       父级ID的字段名
 * @param string $child_key_name 子元素键名
 * @return array|bool
 */
function array2tree(&$array, $pid_name = 'pid', $child_key_name = 'children')
{
    $counter = array_children_count($array, $pid_name);
    if (!isset($counter[0]) || $counter[0] == 0) {
        return $array;
    }
    $tree = [];
    while (isset($counter[0]) && $counter[0] > 0) {
        $temp = array_shift($array);
        if (isset($counter[$temp['id']]) && $counter[$temp['id']] > 0) {
            array_push($array, $temp);
        } else {
            if ($temp[$pid_name] == 0) {
                $tree[] = $temp;
            } else {
                $array = array_child_append($array, $temp[$pid_name], $temp, $child_key_name);
            }
        }
        $counter = array_children_count($array, $pid_name);
    }

    return $tree;
}

/**
 * 子元素计数器
 * @param array $array
 * @param int   $pid
 * @return array
 */
function array_children_count($array, $pid)
{
    $counter = [];
    foreach ($array as $item) {
        $count = isset($counter[$item[$pid]]) ? $counter[$item[$pid]] : 0;
        $count++;
        $counter[$item[$pid]] = $count;
    }

    return $counter;
}

/**
 * 把元素插入到对应的父元素$child_key_name字段
 * @param        $parent
 * @param        $pid
 * @param        $child
 * @param string $child_key_name 子元素键名
 * @return mixed
 */
function array_child_append($parent, $pid, $child, $child_key_name)
{
    foreach ($parent as &$item) {
        if ($item['id'] == $pid) {
            if (!isset($item[$child_key_name]))
                $item[$child_key_name] = [];
            $item[$child_key_name][] = $child;
        }
    }

    return $parent;
}

/**
 * 循环删除目录和文件
 * @param string $dir_name
 * @return bool
 */
function delete_dir_file($dir_name)
{
    $result = false;
    if (is_dir($dir_name)) {
        if ($handle = opendir($dir_name)) {
            while (false !== ($item = readdir($handle))) {
                if ($item != '.' && $item != '..') {
                    if (is_dir($dir_name . DS . $item)) {
                        delete_dir_file($dir_name . DS . $item);
                    } else {
                        unlink($dir_name . DS . $item);
                    }
                }
            }
            closedir($handle);
            if (rmdir($dir_name)) {
                $result = true;
            }
        }
    }

    return $result;
}

/**
 * 判断是否为手机访问
 * @return  boolean
 */
function is_mobile()
{
    static $is_mobile;

    if (isset($is_mobile)) {
        return $is_mobile;
    }

    if (empty($_SERVER['HTTP_USER_AGENT'])) {
        $is_mobile = false;
    } elseif (strpos($_SERVER['HTTP_USER_AGENT'], 'Mobile') !== false
        || strpos($_SERVER['HTTP_USER_AGENT'], 'Android') !== false
        || strpos($_SERVER['HTTP_USER_AGENT'], 'Silk/') !== false
        || strpos($_SERVER['HTTP_USER_AGENT'], 'Kindle') !== false
        || strpos($_SERVER['HTTP_USER_AGENT'], 'BlackBerry') !== false
        || strpos($_SERVER['HTTP_USER_AGENT'], 'Opera Mini') !== false
        || strpos($_SERVER['HTTP_USER_AGENT'], 'Opera Mobi') !== false
    ) {
        $is_mobile = true;
    } else {
        $is_mobile = false;
    }

    return $is_mobile;
}

/**
 * 手机号格式检查
 * @param string $mobile
 * @return bool
 */
function check_mobile_number($mobile)
{
    if (!is_numeric($mobile)) {
        return false;
    }
    $reg = '#^13[\d]{9}$|^14[5,7]{1}\d{8}$|^15[^4]{1}\d{8}$|^17[0,6,7,8]{1}\d{8}$|^18[\d]{9}$#';

    return preg_match($reg, $mobile) ? true : false;
}

/**
 * 字符串截取，支持中文和其他编码
 * @static
 * @access public
 * @param string $str 需要转换的字符串
 * @param string $start 开始位置
 * @param string $length 截取长度
 * @param string $charset 编码格式
 * @param string $suffix 截断显示字符
 * @return string
 */
function msubstr($str, $start=0, $length, $charset="utf-8", $suffix=true) {



	if(function_exists("mb_substr"))
		$slice = mb_substr($str, $start, $length, $charset);
	elseif(function_exists('iconv_substr')) {
		$slice = iconv_substr($str,$start,$length,$charset);
		if(false === $slice) {
			$slice = '';
		}
	}else{
		$re['utf-8']   = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
		$re['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
		$re['gbk']    = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
		$re['big5']   = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
		preg_match_all($re[$charset], $str, $match);
		$slice = join("",array_slice($match[0], $start, $length));
	}
	//截取内容时去掉图片，仅保留文字


	return $suffix ? $slice.'...' : $slice;
}
function clearcontent($content){
	
	$content=htmlspecialchars_decode($content);
	
	
	$content=preg_replace("/&lt;/i","<",$content);
	
	
	$content=preg_replace("/&gt;/i",">",$content);
	
	$content=preg_replace("/&amp;/i","&",$content);
	
	
	$content=strip_tags($content);
	return $content;
}


function clearHtml($content){
	$content=preg_replace("/<a[^>]*>/i","",$content);
	$content=preg_replace("/<\/a>/i","",$content);
	$content=preg_replace("/<p>/i","",$content);
	$content=preg_replace("/<\/p>/i","",$content);
	$content=preg_replace("/<div[^>]*>/i","",$content);
	$content=preg_replace("/<\/div>/i","",$content);
	$content=preg_replace("/<!--[^>]*-->/i","",$content);//注释内容
	$content=preg_replace("/style=.+?['|\"]/i",'',$content);//去除样式
	$content=preg_replace("/class=.+?['|\"]/i",'',$content);//去除样式
	$content=preg_replace("/id=.+?['|\"]/i",'',$content);//去除样式
	$content=preg_replace("/lang=.+?['|\"]/i",'',$content);//去除样式
	$content=preg_replace("/width=.+?['|\"]/i",'',$content);//去除样式
	$content=preg_replace("/height=.+?['|\"]/i",'',$content);//去除样式
	$content=preg_replace("/border=.+?['|\"]/i",'',$content);//去除样式
	$content=preg_replace("/face=.+?['|\"]/i",'',$content);//去除样式
	$content=preg_replace("/face=.+?['|\"]/",'',$content);//去除样式 只允许小写 正则匹配没有带 i 参数
	return $content;
}
function cutstr_html($string,$length=0,$ellipsis='…'){
	 
	$string=strip_tags($string);
	$string=preg_replace("/\n/is",'',$string);
	$string=preg_replace("/\r\n/is",'',$string);

	$string=preg_replace('/ |　/is','',$string);
	$string=preg_replace('/&nbsp;/is','',$string);
	$string=preg_replace('/&emsp;/is','',$string);

	if(mb_strlen($string,'utf-8')<=$length){
		$ellipsis='';
	}
	preg_match_all("/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|\xe0[\xa0-\xbf][\x80-\xbf]|[\xe1-\xef][\x80-\xbf][\x80-\xbf]|\xf0[\x90-\xbf][\x80-\xbf][\x80-\xbf]|[\xf1-\xf7][\x80-\xbf][\x80-\xbf][\x80-\xbf]/",$string,$string);
	if(is_array($string)&&!empty($string[0])){
		if(is_numeric($length)&&$length){
				
				
				
			$string=join('',array_slice($string[0],0,$length)).$ellipsis;
		}else{
			$string=implode('',$string[0]);
		}
	}else{
		$string='';
	}
	return $string;
}
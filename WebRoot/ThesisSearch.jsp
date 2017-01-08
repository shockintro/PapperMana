<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Welcome PapperManager!</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
	ul{margin:0;padding:0;}
	li{ list-style:none;}
	.clear{ display:block; clear:both; content:"";}
	.clear{ zoom:1;}
	.mask { background: #000; opacity: 0.5;position: fixed;z-index: 9999;top: 0;left: 0;}
    
	.managemnet{height:453px; width:800px;margin:150px auto 0;padding-top:10px; background:#4B8FA5; border-radius:5px;}
	
	.managemnet-top{height:30px; width:770px; margin:0 auto; background:#fff; border-radius:5px;}
	.managemnet-top span{font-size:14px;padding-left:10px;height:30px; width:700px; line-height:30px; display:block; float:left;}
	
	.managemnet-top  button{padding:0;border:0;border-radius:5px;display:block; height:25px; width:50px; background:#5A98DE;color:#fff;float:right;margin:2.5px 5px;}
	
	.management-bottom{ height:400px;width:790px; margin:10px auto;}
	.management-bottom .bottom-left{ height:400px; width:120px; float:left;}

	.bottom-left .control li{ border-radius:5px;cursor:pointer;display:block; height:30px; width:100px; line-height:30px; text-align:center;margin:10px auto;background:#fff;}
	
	.management-bottom .bottom-right{height:400px; width:655px; float:left;margin-left:5px; background:#fff;border-radius:5px;}
	.management-bottom .bottom-right li{border-radius:5px;display:block;  height:378px; width:614px;padding:10px 20px; background:#fff;}
	
	.bottom-right  .head{ height:30px;background: #DCDCDC; border-radius: 5px;width:100px;line-height:30px;text-align:center;}
	
	.bottom-right  .search{ margin:10px 0;}
	.bottom-right  .search span{margin-left:20px;display:inline-block; width:70px; height:30px; line-height:30px;text-align:center;background:#ECF4FF;}
	.bottom-right  .search span:first-child{margin-left:0;}
	.bottom-right  .search input{width:60px;height:30px;margin-left:10px;}
	.bottom-right  .search select{display:inline-block;height: 30px;width: 70px; margin-left: 10px;border: 0;background:#ECF4FF;}
	.bottom-right  .search button{width:100px;height:30px;margin:0 10px;float:right;background:#5A98DE;color:#fff; border-radius:5px;}
	
	.bottom-right  .usage{ height:50px; width:668px; margin:0 auto; }
	.bottom-right  .usage button{float:left;width:100px;height:30px;margin-left:10px; border-radius:5px;background:#5A98DE;color:#fff;}
	.bottom-right  .usage button:first-child{ margin-left:0;}
	
	.bottom-right  .lists{ height:180px; width:600px;}
	.bottom-right  .lists table th,td{height:30px; width:auto;text-align:center;border:1px solid #A9A9A9; box-sizing:border-box; line-height:30px;}
	
	.bottom-right  .pages{ height:30px; width:300px;border:1px solid #000; margin-top:20px;}
	.bottom-right  .pages span{height:100%; width:100%; line-height:30px;padding-left:10px;}
	
	.bottom-right  .two .cover{ height:200px; width:300px; position:fixed; z-index:100000;background:#ECF4FF; top:200px; left:550px; display:none;border:1px solid #000;}
	.bottom-right  .two .cover .use span{ height:30px; width:100px; display:inline-block; line-height:30px; text-align:center;background:#B7CEEF;margin:10px 5px;}
	.bottom-right  .two .cover .use input{ height:30px; width:150px; margin:10px 5px;} 
	
	.bottom-right  .three .cover{padding:10px; height:520px; width:450px; position:fixed;z-index:100000; background:#ECF4FF; top:150px; left:550px;display:none;border:1px solid #000; }
	.bottom-right  .three .cover .left{float:left;width:300px;height:500px;}
	.bottom-right  .three .cover .left .use span{ height:30px; width:150px; display:inline-block; line-height:30px; text-align:center;background:#B7CEEF;margin:10px 5px;float:left;}
	.bottom-right  .three .cover .left .use input{ height:30px; width:150px; margin:10px 5px;float:right;} 
	
	.bottom-right  .three .cover .right{ float:right;width:100px; height:150px;padding-top:330px;padding-right:10px;}
	
	.bottom-right  .four .cover{ height:240px; width:300px;position:fixed; z-index:100000;background:#ECF4FF;border:1px solid #000; top:100px; left:550px;margin:150px auto 0;padding-top:10px; display:none;}
	.bottom-right  .four .cover .top{height:30px; width:280px; margin:10px auto 0 ; background:#fff;border:1px solid #000;}
	.bottom-right  .four .cover .top span{height:100%; width:100%; padding-left:10px; line-height:30px;}
	
	.bottom-right  .four .cover .middle{ height:130px; width:280px; margin:20px auto 0;}
	.bottom-right  .four .cover .middle span{ background:#B7CEEF;display:inline-block;height:30px; width:100px; text-align:center; line-height:30px;}
	.bottom-right  .four .cover .middle span:first-child{ float:left;display:inline-block;height:30px; width:100px; text-align:center; line-height:30px;}
	.bottom-right  .four .cover .middle select{ border:0; height: 30px; width:150px; float:right; }
	.bottom-right  .four .cover .middle input{ height:30px; width:150px; float:right;}
	
	.bottom-right  .five .cover{ height:340px; width:300px;padding:10px;position:fixed;z-index:100000;background:#ECF4FF;border:1px solid #000; top:50px; left:550px;margin:150px auto 0;padding-top:10px; display:none;}
	
	.bottom-right  .five .cover .use span{ height:30px; width:100px; display:inline-block; line-height:30px; text-align:center;background:#B7CEEF;margin:10px 5px 0 ;float:left;}
	.bottom-right  .five .cover .use input{ height:30px; width:150px; margin:10px 5px 0;float:right;}
	.bottom-right  .five .cover .use .check{ height:60px; width:290px;}
	.bottom-right  .five .cover .use .check span{     height: 20px; width: 54px; background: none; float: left; line-height: 16px;text-align: left;}
	
	.bottom{ height:30px; width:280px;padding:0 10px;}
	.bottom input{height:30px; width:100px; border:0;}
	</style>
	
  </head>
  
  <body>
   <div class="managemnet">
  		<div class="managemnet-top clear">
  			<span>[<%=session.getAttribute("user") %>] 您好，欢迎使用论文管理服务！ </span>
  			<button onclick="out()">退出</button>
  		</div>
  		<div class="management-bottom clear">
  			<div class="bottom-left">
  				<ul class="control">
  					<li style="margin-top:0;">论文搜索</li>

  					<!-- <li>乐豆换算比例</li>
  					<li>生成密保卡</li> -->
  				</ul>
  			</div>
  			<div class="bottom-right">
  				<ul>
  					<li class="one">     
  					<form action="<%=path %>/user/search.action" method="post" onSubmit="return check()" id="form1">                                         
  						<div class="head">论文搜索</div>
  						<div class="search">
  							<span>关键字</span><input type="text"  id="keyWord" name="keyWord" style="width:110px;">
  							<span>类型</span><input type="text" id="type" name="type" style="width:150px;">
  							<button >查询</button>
  						</div>
  						
  						<div class="lists">
  						
  							<table border="1" cellspacing="0"   >
  								<tr>
  									<th></th>
  									<th>编号</th>
  									<th>论题</th>
  									<th>类型</th>
  									<th>作者</th>
  									<th>发表时间</th>
  								</tr>
  								<tr>
							<s:iterator value="list" status="stu">
						    	<tr>
						    		<td><input type="radio" ></td>
						    		<td><s:property value="id"/></td>
						    		<td><s:property value="thesis_name"/></td>
						    		<td><s:property value="thesis_type"/></td>
						    		<td id="statusId"><s:property value="thesis_author"/></td>
						    		<td><s:property value="create_date"/></td>
						    	</tr>
		    				</s:iterator>
  								</tr>
  							</table>
  							
  						</div>
  						<%-- <div class="pages">
  							<span>总共5页，当前是第1页，</span>
  						</div> --%>
  						</form>
  						<div class="usage clear">
  							<button onclick="">下载</button>
  						</div>
  					</li>
  					
<!-- ---------000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000-------- -->
  					
  				</ul>
  			</div>
  		</div>
  	</div>
  </body>
  <script>
  	function check(){
		var keyWord=$("#keyWord").val();
		var type=$("#type").val();
		if((type==""||type==null)&&(keyWord==""||keyWord==null)){
			return false;
		}
		return true;
	}
  </script>
</html>

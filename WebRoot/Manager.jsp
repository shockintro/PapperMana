<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  	
    <title>后台管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<style>
	ul{margin:0;padding:0;}
	li{ list-style:none;}
	.clear{ display:block; clear:both; content:"";}
	.clear{ zoom:1;}
	.mask { background: #000; opacity: 0.5;position: fixed;z-index: 9999;top: 0;left: 0;}
    
	.managemnet{height:453px; width:800px;margin:150px auto 0;padding-top:10px; background:#29D52B; border-radius:5px;}
	
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
	.bottom-right  .three .cover .left .use span{ height:30px; width:100px; display:inline-block; line-height:30px; text-align:center;background:#B7CEEF;margin:10px 5px;float:left;}
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
	
<script>
	var status;
	function check(){
		var customer=$("#account").val();
		var number=$("#phone").val();
		if((number==""||number==null)&&(customer==""||customer==null)){
			return false;
		}
		return true;
	}
	
	function check1(){
		if($("#gameType").val()==""||$("#gameType").val()==null)return false;
	}
	function gameQuery(){
		if(($('#gameNameThree').val()==""||$('#gameNameThree').val()==null)&&($('#gameTypeThree').val()==""||$('#gameTypeThree').val()==null))return false;
	}
	function oneAjax(){
		$.ajax({
			url : "\statusAjax",  
			type : "GET",
			data : {Text:"status",beeStatus:status},
			success : function(root) {
			alert("ok");  
	        },
			error:function(root) {  
			alert("false");  
	        }
		});
		var statu=$('#statusId').html();
		if(parseInt(statu)==1)
			$('#statusId').text("2");
		else
			$('#statusId').text("1");
	}
	
	function addGameTypeAjax(){
		$.ajax({
			url : "\addGameAjax",  
			type : "GET",
			data : {Text:"addGameType",addGameType:$("#addGameType").val(),addGameStatus:$('input[name="addBusiness"]:checked').val()},
			success : function(root) {
				alert("ok");  
	        },
			error:function(root) {  
				alert("false");  
	        }
		});
	}
	
	function gameTypeChange(){
		$.ajax({
			url : "\gameTypeChange",  
			type : "GET",
			data : {Text:"gameTypeChange",changeGameTypeName:$("#change0").val(),changeGameTypeBusiness:$('input[name="changeGameTypeBusiness"]:checked').val()},
			success : function(root) {
				alert("ok");  
	        },
			error:function(root) {  
				alert("false");  
	        }
		});
		var statu=$('#gameTypeStatusId').html();
		if(parseInt(statu)==1)
			$('#gameTypeStatusId').text("2");
		else
			$('#gameTypeStatusId').text("1");
	}
	
	function addGame(){
		$.ajax({
			url : "\addGame",  
			type : "GET",
			data : {Text:"addGame",
					gameName:$("#gameName").val(),
					gameStatus:$('input[name="gameStatus"]:checked').val(),
					gameType:$('#select1 option:selected').val(),//选中的值
					textAera:$('#textAera').val(),
					iconAddress:$('#iconAddress').val(),
					chargeFee:$('#chargeFee').val(),
					beanFee:$('#chargeFee').val()
					},
			success : function(root) {
				alert("ok");  
	        },
			error:function(root) {  
				alert("false");  
	        }
		});
	}	
	function changeGame(){
		alert($("#change100").val()+"id "+$("#change1").val()+"name "+$('input[name="changeStatus"]:checked').val()+"status "+$('#changeType option:selected').val()+"type "+$('#change4').val())
		$.ajax({
			url : "\changeGame",  
			type : "GET",
			data : {Text:"changeGame",
					gameId:$("#change100").val(),
					gameName:$("#change1").val(),
					gameStatus:$('input[name="changeStatus"]:checked').val(),
					textAera:$("#changeTextAera").val(),
					iconAddress:$("#iconAddress").val(),
					chargeFee:$("#change3").val(),
					beanFee:$("#change4").val()
					},
			success : function(root) {
				alert("ok");  
	        },
			error:function(root) {  
				alert("false");  
	        }
		});
	}
	
	function out(){
		window.location.href="http://localhost:8080/PapperMana/index.jsp";
	}
	
</script>
  </head>
  	<%
  		 /*  String user = (String) session.getAttribute("user");  
  		  String pwd = (String) session.getAttribute("password");  
  		  if(user.equals("")||user==null)
  		  response.sendRedirect("/index.jsp"); */
  	 %>
  <body>
  	<!--用户管理-->
  	<div class="managemnet">
  		<div class="managemnet-top clear">
  			<span>[<%=session.getAttribute("user") %>]号 管理员，欢迎使用知识产权管理系统！ </span>
  			<button onclick="out()">退出</button>
  		</div>
  		<div class="management-bottom clear">
  			<div class="bottom-left">
  				<ul class="control">
  					<li style="margin-top:0;">知识产权管理</li>
  					<li>上传论文</li>
  				</ul>
  			</div>
  			<div class="bottom-right">
  				<ul>
  					<li class="one">     
  					<form action="<%=path %>/user/userSearch.action" method="post" onSubmit="return check()" id="form1">                                         
  						<div class="head">用户管理</div>
  						<div class="search">
  							<span>帐号</span><input type="text"  id="account" name="account" style="width:110px;">
  							<span>手机号码</span><input type="text" id="phone" name="phone" style="width:150px;">
  							<button >查询</button>
  						</div>
  						<div class="usage clear">
  							<button onclick="oneAjax()">更改状态</button>
  						</div>
  						<div class="lists">
  						
  							<table border="1" cellspacing="0"   >
  								<tr>
  									<th></th>
  									<th>ID</th>
  									<th>用户帐号</th>
  									<th>手机号码</th>
  									<th>用户名称</th>
  									<th>用户身份</th>
  									<th>创建时间</th>
  									<th>修改时间</th>
  								</tr>
  								<tr>
							<s:iterator value="list1" status="stu">
						    	<tr>
						    		<td><input type="radio" ></td>
						    		<td><s:property value="id"/></td>
						    		<td><s:property value="author_account"/></td>
						    		<td><s:property value="phone"/></td>
						    		<td id="statusId"><s:property value="name"/></td>
						    		<td><s:property value="author_position"/></td>
						    		<td><s:property value="create_date"/></td>
						    		<td><s:property value="modify_date"/></td>
						    	</tr>
		    				</s:iterator>
  								</tr>
  							</table>
  							
  						</div>
  						<%-- <div class="pages">
  							<span>总共5页，当前是第1页，</span>
  						</div> --%>
  						</form>
  					</li>
  					
<!-- ---------000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000-------- -->
  					<li class="two">
  		
  						<div class="head">论文上传</div>
  						<form action="<%=path %>/upload/upload.action" 
					    enctype="multipart/form-data" method="post">
					       文件:<input type="file" name="image" id="image">
					        <br>
					       简介:<input type="text" name="brief" id="brief"><br>
					       作者:<input type="text" name="author" id="author"><br>
					       类型:<input type="radio" id="type" name="type" checked=true value="1">科技
				    		<input type="radio" id="type" name="type" value="2">经济
				    		<input type="radio" id="type" name="type" value="3">农业
				    		<input type="radio" id="type" name="type" value="4">it
				    			<br>
				    	<input type="submit" value="上传" />
					    </form>
					    <br/>
					    <s:fielderror />
					    
  						</div>
  					</li>

     <script>
     
     /*点击切换界面*/
     
     $(function(){
     	$(".bottom-right").find('li:gt(0)').css("display","none");
     
     	$(".bottom-left").find('li').click(function(){
     		This = this;
     		var index = $(This).index();
     		$(".bottom-right").find("li").css("display","none");
     		$(".bottom-right").find("li").eq(index).css("display","block");	
     	});
     });
     /* 点击弹窗，背景覆盖*/
     $(function(){
     	/* 新增按钮 */
     	$(".bottom-right li").slice(1,4).find(".usage button:first-child").click(function(){
     		mask();
     		$(this).parents('li').find(".cover1").css("display","block");
     		$(".close").click(function(){
     			$(this).parents('li').find(".cover1").css("display","none");
     			$(".mask").remove();
     		});
     	});
     	/* 修改按钮 */
     	$(".bottom-right li").slice(1,4).each(function(){
     		$(this).find(".usage button").slice(1,2).click(function(){
     			mask();
	     		$(this).parents('li').find(".cover2").css("display","block");
	     		$(".close").click(function(){
	     			$("#change0,#change1,#change2,#change3,#change4,#change5").val("");
	     			$(this).parents('li').find(".cover2").css("display","none");
	     			$(".mask").remove();
	     		});
	     	});
     	});  
     	/* 生成密保卡*/
     	$(".bottom-right li:gt(3) .usage button:last-child").click(function(){
     		mask();
     		$(this).parents('li').find(".cover").css("display","block");
     		$(".close").click(function(){
     			$("#change6,#change7,#change8,#change9").val();
     			$(this).parents('li').find(".cover").css("display","none");
     			$(".mask").remove();
     		});
     	});
     	var mask = function() {
	        $('<div class="mask" style="width: ' + $(window).width() + 'px; '
	            + 'height: ' + $(window).height() + 'px;"></div>').appendTo("body");
	    };
	
	    // 窗口大小变化，调整 mask 大小
	    $(window).on("resize", function() {
	        if($(".mask").length) {
	            $(".mask").css({
	                width: $(window).width(),
	                height: $(window).height(),
	                opacity: 0.5
	            });
	        }
	    });
     });
     /* 点击input radio 按钮，存储数据*/
     $(function(){
     	$(".lists").find("tr:gt(0)").each(function(){
     		This = this;
     		$(This).find("td:first-child > input").click(function(){
	     		That = this;
	     		var num = $(That).parents("tr").children("td:gt(0)");
	     		$(num).each(function(){
	     			ta=this;
	     			status = $(ta).parents("tr").children("td").eq(2).html();
	     		});
     		});
     	})
     	
     });
     
     /* 修改 中的数据添加*/
     $(function(){
     	$(".two .lists").find("tr:gt(0)").each(function(){
     		This = this;
     		
     		$(This).find("td:first-child > input").click(function(){
	     		That = this;
	     		var con = $(That).parents("tr").children("td").eq(2).html();
	     		$(".two .use #change0").val(con);	
     		});
     		
     		
     	});
     });
     
     $(function(){
     	$(".three .lists").find("tr:gt(0)").each(function(){
     		This = this;
     		$(This).find("td:first-child > input").click(function(){
	     		That = this;
	     		var con01 = $(That).parents("tr").children("td").eq(1).html();
	     		var con0 = $(That).parents("tr").children("td").eq(2).html();
	     		var con4 = $(That).parents("tr").children("td").eq(3).html();
	     		var con1 = $(That).parents("tr").children("td").eq(4).html();
	     		var con2 = $(That).parents("tr").children("td").eq(5).html();
	     		var con3 = $(That).parents("tr").children("td").eq(6).html();
	     		//$(".three .use #change100").attr("placeholder",con01);
	     		$(".three .use #change100").val(con01);
	     		//$(".three .use #change1").attr("placeholder",con0);
	     		$(".three .use #change1").val(con0);
	     		//$(".three .use #change2").attr("placeholder",con1);
	     		$(".three .use #change2").val(con1);
	     		//$(".three .use #change3").attr("placeholder",con2);
	     		$(".three .use #change3").val(con2);
	     		//$(".three .use #change4").attr("placeholder",con3);
	     		$(".three .use #change4").val(con3);
	     		$(".three .use #change5").val(con4);
     		});
     	});
     });
     $(function(){
     	$(".four .lists").find("tr:gt(0)").each(function(){
     		This = this;
     		$(This).find("td:first-child > input").click(function(){
	     		That = this;
	     		var con = $(That).parents("tr").children("td").eq(3).html();
	     		$(".four  #change5").attr("placeholder",con);
     		});
     	});
     });
     
     $(function(){
     	$(".five .lists").find("tr:gt(0)").each(function(){
     		This = this;
     		$(This).find("td:first-child > input").click(function(){
	     		That = this;
	     		var con0 = $(That).parents("tr").children("td").eq(3).html();
	     		var con1 = $(That).parents("tr").children("td").eq(5).html();
	     		var con2 = $(That).parents("tr").children("td").eq(6).html();
	     		$(".five  #change6").attr("placeholder",con0);
	     		$(".five  #change7").attr("placeholder",con1);
	     		$(".five  #change8").attr("placeholder",con2);
     		});
     	});
     });
     
     </script>
  </body>
</html>

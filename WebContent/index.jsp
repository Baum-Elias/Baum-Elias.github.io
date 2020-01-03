<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/mytag.tld" prefix="myTag" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Let's Talk!</title>
<link rel="stylesheet" type="text/css" href="resources/layui/css/layui.css"><!-- 响应式布局 -->
<link rel="stylesheet" type="text/css" href="resources/css/common.css"><!-- 公共样式 -->
<link rel="stylesheet" type="text/css" href="resources/css/index.css"><!-- 主页样式 -->

</head>
<body>
	<!-- 这是新闻系统的首页 -->
	<input type="hidden" name="pageCount" value="${pageCount}" >
	<input type="hidden" name="pageNo" value="${pageNo}">
	<!-- 主体部分 -->
	<div class="row logo">
    <%String name=(String)session.getAttribute("username");
    if(name!=null){%>
		<a href="coreServlet?bizCode=1"><button type="button" class="logimg"></button></a>
	<% }else{ %>
		<a href="login.jsp"><button type="button" class="logimg"></button></a>
	<% } %>

		<div class="type">
			<ul>
				<li><a style="padding:0px 4px 0px;" href="coreServlet?bizCode=7" onclik="typeTurn(0,0)">首页</a></li>
				<li><a style="padding:0px 4px 0px;" href="coreServlet?bizCode=7&type=1" onclik="typeTurn(1,1)">社会</a></li>
				<li><a style="padding:0px 4px 0px;" href="coreServlet?bizCode=7&type=2" onclik="typeTurn(1,2)">娱乐</a></li>
				<li><a style="padding:0px 4px 0px;" href="coreServlet?bizCode=7&type=3" onclik="typeTurn(1,3)">军事</a></li>
				<li><a style="padding:0px 4px 0px;" href="coreServlet?bizCode=7&type=4" onclik="typeTurn(1,4)">体育</a></li>
				<li><a style="padding:0px 4px 0px;" href="coreServlet?bizCode=7&type=5" onclik="typeTurn(1,5)">财经</a></li>
			</ul>
		</div>
	
		<!-- 搜索框 -->
		<div class="search-part">
			<form method="post" class="search" action="coreServlet?bizCode=7" >
				<input type="hidden" name="type">
				<input class="button" value="" type="submit">
	    		<input type="text" name="keyWord" placeholder="搜索一下" value="${keyWord}">
	  		</form>
		</div>
	</div>
	<!-- logo部分结束 -->
	<div style="width: 944px; margin: 0 auto; margin-top:20px;"><a href="javascript:;" onclick="showlog()" style="font-size: 14px; height-line:14px;"><i class="layui-icon layui-icon-face-smile" style="font-size: 20px; color: #FF8C69;">&#xe667;</i>&nbsp;查看更新日志</a></div>
	<div class="logdiv" hidden>
		<ul class="layui-timeline">
		<li class="layui-timeline-item">
		    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
		    <div class="layui-timeline-content layui-text">
		      <h3 class="layui-timeline-title">12月31日</h3>
		      <p><em>改了</em>一些BUG</p>
		      <ul>
		        <li> 终于没什么大的BUG了</li>
		      </ul>
		    </div>
		  </li>
		  <li class="layui-timeline-item">
		    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
		    <div class="layui-timeline-content layui-text">
		      <h3 class="layui-timeline-title">12月27日</h3>
		      <p><em>修改了</em>css</p>
		      <ul>
		        <li> 使得页面十分好看嘿嘿嘿</li>
		        <li> 顺便改了一些BUG</li>
		      </ul>
		    </div>
		  </li>
		  <li class="layui-timeline-item">
		    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
		    <div class="layui-timeline-content layui-text">
		      <h3 class="layui-timeline-title">12月25日</h3>
		      <p><em>调试了</em>各个页面的功能</p>
		      <ul>
		        <li> 各个分类的分配BUG</li>
		        <li> 新增跳转</li>
		      </ul>
		    </div>
		  </li>
		  <li class="layui-timeline-item">
		    <i class="layui-icon layui-timeline-axis">&#xe63f;</i>
		    <div class="layui-timeline-content layui-text">
		      <div class="layui-timeline-title">过去</div>
		    </div>
		  </li>
		</ul>
	</div>
	<!-- 新闻部分 -->
	<div class="list">
		<c:forEach var="news" items="${newsList}" varStatus="status">
			<div class="new">&nbsp;
				<div class="content row">
					<div class="imgdiv">
						<a href="coreServlet?bizCode=4&id=${news.id}"><img src="${news.img}"/></a>
					</div>
					<div class="text">
						<a href="coreServlet?bizCode=4&id=${news.id}"><h4>${news.title}</h4></a>
						<p class="p1">${myTag:formatDate(news.pudate)}&nbsp;-&nbsp;<span style="color: #20B2AA;">${news.type}</span>&nbsp;-&nbsp;${news.author}&nbsp;-&nbsp;阅${news.click}</p>
						<p class="p2">${news.content}</p>
					</div>
				</div>
			</div>	
		</c:forEach>
	</div>
	<div class="footer">
		<h5>Design von Herr Baum</h5>
	</div> 
	
	<!-- bootstrap所需js -->
	<script type="text/javascript" src="resources/layui/layui.js"></script>
	<script type="text/javascript" src="resources/js/jquery-3.1.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			//滚动分页
			var flag = 0;
			$(window).scroll(function(){  
			//alert('document.height'+$(document).height()+ 'window.height: '+$(window).height()+'scrolltop:'+$(window).scrollTop());
				//console.log($(window).scrollTop() + "  " + $(document).height() + "  " +$(window).height());//window.height为603
				if ($(window).scrollTop() == $(document).height() - $(window).height()) {
					//alert('document.height'+$(document).height()+ 'window.height: '+$(window).height()+'scrolltop:'+$(window).scrollTop());
					var pageCount = $("input[name='pageCount']").val();
					var pageNo = $("input[name='pageNo']").val();
					var keyWord = $("input[name='keyWord']").val();
					var type = $("input[name='type']").val();//type的值为""
					if(pageNo < pageCount){
						$.ajax({
							url:"coreServlet?bizCode=7",
							dataType:"json",
							data:{'keyword':keyWord, 'type':type, 'pageNo':parseInt(pageNo)+1},
							success:function(data){
								console.log(data);
								var html = "";
								$.each(data.newsList, function(i,val){  
								/* 		if(type==""){
									alert("type为''")}   */
									html += '<div class="new">&nbsp';
									html += '	<div class="content row">';
									html += '		<div class="imgdiv">';
									html += '			<a href="coreServlet?bizCode=4&id='+val.id+'"><img src="'+val.img+'"/></a>';
									html += '		</div>';
									html += '		<div class="text">';
									html += '			<a href="coreServlet?bizCode=4&id='+val.id+'"><h4>"'+val.title+'</h4></a>';
									html += '			<p class="p1">'+dateFormat(val.pudate)+'-<span style="color: #20B2AA;">'+val.type+'</span>-'+val.author+'-阅'+val.click+'</p>';
									html += '			<p class="p2">"'+val.content+'</p>';
									html += '		</div>';
									html += '	</div>';
									html += '</div>	';
								});
								
								$(".new").last().after(html);
								$("input[name='pageNo']").val(parseInt(pageNo) + 1);
							}
						});
					}else if(pageNo == pageCount && flag == 0){
						flag ++;
						var html = '<p style="text-align:center; color:#FF8C69; font-size:14px; margin-top:10px; margin-bottom:10px;">-没有更多了-</p>';
						$(".new").last().after(html);
					}
				}
			});
		});
		
		function typeTurn(opt, type){
			if(opt == 1){
				$("input[name='type']").val(type);
			}else{
				$("input[name='type']").val("");
			}
		}
		
		function showlog(){
			$(".logdiv").animate({
			      height:'toggle'
		    });
		}
		
		function dateFormat(update){
			return update.substring(0,4) + "-" + update.substring(4,6) + "-" + update.substring(6,8);
		}
	</script>
</body>
</html>
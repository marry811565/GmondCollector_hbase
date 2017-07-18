<%@ page
		contentType="text/html; charset=utf-8"
		import="java.text.SimpleDateFormat"
		import="java.util.*"
		import="com.sina.data.bigmonitor.web.*"
		import="java.io.IOException"
%>
<!DOCTYPE html>
<html lang="en" class=" js no-touch"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Tentacles</title>
	<link href="download/appstart/assets/css/test1.css" rel="stylesheet">
	<br>
	<br>
	<br>
<body class="">
<div id="preloader" style="display: none;">
	<div id="preloader-logo" style="display: none;">
		<img src="./Dashboard   AppStart - Admin Template_files/preloader-logo.png" alt="Logo">
	</div>
	<div id="preloader-icon" style="display: none;">
		<i class="im-spinner icon-spin"></i>
	</div>
</div>
<!-- Start #header -->
<div id="header" class="header-fixed">
	<div class="container-fluid">
		<div class="navbar">
			<div class="navbar-header">
				<!-- Show logo for large screens and laptops -->
				<a class="navbar-brand visible-lg visible-md" href="./main.jsp">
					<img src="resources/logo-min.png" alt="Jump start">
				</a>
			</div>
			<nav id="top-nav" class="navbar-no-collapse" role="navigation">
				<ul class="dropdown"   style="width:900px; margin:0 auto;top:15px;" >
					<div id="menu">
						<ul>

							<%
								SimpleDateFormat dateFormat =
										new SimpleDateFormat("yyyy-MM-dd" + " " + "HH:mm:ss");
								Date reqTime = new Date();
								String endStr = request.getParameter("endTime");
								String slaveHost = request.getParameter("slaveHost");
								String begStr = request.getParameter("startTime");
								session.setAttribute("slave",slaveHost);
								if (endStr == null || endStr.equals("")) {
									endStr = dateFormat.format(reqTime);
								}
								if (begStr == null || begStr.equals("")) {
									begStr = dateFormat.format(
											new Date(reqTime.getTime() - 3600 * 1000));
								}
							%>
							<html>
							<script language="javascript" type="text/javascript" src="js/Main.js"></script>
							<script language="javascript" type="text/javascript" src="js/WebCalendar.js"></script>

							<head>
								<meta http-equiv="content-type" content="text/html; charset=utf-8">
								<link href="resources/HomePageStyle.css" rel="stylesheet" media="screen" type="text/css" charset="utf-8"></link>
							</head>

							<body>

							<div id="menu">
								<ul>
									<li>
										<form action="slavehighchart.jsp" method="POST" >
											<label id="deltaTimeLabel" for="deltaTime"><B>Last: </B></label>
											<select name="deltaTime" id="deltaTime" onchange="time_refresh()" >
												<option value="10" >10 min</option>
												<option value="30" >30 min</option>
												<option value="60" SELECTED>hour</option>
												<option value="120" >2 hour</option>
												<option value="180" >3 hour</option>
												<option value="360" >6 hour</option>
												<option value="1440" >day</option>
												<option value="2880" >2 day</option>
												<option value="4320" >3 day</option>
												<!--option value="10080" >week</option-->
											</select>

											<label id="startTimeLabel" for="startTime"><B>From: </B></label>
											<input name="startTime" id="startTime" type="text" class="form_css"
												   value="<% out.print(begStr); %>"
												   onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss',0,0)"
												   onchange="time_check()" />

											<label id="endTimeLabel" for="endTime"><B>To: </B></label>
											<input name="endTime" id="endTime" type="text" class="form_css"
												   value="<% out.print(endStr); %>"
												   onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss',0,0)"
												   onchange="time_check()" />

											<!--label id="endTimeLabel" for="endTime"><B>To: </B></label-->
											<input id="sub_button" type="submit" value="监控查看" />

									</li>
									<style type="text/css">
										.ct{
											text-align:center;
										}
									</style>
									<script type="text/javascript">
										function allCheck(){
											var obj=document.getElementsByTagName("input");
											if(document.getElementById("all").checked==true){
												for(var i=0;i<obj.length;i++){
													obj[i].checked=true;
												}
											}else{
												for(var i=0;i<obj.length;i++){
													obj[i].checked=false;
												}
											}
										}
										function checkT_F(){
											var obj=document.getElementsByTagName("input");
											var j=0;
											for(var i=0;i<obj.length;i++){
												if(obj[i].id!='all'){
													if(obj[i].checked==true){
														j++;
													}
												}
											}
											if(j==(obj.length-1)){
												document.getElementById("all").checked=true;
											}else{
												document.getElementById("all").checked=false;
											}
										}
									</script>
									</head>
									<body>
									<div>
										<div class="zuo">
											<div><input type="checkbox" id="all"  onclick="javascript:allCheck()"/>all</div>
										</div>
										<%


											List<metricInfo> info = null;
											AllMetrics am = new AllMetrics();
											try {
												info = am.getMetricInfo_inf();
											}catch (IOException e)
											{

											}
											for(metricInfo mf:info) {
												String passValue = mf.getMetricId() + ":" + mf.getMetricName();
										%><div><input type="checkbox" name="metric" value="<%=passValue%>">[<%=mf.getMetricName()%>]</div><%
										}
									%>
									</div>

									</form>


									</body>
							</html>


						</ul>

					</div>
</body>
</html>
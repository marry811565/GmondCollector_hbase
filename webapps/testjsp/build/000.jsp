<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
        <!-- Force IE9 to render in normal mode -->
        <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->

        <link href="bootstrap/css/icons.css" rel="stylesheet">

        <link href="bootstrap/css/bootstrap.css" rel="stylesheet">

        <link href="download/appstart/assets/css/main.css" rel="stylesheet">


</head>
<style type="text/css">
#bgimg{
x-index:0,
}
#text{
x-index:1
}
.btn {width:200; color:green}
</style>

<body  bgcolor="#FFFFFF" width=100% height=10 >
     <div class="func" id=text>
    <div style="position:absolute;width:200px;margin:200px;left:250 ;" class="background", id=bgimg>
    <img src="../resources/laydown20.png"  align="center"/>
     </div>
            <div class="btn btn group btn-group-vertical" >
              <br>
              <br>
              <br>
              <p><a href="./dpf_package.jsp" target="_top"><button type="button" class="btn btn-default btn-lg" width=100px >公共集群只做1个包</button></a></p>
              <p><button type="button"  onclick="firm()" class="btn btn-default btn-lg" width=100px >混布无差别做包</button></a></p>
                
            </div>
    </div>
<script language="javascript">
function firm()

{
    if(confirm("是否其他集群曾经上过同样的内容？"))
    {

        location.href="http://tentacles.dmop.baidu.com:8010/build/mix_package.jsp";

     }

    else
    {
        location.href="http://tentacles.dmop.baidu.com:8010/build/0.html";
      //alert("你按了取消，那就是返回false");
    }

}
</script>



</body>
</html>

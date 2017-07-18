<%@ page
        contentType="text/html; charset=utf-8"
        import="java.text.SimpleDateFormat"
        import="java.util.*"
        import="javax.servlet.*"
        import="tentacles.http.test"
        import="java.util.LinkedHashMap"
        import="java.util.Map"
        import="tentacles.grab.tentacles_job"
        import="tentacles.grab.analyze"
        import="com.baidu.inf.ark.client.ClientException"
        import="java.io.*"

        
%>
<!DOCTYPE html>
<html lang="en" class=" js no-touch"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Tentacles</title>
        <!-- Mobile specific metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <!-- Force IE9 to render in normal mode -->
        <!--[if IE]><meta http-equiv="x-ua-compatible" content="IE=9" /><![endif]-->
        <meta name="author" content="SuggeElson">
        <meta name="description" content="AppStart admin template - new premium responsive admin template. This template is designed to help you build the site administration without losing valuable time.Template contains all the important functions which must have one backend system.Build on great twitter boostrap framework">
        <meta name="keywords" content="admin, admin template, admin theme, responsive, responsive admin, responsive admin template, responsive theme, themeforest, 960 grid system, grid, grid theme, liquid, jquery, administration, administration template, administration theme, mobile, touch , responsive layout, boostrap, twitter boostrap">
        <meta name="application-name" content="AppStart admin template">
        <!-- Import google fonts - Heading first/ text second -->
        <link href="./Dashboard   AppStart - Admin Template_files/css" rel="stylesheet" type="text/css">
        <!-- Css files -->
        <!-- Icons -->
        <link href="bootstrap/css/icons.css" rel="stylesheet">
        <!-- Bootstrap stylesheets (included template modifications) -->
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
        <!-- jQueryUI -->
        <!-- Plugins stylesheets (all plugin custom css) -->
        <!-- Main stylesheets (template main css file) -->
        <link href="download/appstart/assets/css/main.css" rel="stylesheet">
        <!-- Custom stylesheets ( Put your own changes here ) -->
        <!-- Fav and touch icons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/favico.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/favico.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/favico.png">
        <link rel="icon" href="resources/favico.png" type="image/png">
        <!-- Windows8 touch icon ( http://www.buildmypinnedsite.com/ )-->
        <meta name="msapplication-TileColor" content="#3399cc">
    <style type="text/css">.jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}</style></head>
 <body class="">
        <div id="preloader" style="display: none;">
            <div id="preloader-logo" style="display: none;">
                <img src="./Dashboard   AppStart - Admin Template_files/preloader-logo.png" alt="Logo">
            </div>
            <div id="preloader-icon" style="display: none;">
                <i class="im-spinner icon-spin"></i>
            </div>
        </div>

<div id="Content" class="sidebar">
<%
        out.println("<Br>");
        out.println("<Br>");
        out.println("<Br>");
        String clusterName = request.getParameter("clusterName");
        String operation = request.getParameter("operation");
        out.println("Cluster name : " + clusterName + "<Br>");
        
        out.println("operation : " + operation + "<Br>");
        Runtime rt = null;
        InputStream in = null;
        //String [] command =  {"sh", "/home/tentacles/findblock/findblockOne.sh ", clusterName,  blockId, " 2>&1"};
        String [] command =  {"sh", "/home/tentacles/seekblock/" + operation + ".sh", clusterName};
        Process proc = null;
        BufferedReader reader = null;
        StringBuilder sb1 = new StringBuilder();
        rt = Runtime.getRuntime();
        int count = 0;
        /*
        for (int i=0;i<10;i++){
             out.println("num : " + i + "<br>");
             Thread.sleep(1000);
             out.flush();
        }*/
        try {
            proc = rt.exec(command);
            in = proc.getInputStream();
            reader = new BufferedReader(new InputStreamReader(in));
            String str = null;
            count = 0;
            while ((str = reader.readLine()) != null) {
                count++;
                sb1.append(str + "\n");
                out.println(str);
                out.println("<br>");
                out.flush();

            }
            if(count ==0){
                System.out.println(" error "  );
            }


        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                if (reader != null) reader.close();
                if (in != null) in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }




%>
</div>
</body>

<%@ page
        contentType="text/html; charset=utf-8"
        import="java.text.SimpleDateFormat"
        import="java.util.*"
        import="javax.servlet.*"
        import="java.io.*"

        import="org.json.JSONException"
        import="org.json.JSONObject"
        import="org.json.JSONArray"
        import="java.io.BufferedReader"
        import="java.io.InputStream"
        import="java.io.InputStreamReader"
        import="java.io.IOException"

        import="java.util.ArrayList"
        import="java.util.Hashtable"
        import="java.util.Map"
        import="java.util.List"
        import="tentacles.http_tools.GetClusterMetaInstanceInService"
        import="tentacles.http_tools.*"
        import="tentacles.matrix_util.*"
        import="tentacles.util.*"
%>
        
        
       

        
<%
    String matrixNode = request.getParameter("matrixnode");
    String [] matrxiNodeArry = {matrixNode};
    Map<Object,Map<String,Map<String,Object>> > resMap = 
            new GetInstanceMetaInService().GetMetaInstanceMap(matrxiNodeArry);

            out.println("<br>");
            out.println("========================================================");
            out.println("<br>");
            String [] matrixNodeInfo = matrixNode.split(":");
            String ms = matrixNodeInfo[0];
            String user = matrixNodeInfo[2];
            String token = matrixNodeInfo[3];
            String service = matrixNodeInfo[4];
            if ( matrixNodeInfo.length == 5 ) {
                user = matrixNodeInfo[1];
                token = matrixNodeInfo[2];
                service = matrixNodeInfo[3];
            }
            out.println("<a href=http://" + ms + ":8529/servicedetail.jsp?serviceName=" + service + ">" + 
                    matrixNode + "</a>");
            out.println("<br>");
            for ( Map.Entry<Object,Map<String,Map<String,Object>>> entry1 : resMap.entrySet()  ){
                out.println("meta json is : ");
                out.println("<br>");
                out.println(entry1.getKey());
                out.println("<br>");
                for ( Map.Entry<String,Map<String,Object>> entryChild : entry1.getValue().entrySet() ) {
                    out.println(entryChild.getKey() + ":" + entryChild.getValue().get("State") + ":" + entryChild.getValue().get("ErrorCode"));
                    out.println("<br>");

                }

            }


%>


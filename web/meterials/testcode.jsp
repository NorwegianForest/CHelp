<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.io.*, java.util.*" import="com.DBQuery.DataProcess" import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../highlight/styles/default.css" rel="stylesheet">  
<title>Insert title here</title>
</head>
<body>
<script src="../highlight/highlight.pack.js"></script>  
<script >hljs.initHighlightingOnLoad();</script>

            <pre>
                <code class="c">
        function init(){
            $scope.req.getArticle();
            $('pre code').each(function(i, block) {
                hljs.highlightBlock(block);
            });
        }
        
#include &lt;stdio.h&gt;      
        
main()  
{     
    int a = 20;     
    int b = 10;     
    int c = 15;     
    int d = 5;     
    int e;        
    e = (a + b) * c / d;      // ( 30 * 15 ) / 5      
    printf(&quot;(a + b) * c / d 的值是 %d\n&quot;,  e );        
    e = ((a + b) * c) / d;    // (30 * 15 ) / 5      
    printf(&quot;((a + b) * c) / d 的值是 %d\n&quot; ,  e );        
    e = (a + b) * (c / d);   // (30) * (15/5)      
    printf(&quot;(a + b) * (c / d) 的值是 %d\n&quot;,  e );        
    e = a + (b * c) / d;     //  20 + (150/5)      
    printf(&quot;a + (b * c) / d 的值是 %d\n&quot; ,  e );         
    return 0;  
}        
                </code>
            </pre>
</body>
</html>
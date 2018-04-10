<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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

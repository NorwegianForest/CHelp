<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="gb2312"%>
    <%@ page import="java.io.*, java.util.*" import="com.DBQuery.DataProcess" import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../highlight/styles/default.css" rel="stylesheet">  
<title>C ���Խ̳� | C Help</title>
</head>
<body>
<script src="../highlight/highlight.pack.js"></script>  
<script >hljs.initHighlightingOnLoad();</script>


	
    <h1>C ��������</h1>
    <hr />
    <h2>���ػ�������</h2>
    <p>�������Ҫ���� C ���Ի���������Ҫȷ��������������������õ�������ı��༭���� C ��������</p>
    <hr />
    <h2>�ı��༭��</h2>
    <p>�⽫�����������ĳ����ı��༭������ Windows Notepad��OS Edit command��Brief��Epsilon��EMACS �� vim/vi��</p>
    <p>�ı��༭�������ƺͰ汾�ڲ�ͬ�Ĳ���ϵͳ�Ͽ��ܻ�������ͬ�����磬Notepad ͨ������ Windows ����ϵͳ�ϣ�vim/vi ������ Windows �� Linux/UNIX ����ϵͳ�ϡ�</p>
    <p>ͨ���༭���������ļ�ͨ����ΪԴ�ļ���Դ�ļ���������Դ���롣C �����Դ�ļ�ͨ��ʹ����չ�� &quot;<strong>.c</strong>&quot;��</p>
    <p>�ڿ�ʼ���֮ǰ����ȷ������һ���ı��༭���������㹻�ľ�������дһ�����������Ȼ�����������һ���ļ��У����벢ִ������</p>
    <hr />
    <h2>C ������</h2>
    <p>д��Դ�ļ��е�Դ����������ɶ���Դ������Ҫ&quot;����&quot;��תΪ�������ԣ����� CPU ���԰�����ָ��ִ�г���</p>
    <p>C ���Ա��������ڰ�Դ�����������յĿ�ִ�г�������������Ѿ��Ա�����Ա������л������˽��ˡ�</p>
    <p>��õ���ѿ��õı������� GNU �� C/C++ �������������ʹ�õ��� HP �� Solaris�������ʹ�ø��Բ���ϵͳ�ϵı�������</p>
    <p>���²��ֽ�ָ��������ڲ�ͬ�Ĳ���ϵͳ�ϰ�װ GNU �� C/C++ ������������ͬʱ�ᵽ C/C++����Ҫ����Ϊ GNU �� gcc �������ʺ��� C �� C++ ������ԡ�</p>
    <h3>UNIX/Linux �ϵİ�װ</h3>
    <p>�����ʹ�õ��� <strong>Linux �� UNIX</strong>������������ʹ��������������������ϵͳ���Ƿ�װ�� GCC��</p>
    <pre>&nbsp;&nbsp;$ gcc -v</pre>
    <p>������ļ�������Ѿ���װ�� GNU �������������ʾ������Ϣ��</p>
    <pre>&nbsp;&nbsp;Using built-in specs.<br>
    Target: i386-redhat-linux<br>
    Configured with: ../configure --prefix=/usr .......<br>
    Thread model: posix<br>
    gcc version 4.1.2 20080704 (Red Hat 4.1.2-46)</pre>
    <p>���δ��װ GCC����ô�밴�� <a href="http://gcc.gnu.org/install/" rel="nofollow" target="_blank">http://gcc.gnu.org/install/</a> �ϵ���ϸ˵����װ GCC��</p>
    <p>���̳��ǻ��� Linux ��д�ģ����и�����ʵ�������� Cent OS Linux ϵͳ�ϱ������</p>
    <h3>Mac OS �ϵİ�װ</h3>
    <p>�����ʹ�õ��� Mac OS X�����ݵĻ�ȡ GCC �ķ����Ǵ�ƻ������վ������ Xcode ���������������հ�װ˵�����а�װ��һ����װ�� Xcode��������ʹ�� GNU ��������</p>
    <p>Xcode Ŀǰ�ɴ� <a href="http://developer.apple.com/technologies/tools/" rel="nofollow" target="_blank">developer.apple.com/technologies/tools/</a> �����ء�</p>
    <h3>Windows �ϵİ�װ</h3>
    <p>Ϊ���� Windows �ϰ�װ GCC������Ҫ��װ MinGW��Ϊ�˰�װ MinGW������� MinGW ����ҳ <a href="http://www.mingw.org/" rel="nofollow" target="_blank">www.mingw.org</a>������ MinGW ����ҳ�棬�������°汾�� MinGW ��װ����������ʽΪ MinGW-&lt;version&gt;.exe��</p>
    <p>����װ MinWG ʱ��������Ҫ��װ gcc-core��gcc-g++��binutils �� MinGW runtime������һ������¶��ᰲװ�����������</p>
    <p>�������װ�� MinGW �� bin ��Ŀ¼������ <strong>PATH</strong> ���������У��������Ϳ�������������ͨ���򵥵�������ָ����Щ���ߡ�</p>
    <p>����ɰ�װʱ�������Դ� Windows ������������ gcc��g++��ar��ranlib��dlltool ������һЩ GNU ���ߡ�</p>
    

    
</body>
</html>
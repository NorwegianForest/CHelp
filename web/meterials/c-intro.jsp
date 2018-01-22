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


	  

	  
    <h1>C ���</h1>
    <div>
      <p>C ������һ��ͨ�õĸ߼����ԣ�������ɵ���˹�����ڱ���ʵ����Ϊ���� UNIX ����ϵͳ����Ƶġ�C �����ʼ���� 1972 ���� DEC PDP-11 ������ϱ��״�ʵ�֡�</p>
      <p>�� 1978 �꣬���������ֺ���Brian Kernighan���͵���˹���棨Dennis Ritchie�������� C �ĵ�һ���������õ����������ڱ���Ϊ K&amp;R ��׼��</p>
      <p>UNIX ����ϵͳ��C���������ͼ������е� UNIX Ӧ�ó������� C ���Ա�д�ġ����ڸ���ԭ��C ���������Ѿ���Ϊһ�ֹ㷺ʹ�õ�רҵ���ԡ�</p>
      <ul>
        <li>����ѧϰ��</li>
        <li>�ṹ�����ԡ�</li>
        <li>��������Ч�ʵĳ���</li>
        <li>�����Դ����ײ�Ļ��</li>
        <li>�������ڶ��ּ����ƽ̨�ϱ��롣</li>
      </ul>
    </div>
    <hr />
    <h2>���� C</h2>
    <ul>
      <li>C ������Ϊ�˱�д UNIX ����ϵͳ���������ġ�</li>
      <li>C �������� B ����Ϊ�����ģ�B ���Դ������ 1970 �걻�����ġ�</li>
      <li>C ���Ա�׼���� 1988 �����������ұ�׼Э�ᣨANSI��ȫ�� American National Standard Institute���ƶ��ġ�</li>
      <li>���� 1973 �꣬UNIX ����ϵͳ��ȫʹ�� C ���Ա�д��</li>
      <li>Ŀǰ��C ��������㷺ʹ�õ�ϵͳ����������ԡ�</li>
      <li>������Ƚ�����������ʹ�� C ����ʵ�ֵġ�</li>
      <li>���������е� Linux ����ϵͳ�� RDBMS��Relational Database Management System����ϵ���ݿ����ϵͳ�� MySQL ����ʹ�� C ���Ա�д�ġ�</li>
    </ul>
    <hr />
    <h2>ΪʲôҪʹ�� C��</h2>
    <p>C �������������ϵͳ�����������ر�����ɲ���ϵͳ�ĳ������� C �����������Ĵ��������ٶ��������Ա�д�Ĵ��������ٶȼ���һ�������Բ��� C ������Ϊϵͳ�������ԡ������оټ���ʹ�� C ��ʵ����</p>
    <ul>
      <li>����ϵͳ</li>
      <li>���Ա�����</li>
      <li>�����</li>
      <li>�ı��༭��</li>
      <li>��ӡ��</li>
      <li>����������</li>
      <li>�ִ�����</li>
      <li>���ݿ�</li>
      <li>���Խ�����</li>
      <li>ʵ�幤��</li>
    </ul>
    <hr />
    <h2>C ����</h2>
    <p>һ�� C ���Գ��򣬿����� 3 �У�Ҳ�������������У�������д��һ��������չ��Ϊ <strong>&quot;.c&quot;</strong> ���ı��ļ��У����磬<em>hello.c</em>��������ʹ�� <strong>&quot;vi&quot;</strong>��<strong>&quot;vim&quot;</strong> ���κ������ı��༭������д���� C ���Գ���</p>
    <p>���̳̼ٶ����Ѿ�֪����α༭һ���ı��ļ����Լ�����ڳ����ļ��б�дԴ���롣</p>
    <hr />
    <h2>C11</h2>
    <p>C11��Ҳ����ΪC1X��ָISO��׼ISO/IEC 9899:2011���ǵ�ǰ���µ�C���Ա�׼������֮ǰ��C���Ա�׼ΪC99��</p>
    <h3>������</h3>
    <ul>
      <li>
        <p>���봦����Alignment���ı�׼��������_Alignas��־����alignof�������aligned_alloc�����Լ�&lt;stdalign.h&gt;ͷ�ļ�����</p>
      </li>
      <li>
        <p>_Noreturn ������ǣ������� gcc �� __attribute__((noreturn))��</p>
      </li>
      <li>
        <p>_Generic �ؼ��֡�</p>
      </li>
      <li>
        <p>���̣߳�Multithreading��֧�֣�������<br />
          _Thread_local�洢���ͱ�ʶ����&lt;threads.h&gt;ͷ�ļ�������������̵߳Ĵ����͹���������<br />
          _Atomic�������η���&lt;stdatomic.h&gt;ͷ�ļ���</p>
      </li>
      <li>
        <p>��ǿ��Unicode��֧�֡�����C Unicode��������ISO/IEC TR 19769:2004����ǿ�˶�Unicode��֧�֡�����ΪUTF-16/UTF-32����������char16_t��char32_t�������ͣ��ṩ�˰���unicode�ַ���ת��������ͷ�ļ�&lt;uchar.h&gt;��</p>
      </li>
      <li>
        <p>ɾ���� gets() ������ʹ��һ���µĸ���ȫ�ĺ���gets_s()�����</p>
      </li>
      <li>
        <p>�����˱߽��麯���ӿڣ��������µİ�ȫ�ĺ��������� fopen_s()��strcat_s() �ȵȡ�</p>
      </li>
      <li>
        <p>�����˸��ม�㴦����(��)��</p>
      </li>
      <li>
        <p>�����ṹ��/������֧�֡������gcc���Ѵ��ڣ�C11���������׼��</p>
      </li>
      <li>
        <p>��̬���ԣ�Static assertions����_Static_assert()���ڽ��� #if �� #error ֮�󱻴�����</p>
      </li>
      <li>
        <p>�µ� fopen() ģʽ��(&quot;��x&quot;)������ POSIX �е� O_CREAT|O_EXCL�����ļ����бȽϳ��á�</p>
      </li>
      <li>
        <p>���� quick_exit() ������Ϊ��������ֹ����ķ�ʽ���� exit()ʧ��ʱ���������ٵ�����������</p>
      </li>
    </ul>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <br />
    <p>      
    
    <br>

    

    
</body>
</html>
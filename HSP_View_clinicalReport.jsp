<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.lang.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.util.*,java.io.*,javax.servlet.*,javax.servlet.http.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Report</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-quicksand.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style22 {font-size: 14px; font-weight: bold; }
.style25 {color: #FFFF00}
.style26 {font-size: 14px; font-weight: bold; color: #FFFF00; }
-->
</style>
<script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}
</script>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html" class="style2">SAFE HEALTH DATA SHARING: A METHOD FOR PROTECTING YOUR MEDICAL RECORDS</a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="HSP_Main.jsp"><span>Home</span></a></li>
          <li><a href="HSP_Login.jsp"><span>Logout</span></a></li>		 
        </ul>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="935" height="293" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="935" height="293" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="935" height="293" alt="" /> </a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>Clinical Reports </span></h2>
          <p class="infopost">&nbsp;</p>
          <div class="clr"></div>
          <div>
		                <p>&nbsp;</p>
		                <table width="580" border="1" cellpadding="0" style="border-collapse:collapse" cellspacing="0" align="center">
                          <tr>
                            <td width="34" height="34" bgcolor="#FF0000"><div align="center" class="style22 style25"> ID </div></td>
                            <td width="126" bgcolor="#FF0000"><div align="center" class="style26">Patient Name </div></td>
                            <td width="132" bgcolor="#FF0000"><div align="center" class="style26">Provider Name </div></td>
                            <td width="143" bgcolor="#FF0000"><div align="center" class="style26">View Report </div></td>
                            <td width="133" bgcolor="#FF0000"><div align="center" class="style26">Status</div></td>
                          </tr>
                          <%

	String pname=(String) application.getAttribute("pname");
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

      	try 
	{
		
        	
      		String query="select * from patient_reports where provider='"+pname+"' and status='Forwarded' "; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		i=rs.getInt(1);
		s2=rs.getString(2);
		s3=rs.getString(3);
		s4=rs.getString(4);
		s5=rs.getString(5);
		s6=rs.getString(6);
	
		%>
                          <tr>
                            <td height="31"><div align="center"><%=i%></div></td>
                            <td><div align="center"><%=s2%></div></td>
                            <td><div align="center"><%=s3%></div></td>
                            <td><div align="center">
                              <form action="HSP_report.jsp" method="get">
                                  <input type="hidden" name="patient" value="<%=s2%>" />
                                  <input type="hidden" name="provider" value="<%=s3%>" />
                                  <input name="Input" type="submit" value="View" />
                              </form>
                            </div></td>
							<%if(s6.equalsIgnoreCase("Forwarded")){%>
                            <td><div align="center">Approved To View</div></td>
							<%}else{%>
                            <td><div align="center"><%=s6%></div></td>
							<%}%>
                          </tr>
                          <%i++;
	   }
	  
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
            </table>
		                <p>&nbsp;</p>
		                <p align="right"><a href="HSP_Main.jsp">Back</a></p>
          </div>
          <div class="clr"></div>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            <span>
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
            </span>
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
        </div>
        <div class="clr"></div>
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="HSP_Main.jsp">&raquo; Home </a></li>
            <li><a href="HSP_Login.jsp">&raquo; Logout </a></li>
          </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg"></div>
  <div class="footer"></div>
</div>
<div align=center></div>
</body>
</html>

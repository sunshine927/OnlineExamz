<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*"
    pageEncoding="UTF-8"%>
 <%@ page import="bean.StInfo"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加考生信息</title>
<script type="text/javascript">

function check(){//js表单验证
	var nam=document.getElementById("nam").value; 
	var yuanx=document.getElementById("yuanx").value; 
	var telephone=document.getElementById("telephone").value;
	var sfzh=document.getElementById("sfzh").value;
	var email=document.getElementById("email").value;
		 if(document.getElementById("pwd").value==""){
			 alert("请输入密码！");
			 return false;
		 }
		if(nam.length<2||nam.length>4||escape(nam).indexOf( "%u" )<0){
			   alert("姓名输入有误！");
			   return false;
			   }
	
	   // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X  
		var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;  
	   if(reg.test(sfzh) === false)  
	   {  
	       alert("身份证号输入不合法");  
	       return  false;  
	   }  
	   if(document.getElementById("addr").value==""){
			 alert("请输入通讯地址！");
			 return false;
			 } 
	   if(yuanx){
		   if(escape(yuanx).indexOf( "%u" )<0){
			   alert("院校名称不合法！");
			   return false;
			   }
		}
	   if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(telephone)))
	   {
		   alert("请输入正确的手机号码！");
	       return false;
	 
	   }
	   if(email){
		   var reg= /[a-zA-Z0-9]{1,10}@[a-zA-Z0-9]{1,5}\.[a-zA-Z0-9]{1,5}/;   
		   if ( !(reg.test(email))) {
			   alert( "您输入的电子邮件地址不合法" );    
		       return false; 
			}
	   }    
 return true;
}
</script>
<style type="text/css">
.but{

            width:90px; /*宽*/
            height: 30px;/*高*/
             font-size: 16px;
        
        }
		.STYLE3 {
	font-family: "微软雅黑";
	font-size: 18px;
	color: #0099FF;
	font-weight: bold;
}
 .STYLE7 {color: #FF0000}
 .noborder{
border:none;
}
		.STYLE8 {
	font-size: 18px;
	font-family: "微软雅黑";
}
.STYLE10 {font-size: 24px}
.STYLE11 {color: #000000}
</style>
</head>
<body>
<p class="STYLE8">当前位置：添加考生信息</p>
<p align="left" class="STYLE3">—————————————————————————————————————————</p>

 <p>&nbsp;</p>
 <p><strong>该考生信息：</strong>

<table width="756" border="0" align="center" cellspacing="0" bordercolor="#CCCCCC" >
      <form action="addstServlet" method="post" onsubmit="return check()">       
              <tr>
               <td align="right" class="ast">用&nbsp; 户&nbsp;&nbsp; 名：</td>    <!--隐藏表单域用于传值-->
      <td valign="middle" style="height:40px;"><%=((StInfo)session.getAttribute("stInfo")).getUsername() %><input type="hidden" name="no" value="<%= ((StInfo)session.getAttribute("stInfo")).getUsername()%>"/>
            </td>
               <td align="right" class="ast">就读院校：</td>
    <td style="height:40px;"><input type="text" name="yuanx" id="yuanx" size="20" maxlength="30" value="<%	if(((StInfo)session.getAttribute("stInfo")).getUniversity()==null){
	  out.print("");
	  }
  else{
	  out.print(((StInfo)session.getAttribute("stInfo")).getUniversity()); 
  }%>" style="height:23px;line-height:18px;"/> </td>
    </tr>
    
    <tr>
          <td align="right" class="ast"><span class="STYLE7">*</span>密　　码：</td>
<td style="height:40px;"><input type="text" name="pwd"  value="<%=((StInfo)session.getAttribute("stInfo")).getPassword() %>" id="pwd" size="21" maxlength="16" style="height:23px;line-height:18px;"/>             </td>
<td align="right" class="ast">专　　业：</td>
    <td style="height:40px;"><input type="text" name="spe" id="spe" size="20" maxlength="30" value="<% 
    if(((StInfo)session.getAttribute("stInfo")).getSpecial()==null){
  	  out.print("");
  	  }
    else{
  	  out.print(((StInfo)session.getAttribute("stInfo")).getSpecial()); 
    }
  	  %>" style="height:23px;line-height:18px;" /></td>
</tr>

    <td align="right" class="ast"><span class="STYLE7">*</span>手机号码：</td>
    <td style="height:40px;"><input type="text" name="telephone" id="telephone" size="20" maxlength="11" value="<%=((StInfo)session.getAttribute("stInfo")).getTelephone()%>" style="height:23px;line-height:18px;"/> </td>     

          </tr>
<tr>
          <td align="right" class="ast"><span class="STYLE7">*</span>姓　　名：</td>
    <td style="height:40px;"><input type="text" name="nam" id="nam" size="20" maxlength="4" value="<%=((StInfo)session.getAttribute("stInfo")).getName() %>" style="height:23px;line-height:18px;"
          /></td>
          <td align="right" class="ast">邮箱地址：</td>
    <td style="height:40px;"><input type="text" name="email" id="email" size="20" value="<% if(((StInfo)session.getAttribute("stInfo")).getEmail()==null){out.print(""); } else{out.print(((StInfo)session.getAttribute("stInfo")).getEmail()); }
  	  %>" style="height:23px;line-height:18px;"/> </td>
          </tr>
<tr>
<td align="right" class="ast"><span class="STYLE7">*</span>性　　别：</td>
           <td style="height:40px;">   <input name="xb" type="radio"  value = "男" id="RadioGroup1_0" class="noborder" <%if(((StInfo)session.getAttribute("stInfo")).getSex().equals("男")) out.print("checked");%>>
      男&nbsp; 
           <input type="radio" name="xb" id="RadioGroup1_1" value = "女" class="noborder" <%if(((StInfo)session.getAttribute("stInfo")).getSex().equals("女")) out.print("checked");%>> 女       </td>
</tr>

<tr>          
    <td align="right" class="ast"><span class="STYLE7">*</span>学　　历：</td>
   <td style="height:40px;">
      <select name="xueli" style="width:120px;height:20px;" id="xueli">
        <option value="<%=((StInfo)session.getAttribute("stInfo")).getXueli() %>" selected="selected"><%=((StInfo)session.getAttribute("stInfo")).getXueli() %></option>
        <option value="博士">博士</option>
        <option value="硕士">硕士</option>
        <option value="本科">本科</option>
        <option value="专科">专科</option>
        <option value="高中">高中</option>
        <option value="中专">中专</option>
        <option value="初中">初中</option>
        <option value="小学">小学</option>
      </select>
   </td>
   </tr>
<tr>
          <td align="right" class="ast"><span class="STYLE7">*</span>身份证号：</td>
    <td style="height:40px;"><input type="text" name="sfzh" id="sfzh" size="20" maxlength="30" value="<%=((StInfo)session.getAttribute("stInfo")).getCard() %>" style="height:23px;width:200px;line-height:18px;"/> </td></tr>
  <tr>  <td align="right" class="ast"><span class="STYLE7">*</span>通讯地址：</td>
    <td style="height:40px;"><input type="text" name="addr" id="addr" size="20" value="<%=((StInfo)session.getAttribute("stInfo")).getAddress() %>" style="height:23px;width:200px;line-height:18px;"
          /></td>  </tr>
  <tr style="text-align:center;" colspan="2";>
          <td colspan="2" align="right"><input type="submit" class="but"  value="提交"/></td>
    </tr>
</form>
       
</table>
 
   <p>&nbsp;</p>
</body>
</html>
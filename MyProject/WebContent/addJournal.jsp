<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.entities.Journal,com.actions.RegularShareAction" %>
<%!
List<Journal> list=new ArrayList<Journal>();
%>
<%
session.setAttribute("bankname", session.getAttribute("bankName"));
session.setAttribute("bankcode", session.getAttribute("bankCode"));
Journal j=new Journal();
j.setAccountno(session.getAttribute("accountno"));
j.setReference(session.getAttribute("reference"));

String credit=request.getParameter("credit");
if(credit!=""){
	if(credit==null){
	}
	else{
		j.setCredit(Double.parseDouble(request.getParameter("credit")));;
}

}	
	
	
String debit=request.getParameter("debit");
if(debit!=""){
	if(debit==null){
	}
	else{
		j.setDebit(Double.parseDouble(request.getParameter("debit")));
}
}	
j.setNarration(request.getParameter("narration"));
String acctype=request.getParameter("accName");
String bankname=session.getParameter("bankname1");
String bankcode=session.getParameter("bankcode1");
String tNumber=request.getParameter("tNo");
String tDate=request.getParameter("tDate");
String tType=request.getParameter("tType");
String name=request.getParameter("name");
j.setName(name);
j.setCname(cname);
j.setCcode(ccode);
j.settNo(tNo);
j.settDate(tDate);
j.settType(tType);


if(acctype!=null)
list.add(j);
session.setAttribute("j", j);
session.setAttribute("journal", list);
request.getRequestDispatcher("/journal.do").forward(request, response);
%> --%>
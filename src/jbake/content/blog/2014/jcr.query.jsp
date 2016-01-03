<%--
  JCR Query API component.
  Component for dumping list of components found
--%><%@page session="false" %>
<%@include file="/libs/foundation/global.jsp"%>
<%@page import="javax.jcr.query.Query, java.util.Iterator" %>
<h2>Components from javax.jcr.query</h2>
<ul>
    <li># <strong>Component Title</strong> path</li>
<%
    // final String xpath = "/jcr:root/apps//element(*, cq:Component) order by @jcr:title";
    // Iterator<Resource> rscIterator = resourceResolver.findResources(xpath, Query.XPATH);
    final String sql2 = "SELECT * FROM [cq:Component] AS c WHERE ISDESCENDANTNODE([/apps]) ORDER BY lower(c.[jcr:title])";
    Iterator<Resource> rscIterator = resourceResolver.findResources(sql2, Query.JCR_SQL2);
%>
  <c:forEach var="compRsc" items="<%= rscIterator %>" varStatus="i">
    <%-- conversion steps to aid in getting Resource properties --%>
    <c:set var="compProps" value="<%= ((Resource)pageContext.getAttribute("compRsc")).adaptTo(ValueMap.class) %>" />
    <li>${i.count}: <strong>${compProps['jcr:title']}</strong> ${compRsc.path}</li>
  </c:forEach>
</ul>

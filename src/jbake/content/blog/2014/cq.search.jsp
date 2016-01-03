<%--
  CQ Query API component.
  Component for dumping list of components found
--%><%@page session="false" %>
<%@include file="/libs/foundation/global.jsp"%>
<%@page import="java.util.*, com.day.cq.search.*, com.day.cq.search.result.*" %>
<h2>Components from com.day.cq.search (QueryBuilder)</h2>
<ul>
    <li># <strong>Component Title</strong> path</li>
<%
    Map<String, String> predicates = new HashMap<String, String>() {{
        put("path", "/apps");
        put("type", "cq:Component");
        put("orderby", "@jcr:title");
    }};

    QueryBuilder qb = resourceResolver.adaptTo(QueryBuilder.class);
    Session session = resourceResolver.adaptTo(Session.class);

    Query query = qb.createQuery(PredicateGroup.create(predicates), session);
    query.setHitsPerPage(0); // return ALL results
    Iterator<Resource> rscIterator = query.getResult().getResources();
%>
  <c:forEach var="compRsc" items="<%= rscIterator %>" varStatus="i">
    <%-- conversion steps to aid in getting Resource properties --%>
    <c:set var="compProps" value="<%= ((Resource)pageContext.getAttribute("compRsc")).adaptTo(ValueMap.class) %>" />
    <li>${i.count}: <strong>${compProps['jcr:title']}</strong> ${compRsc.path}</li>
  </c:forEach>
</ul>

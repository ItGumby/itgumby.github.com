<#include "header.ftl">
	<#include "menu.ftl">
	<div class="page-header"><h1>tag: ${tag}</h1></div>
	
	<!--<ul>-->
	<#list tag_posts as post>
	<#if (last_month)??>
		<#if post.date?string("MMMM yyyy") != last_month>
			</ul>
			<h4>${post.date?string("MMMM yyyy")}</h4>
			<ul>
		</#if>
	<#else>
		<h4>${post.date?string("MMMM yyyy")}</h4>
		<ul>
	</#if>
	
	<li>${post.date?string("dd")} - <a href="${content.rootpath}${post.uri}">${post.title}</a></li>
	<#assign last_month = post.date?string("MMMM yyyy")>
	</#list>
	</ul>

	<div class="row">
	<h2>Other Topics:</h2>
	<p><#list alltags as tag>
		<a href="/tags/${tag?trim?replace(' ','-')}.html">${tag}</a> 
	</#list></p>
	</div>
	
<#include "footer.ftl">
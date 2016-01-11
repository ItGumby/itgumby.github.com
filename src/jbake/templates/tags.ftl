<#include "header.ftl">
	<#include "menu.ftl">
	<div class="page-header"><h1>tag: ${tag}</h1></div>

	<!--<ul>-->
	<#list tag_posts as post>
	<#if (prev_year)??>
		<#if post.date?string("yyyy") != prev_year>
			</ul>
			<h4>${post.date?string("yyyy")}</h4>
			<ul>
		</#if>
	<#else>
		<h4>${post.date?string("yyyy")}</h4>
		<ul>
	</#if>

	<li>${post.date?string("yyyy-MMM-dd")} - <a href="${content.rootpath}${post.uri}">${post.title}</a></li>
	<#assign prev_year = post.date?string("yyyy")>
	</#list>
	</ul>

	<div class="row">
	<h3>Other Topics:</h3>
	<!--<ul>-->
	<#list alltags as tag>
		<li><a href="/tags/${tag?trim?replace(' ','-')}.html">${tag}</a></li>
	</#list>
	</ul>
	</div>

<#include "footer.ftl">

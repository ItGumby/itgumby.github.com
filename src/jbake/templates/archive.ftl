<#include "header.ftl">
	<#include "menu.ftl">

	<#if content.body??>${content.body}</#if>

	<div class="page-header"><h1>Archive</h1></div>

	<!--<ul>-->
		<#list published_posts as post>
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

		<li>${post.date?string("yyyy-MMM-dd")} - <a href="/${post.uri}"><#escape x as x?xml>${post.title}</#escape></a></li>
		<#assign prev_year = post.date?string("yyyy")>
		</#list>
	</ul>

<#include "footer.ftl">

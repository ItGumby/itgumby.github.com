<#include "header.ftl">
<#include "menu.ftl">

<h1>Blog Posts</h1>

<#list posts as post>
	<#if (post.status == "published")>
		<div class="panel panel-default">
			<div class="panel-body">
				<a href="${post.uri}"><h2><#escape x as x?xml>${post.title}</#escape></h2></a>
			</div>
			<div class="panel-footer">
				<div class="text-left">${post.date?string("yyyy-MM-dd")}</div>
				<div class="text-right">
				 <em>Tags: </em>
				<#list post.tags as tag>
					<a href="/${config.tag_path}/${tag?trim?replace(' ','-')}.html">${tag}</a><#sep>, </#sep>
				</#list>
				</div>
			</div>
		</div>
	</#if>
</#list>

<#include "footer.ftl">

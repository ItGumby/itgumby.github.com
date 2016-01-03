<#include "header.ftl">
	<#include "menu.ftl">
	<div class="page-header"><h1>Blog</h1></div>
    <#assign lastposts = posts[0..3]>
	<#list lastposts as post>
  		<#if (post.status == "published")>
  			<a href="${post.uri}"><h1><#escape x as x?xml>${post.title}</#escape></h1></a>
  			<p>${post.date?string("dd MMMM yyyy")}</p>
			<p>
				<em>Tags: </em>
				<#list post.tags as tag>
					<a href="/tags/${tag?trim?replace(' ','-')}.html">${tag}</a> 
				</#list>
			</p>
  			<p>${post.body}</p>
  		</#if>
  	</#list>
	
	<hr />
	<p>Older posts are available in the <a href="${content.rootpath}${config.archive_file}">archive</a>.</p>
<#include "footer.ftl">
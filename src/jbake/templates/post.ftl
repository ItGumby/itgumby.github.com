<#include "header.ftl">
<#include "menu.ftl">
<div class="page-header">
	<h1><#escape x as x?xml>${content.title}</#escape></h1>
</div>
<p><em>${content.date?string("yyyy-MM-dd")}</em></p>
<p>
	<em>Tags: </em>
	<#list content.tags as tag>
		<a href="/${config.tag_path}/${tag?trim?replace(' ','-')}.html">${tag}</a>
	</#list>
</p>

<p>${content.body}</p>
<#include "footer.ftl">

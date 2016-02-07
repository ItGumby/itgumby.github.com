<#include "header.ftl">
<#include "menu.ftl">
<div class="page-header">
	<h1><#escape x as x?xml>${content.title}</#escape></h1>
</div>
<p><em>${content.date?string("yyyy-MM-dd")}</em></p>
${content.body}
<#include "footer.ftl">

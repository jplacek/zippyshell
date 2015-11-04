<#function getTemplate>
	<#return prismicContent["landing-page.content"]["content-group.content"][0]["template"]>
</#function>

<#function val key>
	<#return tpl[tplType+"."+key]>
</#function>

<#assign stats = requestParams["stats"]?? && requestParams["stats"][0] = "true">
<#if stats != true && prismicContent??>
	<#assign tpl = getTemplate()>
	<#assign tplType = tpl["document-type-label"]>
	<#if tplType = "template-a">
		<#include "template-a.ftl">
	<#elseif tplType = "template-b">
		<#include "template-b.ftl">
	<#elseif tplType = "template-c">
		<#include "template-c.ftl">
	<#else>
		<#include "stats.ftl">
	</#if>	
<#else>
	<#include "stats.ftl">
</#if>
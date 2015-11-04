<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Zippy Shell</title>
	<style>
		body {
			font-family: arial;
		}
		td {
			border: 1px solid gray;
			padding: 5px;
		}
		td.label {
			font-weight: bold;
		}
	</style>
</head>
<body>
	<table>
		<tr>
			<td class="label">domain</td>
			<td class="data">${config.domain}</td>
		</tr>		
		<tr>
			<td class="label">uri</td>
			<td class="data">${config.uriPath}</td>
		</tr>
		<tr>
			<td class="label">purl</td>
			<td class="data">${purl}</td>
		</tr>
		<tr>
			<td class="label">offer</td>
			<td class="data">${offerName!"none"}</td>
		</tr>				
		<tr>
			<td class="label">stats</td>
			<td class="data"><#if requestParams["stats"]?? && requestParams["stats"][0] == "true">yes<#else>no</#if></td>
		</tr>		
		<tr>
			<td class="label">prismicContent</td>
			<td class="data">
				<#if prismicContent??>
					<#assign tpl = getTemplate()>
					<#assign tplType = tpl["document-type-label"]>

					<table>					
						<tr>
							<td class="label">documentId</td>
							<td class="data">${prismicContent["documentId"]}</td>
						</tr>						
						<tr>
							<td class="label">variant</td>
							<td class="data">${prismicContent["variant"]}</td>
						</tr>
						<tr>
							<td class="label">campaign</td>
							<td class="data">${prismicContent["landing-page.campaign"]}</td>
						</tr>
						<tr>
							<td class="label">prismic_label</td>
							<td class="data">${prismicContent["landing-page.prismic_label"]}</td>
						</tr>
						<tr>
							<td class="label">prismic_label for content</td>
							<td class="data">${prismicContent["landing-page.content"]["content-group.prismic_label"]}</td>
						</tr>
						<tr>
							<td class="label">template type</td>
							<td class="data">${tplType}</td>
						</tr>
						<tr>
							<td class="label">template data</td>
							<td class="data">${tpl[tplType+".prismic_label"]}</td>
						</tr>
					</table>			
				</#if>	
			</td>
		</tr>


		<tr>
			<td class="label">userAgent</td>
			<td class="data"><span id="userAgent"></span></td>
		</tr>
		<tr>
			<td class="label">latitude</td>
			<td class="data"><span id="latitude"></span></td>
		</tr>
		<tr>
			<td class="label">longitude</td>
			<td class="data"><span id="longitude"></span></td>
		</tr>		
		<tr>
			<td class="label">is mobile</td>
			<td class="data"><span id="isMobile"></span></td>
		</tr>
		<tr>
			<td class="label">browser</td>
			<td class="data"><span id="browser"></span></td>
		</tr>
		<tr>
			<td class="label">browser major version</td>
			<td class="data"><span id="browserMajorVersion"></span></td>
		</tr>
		<tr>
			<td class="label">browser version</td>
			<td class="data"><span id="browserVersion"></span></td>
		</tr>
		<tr>
			<td class="label">os</td>
			<td class="data"><span id="os"></span></td>
		</tr>
		<tr>
			<td class="label">osVersion</td>
			<td class="data"><span id="osVersion"></span></td>
		</tr>
		<tr>
			<td class="label">screen</td>
			<td class="data"><span id="screen"></span></td>
		</tr>
		<tr>
			<td class="label">ip</td>
			<td class="data">${ip}</td>
		</tr>
	</table>	

	<script type="text/javascript" src="/resources/zippyshell/js/jquery.min.js"></script>	
	<script type="text/javascript" src="/resources/zippyshell/js/modernizr.js"></script>	
	<script type='text/javascript' src="/resources/zippyshell/js/jscd.js"></script>

	<script type="text/javascript">	
	$(document).ready(function() {
		$('#userAgent').html(navigator.userAgent);
		if(Modernizr.geolocation) {
			navigator.geolocation.getCurrentPosition(function(position) {
				$('#latitude').html(position.coords.latitude);
				$('#longitude').html(position.coords.longitude);
			}, function(error) { console.info('error'); }, { enableHighAccuracy: true });
		}		
		$('#browser').html(jscd.browser);
		$('#browserMajorVersion').html(jscd.browserMajorVersion);
		$('#browserVersion').html(jscd.browserVersion);
		$('#os').html(jscd.os);
		$('#osVersion').html(jscd.osVersion);
		$('#screen').html(jscd.screen);
		$('#isMobile').html(jscd.mobile ? 'yes' : 'no');
	});
	</script>
</body>
</html>
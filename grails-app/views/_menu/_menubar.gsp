<div class="">
	<ul class="nav nav-tabs" data-role="listview" data-split-icon="gear" data-filter="true">
		<g:set var="logicalPropertyNames" value="${['home', 'game', 'bet', 'team', 'stats']}"/>
		<g:each status="i" var="logicalPropertyName" in="${['home', 'game', 'bet', 'team', 'stats']}">
			<li class="controller${params.controller == logicalPropertyName ? " active" : ""}">
				<g:link controller="${logicalPropertyName}" action="index">
					<g:if test="${logicalPropertyName.contains('home')}"><i class="glyphicon glyphicon-home"></i></g:if>
					<g:if test="${logicalPropertyName.contains('game')}"><i class="glyphicon glyphicon-tower"></i></g:if>
					<g:if test="${logicalPropertyName.contains('team')}"><i class="glyphicon glyphicon-flag"></i></g:if>
					<g:if test="${logicalPropertyName.contains('bet')}"> <i class="glyphicon glyphicon-fire"></i></g:if>
					<g:if test="${logicalPropertyName.contains('stats')}"> <i class="glyphicon glyphicon-stats"></i></g:if>
				</g:link>
			</li>
		</g:each>
		
	</ul>
</div>

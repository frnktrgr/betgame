
<%@ page import="de.betgame.sportdb.Teams" %>
<!DOCTYPE html>
<html>

<head>
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'teams.label', default: 'Teams')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
	
	<g:set var="layout_nosecondarymenu"	value="${true}" scope="request"/>
</head>

<body>

<section id="list-teams" class="first">

	<table class="table table-bordered margin-top-medium">
		<thead>
			<tr>
				<th>${message(code: 'teams.code.label', default: 'Code')}</th>
				<th>${message(code: 'teams.title.label', default: 'Title')}</th>
				<th>${message(code: 'groups.label', default: 'Group')}</th>
			</tr>
		</thead>
		<tbody>
		<g:each in="${teamsInstanceList}" status="i" var="teamsInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
				<td><bg:flag country="${teamsInstance.country}" /> <g:link action="show" id="${teamsInstance.id}">${fieldValue(bean: teamsInstance, field: "code")}</g:link></td>
				<td>${fieldValue(bean: teamsInstance, field: "title")}</td>
				<td><g:link controller="games" action="list" params="[groupId:groupMap[teamsInstance.code]?.id]" >${groupMap[teamsInstance.code]?.title[-1]}</g:link></td>
			</tr>
		</g:each>
		</tbody>
	</table>
</section>

</body>

</html>

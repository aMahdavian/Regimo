<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<div id="page-content">
<div id="browsePage">
	<h2><spring:message code="title.browse"/><spring:message code="authority"/></h2>

	<a href='<s:url value="/authority/new"/>'><spring:message code="button.new"/></a>

	<link rel="stylesheet" href="<c:url value="/resources/datatables/css/demo_page.css" />" type="text/css" />
	<link rel="stylesheet" href="<c:url value="/resources/datatables/css/demo_table.css" />" type="text/css" />
	<script type="text/javascript" language="javascript" src="<c:url value="/resources/datatables/jquery.dataTables.min.js" />"></script>
	<script type="text/javascript" language="javascript" src="<c:url value="/resources/datatables/dataTables.utils.js" />"></script>
	<script type="text/javascript" charset="utf-8">
		$(document).ready(initDataTable);
		function initDataTable(){
			var oTable = $('#example').dataTable( {
				"sPaginationType": "full_numbers",
				"iDisplayLength": 25,
				"bProcessing": true,
				"bServerSide": true,
				"bStateSave": true,
				"sAjaxSource": "browse",
				"fnServerData": _getServerData,
				"aoColumns": [
				              { "mDataProp": "name" },
				              { "mDataProp": "category" },
				              { "mDataProp": "model" },
				              { "mDataProp": "id",
				            	"bUseRendered": false,
				            	"bSortable": false,
				            	"fnRender": standardUpdateAction }
				          ]
			} );
		}
	</script>

	<div class="ex_highlight_row">
		<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
			<thead>
				<tr>
					<th width="40%"><spring:message code="authority.name"/></th>
					<th width="40%"><spring:message code="authority.category"/></th>
					<th width="15%"><spring:message code="authority.model"/></th>
					<th width="5%"><spring:message code="title.action"/></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="5" class="dataTables_empty">Loading data ...</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</div>
<div class="push"></div>
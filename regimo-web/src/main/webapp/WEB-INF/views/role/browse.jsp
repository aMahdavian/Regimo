<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>

<div id="page-content">
<div id="browsePage">
	<h2><s:message code="label.browse"/> <s:message code="role"/></h2>

	<a href='../${modelName}/new'><s:message code="button.new"/></a>

	<script type="text/javascript" charset="utf-8">
		$(document).ready(initDataTable);
		function initDataTable(){
			var oTable = $('#example').dataTable( {
				"sPaginationType": "full_numbers",
				"iDisplayLength": 25,
				"bProcessing": true,
				"bServerSide": true,
				"bStateSave": true,
				"sAjaxSource": "",
				"fnServerData": _getServerData,
				"aoColumns": [
				              { "mDataProp": "name" },
				              { "mDataProp": "description" },
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
					<th width="45%"><s:message code="role.name"/></th>
					<th width="50%"><s:message code="role.description"/></th>
					<th width="5%"><s:message code="label.action"/></th>
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
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="base" value="${pageContext.request.contextPath}" />
<!-- Modal -->
<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">
				<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
			</button>
			<h4 class="modal-title" id="myModalLabel">RenameImage</h4>
		</div>
		<div class="modal-body">
			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label for="inputPassword" class="col-sm-2 control-label">ImageName</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="tag"
							placeholder="Lower case letters: numeric version">
					</div>
				</div>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary" id="addcbtn">Ascertain </button>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		$('#addcbtn').click(function() {
			$.post("${base}/images/tag", {
				id : '${id}',
				tag : $("#tag").val()
			}, function(data) {
				if (data == 'ok')
					location.href = '${base}/images';
			});
		});
	});
</script>

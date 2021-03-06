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
			<h4 class="modal-title" id="myModalLabel">${title }</h4>
		</div>
		<div class="modal-body">
			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label for="inputPassword" class="col-sm-2 control-label">Container Name</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="hostname"
							placeholder="Lowercase letters ">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Inner Port</label>
					<div class="col-sm-10">
						<p class="form-control-static">
							<c:catch var="catchException">
  								<c:if test="${not empty info.config.exposedPorts}">
									<c:forEach var='port' items='${info.config.exposedPorts}'>${port} &nbsp;</c:forEach>
							</c:if>
  						</c:catch>
						</p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Port Mapping</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="ports"
							placeholder="8080:8080 container port:host port">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Run command</label>
					<div class="col-sm-10">
						<input type="text" id="cmd" class="form-control" placeholder="Start command" />
					</div>
				</div>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary" id="addcbtn">Create Container</button>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		$('#addcbtn').click(function() {
			$.post("${base}/containers/create", {
				name : $('#hostname').val(),
				image : '${title }',
				ports : $('#ports').val(),
				cmd: $("#cmd").val()
			}, function(data) {
				if (data == 'ok')
					location.href = '${base}/${rurl}';
			});
		});
	});
</script>

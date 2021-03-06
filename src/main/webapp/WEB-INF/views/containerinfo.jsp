<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Modal -->
<div class="modal-dialog" max-width="300px">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">
				<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
			</button>
			<h4 class="modal-title" id="myModalLabel">${title }</h4>
		</div>
		<div class="modal-body">
			<dl class="dl-horizontal">
				<dt>File Driver</dt>
				<dd>
					<input class="form-control" value="${info.driver }" />
				</dd>
				<dt>Server Path</dt>
				<dd>
					<input class="form-control" value="${info.hostsPath }" />
				</dd>
				<dt>Image</dt>
				<dd>
					<input class="form-control" value="${info.config.image}" />
				</dd>
				<dt>Gate</dt>
				<dd>
					<input class="form-control" value="${info.networkSettings.gateway}" />
				</dd>
				<dt>IP</dt>
				<dd>
					<input class="form-control"
						value="${info.networkSettings.ipAddress }" />
				</dd>
				<dt>Network card</dt>
				<dd>
					<input class="form-control" value="${info.networkSettings.bridge }" />
				</dd>
				<dt>ID</dt>
				<dd>
					<input class="form-control" value="${info.id }" />
				</dd>
				<dt>PATH</dt>
				<dd>
					<input class="form-control" value="${info.path }" />
				</dd>
				<dt>Volumes</dt>
				<dd>
					<c:choose>
						<c:when test="${info.volumes != null}">
							<input class="form-control"
								value="<c:forEach var='vol' items='${info.volumes}'>${vol.path} &nbsp;</c:forEach>" />
						</c:when>
						<c:otherwise>
							<input class="form-control" value="" />
						</c:otherwise>
					</c:choose>
				</dd>
				<dt>Port mapping(L:H)</dt>
				<dd>
					<input class="form-control"
						value="<c:forEach var='portMap' items='${info.hostConfig.portBindings.bindings }'>${portMap.key.port }:${portMap.value.hostPort} &nbsp;</c:forEach>" />
				</dd>
				<dt>User</dt>
				<dd>
					<input class="form-control" value="${info.config.user }" />
				</dd>
			</dl>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
		</div>
	</div>
</div>

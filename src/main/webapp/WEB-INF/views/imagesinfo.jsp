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
				<dt>System structure</dt>
				<dd><input class="form-control" value="${info.arch }" /></dd>
				<dt>Author</dt>
				<dd><input class="form-control" value="${info.author }" /></dd>
				<dt>Memory settings</dt>
				<dd><input class="form-control" value="${info.config.memoryLimit}" /></dd>
				<dt>User</dt>
				<dd><input class="form-control" value="${info.config.user}" /></dd>
				<dt>Container</dt>
				<dd>
					<input class="form-control" value="${info.container }" />
				</dd>
				<dt>Remarks</dt>
				<dd><input class="form-control" value="${info.comment }" /></dd>
				<dt>ID</dt>
				<dd>
					<input class="form-control" value="${info.id }" />
				</dd>
				<dt>Operation System</dt>
				<dd><input class="form-control" value="${info.os }" /></dd>
				<dt>Father Image</dt>
				<dd>
					<input class="form-control" value="${info.parent }" />
				</dd>
				<dt>Size</dt>
				<dd><input class="form-control" value="${info.size }" /></dd>
				<dt>CMD</dt>
				<dd>
					<input class="form-control" value="<c:forEach var='cmd' items='${info.config.cmd}'>${cmd} &nbsp;</c:forEach>"/>
				</dd>
				<dt>EntryPoint</dt>
				<dd>
					<input class="form-control" value="<c:forEach var='enp' items='${info.config.entrypoint }'>${enp }&nbsp;</c:forEach>"/>
				</dd>
				<dt>Working directory </dt>
				<dd><input class="form-control" value="${info.config.workingDir }" /></dd>
				<dt>Opened port</dt>
				<dd>
					<c:if test="null!=info.config.exposedPorts">
						<input class="form-control"
							value="<c:forEach var='port' items='${info.config.exposedPorts}'>${port} &nbsp;</c:forEach>"/>
					</c:if>
				</dd>
			</dl>
		</div>
		
		<div class="modal-footer">
			<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
		</div>
	</div>
</div>

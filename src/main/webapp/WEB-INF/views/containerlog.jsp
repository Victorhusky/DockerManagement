<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- Modal -->
<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">
				<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
			</button>
			<h4 class="modal-title" id="myModalLabel">Container Log</h4>
		</div>
		<div class="modal-body">
			<div class="form-group">
				<label>Container Log</label>
				<% if(request.getSession().getAttribute("role").equals("admin")) {%>
				<textarea class="form-control" rows="8">${log }</textarea>
				<% } %>
				<% if(request.getSession().getAttribute("role").equals("user")) {%>
				<textarea class="form-control" rows="8"> You are normal user, can not view the Container running logs!</textarea>
				<% } %>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
		</div>
	</div>
</div>

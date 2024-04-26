<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>

<style>

</style>

<script>
$(document).ready(function() {
	  /* Get iframe src attribute value i.e. YouTube video url
	  and store it in a variable */
	  var url = $("#video").attr('src');

	  /* Assign empty url value to the iframe src attribute when
	  modal hide, which stop the video playing */
	  $("#myModal").on('hide.bs.modal', function() {
	    $("#video").attr('src', '');
	  });

	  /* Assign the initially stored url back to the iframe src
	  attribute when modal is displayed again */
	  $("#myModal").on('show.bs.modal', function() {
	    $("#video").attr('src', url);
	  });
	});
</script>


<!-- Button HTML (to Trigger Modal) -->
<a href="#myModal" data-toggle="modal">Launch Demo Modal</a>
<!-- Modal HTML -->
<div id="myModal" class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">YouTube Video</h4>
      </div>
      <div class="modal-body">
        <iframe id="video" width="560" height="315" src="/resources/영상/2024년 4월 이달의 독립운동가.mp4" frameborder="0" allowfullscreen></iframe>
      </div>
    </div>
  </div>
</div>

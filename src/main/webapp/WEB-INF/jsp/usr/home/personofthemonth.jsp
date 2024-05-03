<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
.popup {
  position: absolute;
  min-height: auto;
  width: auto;
  z-index: 1002;
}

.test {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  margin: auto;
  width: 60%;
  height: 60%;
}

.bg {
  background-color: black;
  opacity: 0.65;
  position: absolute;
  z-index: 1000;
  top: 0px;
  left: 0px;
  width: 100%;
  min-height: 100%;
  overflow: hidden;
}

#showPopup {
  position: absolute;
  top: 50%;
  left: 50%;
  padding: 10px 30px;

  margin-top: -40px;
  margin-left: -77px;
  
  font-size: 40px;
  text-decoration: none;
  color: #333;
  border: 1px solid #333;
}
</style>

<script>
$(function() {
	  $("#showPopup").click(function(e) {
	    e.stopPropagation();
	    $(".bg").toggle();
	    $(".popup").toggle();
	  });
	  $("body").click(function() {
	    $(".bg").toggle();
	    $(".popup").hide();
	    var video = $("#player").attr("src");
	    $("#player").attr("src", "");
	    $("#player").attr("src", video);
	  });
	});
</script>

<a href="#" id="showPopup">Click</a>
<div class="bg" style="display: none"></div>

<div class="popup" style="display: none; height: 100%; width: 100%;">
	<iframe id="player" class="test" src="/resource/2024년 4월.mp4" frameborder="0" allowfullscreen></iframe>
</div>
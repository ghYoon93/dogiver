<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
textarea:focus {
  outline: none;
}
</style>
<div>댓글달기</div>
<form name="boardReplyForm" method="post">
	<input type="hidden" name="brd_seq" value="${brd_seq}"> 
	<input type="hidden" name="pg" value="${pg }">

	<div id="replyFormDiv" style="width: 1100px; min-height: 140px; border: 1px solid black; box-sizing: border-box; background-color: #f1eaea; padding-left: 200px; padding-top: 33px;">
		<table>
			<tr>
				<td><textarea id="brd_reContent" name="brd_reContent"  style="width:750px; height: 50px; resize: none;"></textarea>
					<div id="contentDiv"></div></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="button" value="댓글달기" id="boardFormBtn">
			</tr>
		</table>
	</div>
</form>

<script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../js/reply.js"></script>

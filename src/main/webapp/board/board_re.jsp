<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div>
	<div>
		<strong>Comments</strong>
		<div id="listReply" style="border: 1px solid red; width: 1100px;  min-height: 120px; box-sizing: border-box; padding: 10px;">
			<div id="re-info">    
				<strong style="margin-left: 13px;">작성자 :</strong>&ensp;
				<span id="writerSpan">aa</span> &ensp;	
				<strong>작성일 :</strong>&ensp;
				<span id="timeSpan">ss</span>
				<strong><a href="#" style="margin-left: 850px;">수정</a></strong>&ensp;
				<strong><a href="#">삭제</a></strong>	
			</div>
			<div id="re-origin-content" style="border: 1px solid black; width: 1010px; height: 30px; margin-left: 11px; margin-top: 15px;">
			    <span id="contentSpan">여기는 내용이 들어올곳 </span>
			    <br><br>
			    -------------------------------------------------------------------------------------
			    -------------------------------------------------------------------------------------
			    -------------------------------------------------------------------
			    
			</div> 
		</div>
	</div>
	<div style="width: 1100px; box-sizing: border-box; border:1px solid black;  padding-left: 130px;">
		<textarea style="width: 850px; height: 100px;" id="re_content"
			name="re_content" placeholder="댓글을 입력하세요">
								</textarea>
		<div>
			<input type="button" value="등록" onclick='re_write()'>
		</div>
	</div>
</div>
<script type="text/javascript">
	function re_write() {
		var re_content = $('#re_content').val();
		$.ajax({
			type : 'POST',
			url : '/dogiver/board/brd_re_write',
			data : {
				're_content' : re_content
			},
			success : function(data) {
				alert("댓글이 작성되었습니다.");
				// listReply(); //댓글 목록 출력
			}
		});
	}
	
/* 	function listReply(){
		$.ajax({
			type : 'post',
			url : '/dogiver/board/getReplyView',
			data : {'brd_seq': brd_seq, 'pg': pg},
			dataType : 'json',
			success : function(data) {
				alert("aa");
				//alert(data.memEmail);
				//alert(JSON.stringify(data));
				$('#writerSpan').text(data.boardReDTO.re_writer);
				$('#timeSpan').text(data.boardReDTO.re_logtime);
				$('#contentSpan').text(data.boardReDTO.re_content);
				

			
				if (data.memEmail != null) {
					$('#board_reply').show();
				} else {
					$('#board_reply').hide();
				}
			}
		});
	}); */
</script>

package com.spare.dogiver.board.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class BoardPaging {
	private int currentPage;// 현재페이지
	private int pageBlock;// [이전][1][2][3][다음]
	private int pageSize;// 1페이지당 5개씩
	private int totalA;// 총글수
	private StringBuffer pagingHTML;

	public void makePagingHTML() {
		pagingHTML = new StringBuffer();

		int totalP = (totalA + pageSize - 1) / pageSize;// 총 페이지수
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > totalP)
			endPage = totalP;

		if (startPage > pageBlock)
			pagingHTML.append("<a id='paging' href='boardList?pg=" + (startPage - 1) + "'>이전</a> &emsp;&emsp; ");

		for (int i = startPage; i <= endPage; i++) {
			if (i == currentPage)
				pagingHTML.append("<a id='currentPaging' href='boardList?pg=" + i + "'>" + i + "</a> &emsp;&emsp;");
			else
				pagingHTML.append("<a id='paging' href='boardList?pg=" + i + "'>" + i + "</a> &emsp;&emsp;");
		}

		if (endPage < totalP)
			pagingHTML.append("<a id='paging' href='boardList?pg=" + (endPage + 1) + "'>다음</a>");
	}

	public void makeSearchPagingHTML() {

		pagingHTML = new StringBuffer();

		int totalP = (totalA + pageSize - 1) / pageSize;// 총 페이지수
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage > totalP)
			endPage = totalP;

		if (startPage > pageBlock)
			pagingHTML.append("<span id='paging' onclick='boardSearch(" + (startPage - 1) + ")'>이전 &emsp;&emsp;</span> ");

		for (int i = startPage; i <= endPage; i++) {
			if (i == currentPage)
				pagingHTML.append("<span style=\"font-size:20px;\" id='currentPaging' onclick='boardSearch(" + i + ")'>" + i +  "</span> &emsp;&emsp;" );
			else
				pagingHTML.append("<span style=\"font-size:20px;\" id='paging' onclick='boardSearch(" + i + ")'>" + i + "</span> &emsp;&emsp;");
		}

		if (endPage < totalP)
			pagingHTML.append("<span style=\"font-size:20px;\" id='paging' onclick='boardSearch(" + (endPage + 1) + ")'>다음</span>");
	}

}

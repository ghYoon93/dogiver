package com.spare.dogiver.member.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class MemberPaging {
	private int currentPage;//현재페이지
	private int pageBlock;
	private int pageSize;//1페이지당 5개씩
	private int totalA;//총글수
	private StringBuffer pagingHTML;
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		int totalP = (totalA+pageSize-1)/pageSize;
		
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage>totalP) endPage = totalP;
		
		if(startPage>pageBlock) pagingHTML.append("[<a href='../admin/admin?pg="+(startPage-1)+"'>이전</a>]");
		
		for(int i=startPage; i<=endPage; i++) {
			if(i ==currentPage) pagingHTML.append("[<a id='currentPaging' href='../admin/admin?pg="+i+"'>"+i+"</a>]");
				
			else pagingHTML.append("[<a id='paging' href='../admin/admin?pg="+i+"'>"+i+"</a>]");
		}
		
		if(endPage<totalP) pagingHTML.append("[<a href='../admin/admin?pg="+(endPage+1)+"'>다음</a>]");
		
	}
}

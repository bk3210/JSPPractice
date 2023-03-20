package com.kosa.mvc1.common;

import javax.servlet.http.HttpServletRequest;

public class Pager {
	public static String makeTag(HttpServletRequest request, int totalCnt, int pgSize) {
		// pgSize = 한 페이지에 출력되는 게시글 갯수(페이지별로 몇 개의 글을 띄울지 게시판마다 다르기 때문에 매개변수로)
		// totalCnt = 데이터 전체 갯수
		int pgGroupSize = 5; // 한 그룹당 5개씩 페이지 수를 보겠다
		// int pgSize = 10; 한 페이지당 출력되는 게시글이 10개
		int cPage = 0; // 현재 페이지
		String pg = request.getParameter("pg");
		if (pg == null || pg.equals("")) {
			pg = "0";
		} else {
			cPage = Integer.parseInt(pg);
		}
		int pageTotal = (int) Math.ceil((float) totalCnt / pgSize) - 1; // total->float형으로 전환하면 pgSize도 float로 전환해서 연산을
																		// 처리
		// (int)(ceil(327.0/10.0)) => (int)ceil(32.7) => (int)33.0 => 33
		// -1을 해주는 이유 : 첫 페이지가 0번이므로 32까지 출력되게 하려면 -1을 해줘야 한다
		System.out.println(pageTotal);

		String path = "";
		String firstLabel = "first";
		String prevLabel = "prev";
		String nextLabel = "next";
		String lastLabel = "last";
		int start, end;

		// 0~4 : 0 1 2 3 4
		// 5~9 : 5 6 7 8 9
		// 10~14 : 10 11 12 13 14
		// 15~19 : 15 16 17 18 19
		// 로 페이지 그룹 나누기
		start = cPage / pgGroupSize * pgGroupSize;
		end = start + pgGroupSize;
		if (end > pageTotal) {
			end = pageTotal + 1; // +1해줘야 lastPage까지 출력된다
		}
		System.out.println(String.format("start %d end %d cPage %d", start, end, cPage));

		StringBuffer buffer = new StringBuffer();
		buffer.append("<ul class='pagination justify-content-center'>");
		buffer.append(makeLink(0, firstLabel));
		if (cPage > 0) { 		// 앞으로 넘어갔을 때 넘어갈 수 있는 이전 페이지 그룹이 존재하는지
			buffer.append(makeLink(cPage - 1, prevLabel));
		}
		for (int i = start; i < end; i++) {
			if (i == cPage) {		 // 여기서 선택된 페이지는 css에 active링크로 만들어 줘야 한다
				buffer.append(makeActiveLink(i, (i + 1) + ""));
			} else {
				buffer.append(makeLink(i, (i + 1) + ""));
			}
		}
		if (cPage < pageTotal) {
			buffer.append(makeLink(cPage + 1, nextLabel));
		}
		buffer.append(makeLink(pageTotal, lastLabel));
		buffer.append("</ul>");
		return buffer.toString();

		// buffer에 값을 채워 전달
	}

	static String makeLink(int page, String label) {
		String s = "<li class='page-item'><a class='page-link' href='#none' onclick='goPage(" + page + ")'>" + label
				+ "</a></li>";
		return s;
	}

	static String makeActiveLink(int page, String label) {
		String s = "<li class='page-item active'><a class='page-link' href='#none' onclick='goPage(" + page + ")'>"
				+ label + "</a></li>";
		return s;
	}
}
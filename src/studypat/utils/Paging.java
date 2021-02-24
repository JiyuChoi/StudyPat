package studypat.utils;

public class Paging {
	private int nowPage; // 현재 페이지 (url로 받아옴)
	private int startPage; // 현재 페이지에서 갈 수 있는 페이지의 첫번째 숫자 
	private int endPage;  // 현재 페이지에서 갈 수 있는 페이지의 마지막 숫자
	private int total; // 전체 글 수 
	private int lastPage; // 제일 마지막 페이지. total / cntPage
	private int start; // db에서 사용할 Start 
	private int end; // db에서 사용할 end 
	private int cntPage = 5; // 한페이지에서 이동할 수 있는 page수
	private int cntPerPage = 5 ; //한페이지당 보여지는 게시물 수 

	public Paging() {
	}

	public Paging(int total, int nowPage) {
		setNowPage(nowPage);
		setTotal(total);
		
		calcLastPage(getTotal(), getCntPerPage()); // 제일 마지막 페이지 계산
		calcStartEndPage(getNowPage(), cntPage); // 시작, 끝 페이지 계산
		calcStartEnd(getNowPage(), getCntPerPage()); //db
	}

	// 제일 마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double) total / (double) cntPerPage));
	}

	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int) Math.ceil((double) nowPage / (double) cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}

	// DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int setCntPage() {
		return cntPage;
	}

	public void getCntPage(int cntPage) {
		this.cntPage = cntPage;
	}

	@Override
	public String toString() {
		return "PagingVO [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total
				+ ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", start=" + start + ", end=" + end
				+ ", cntPage=" + cntPage + "]";
	}

}

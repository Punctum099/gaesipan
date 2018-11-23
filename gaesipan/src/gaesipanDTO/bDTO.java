package gaesipanDTO;

public class bDTO {

	private int seq;
	private String title;
	private String contents;
	private String author;
	private int hit;
	private String time;
	private String UPtime;
	private String see;
	private String listType;
	private String MTtime;
	
	public bDTO(int seq, String title, String contents, String author, int hit, String time, String UPtime,
			String see, String listType, String MTtime) {
		this.seq = seq;
		this.title = title;
		this.contents = contents;
		this.author = author;
		this.hit = hit;
		this.time = time;
		this.UPtime = UPtime;
		this.see = see;
		this.listType = listType;
		this.MTtime = MTtime;
	}

	public int getseq() {
		return seq;
	}

	public void setseq(int seq) {
		this.seq = seq;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getListType() {
		return listType;
	}

	public void setListType(String listType) {
		this.listType = listType;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getUPtime() {
		return UPtime;
	}

	public void setUPtime(String UPtime) {
		this.UPtime = UPtime;
	}

	public String getSee() {
		return see;
	}

	public void setSee(String see) {
		this.see = see;
	}
	
	public String getMTtime() {
		return MTtime;
	}

	public void setMTtime(String mTtime) {
		MTtime = mTtime;
	}
}

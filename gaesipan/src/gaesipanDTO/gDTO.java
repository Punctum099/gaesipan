package gaesipanDTO;

public class gDTO {

	private int seq;
	private String title;
	private String contents;
	private String author;
	private int hit;
	private String time;
	private String UPtime;
	private String see;
	
	public gDTO(int seq, String title, String contents, String author, int hit, String time, String UPtime,
			String see) {
		this.seq = seq;
		this.title = title;
		this.contents = contents;
		this.author = author;
		this.hit = hit;
		this.time = time;
		this.UPtime = UPtime;
		this.see = see;
	}

	public int getseq() {
		return seq;
	}

	public void setseq(int seq) {
		this.seq = seq;
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
}

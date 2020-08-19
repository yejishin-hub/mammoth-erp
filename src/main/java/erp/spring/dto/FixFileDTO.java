package erp.spring.dto;

public class FixFileDTO {
	private int seq;
	private int parent_seq;
	private String oriname;
	private String sysname;
	public FixFileDTO() {}
	public FixFileDTO(int seq, int parent_seq, String oriname, String sysname) {
		this.seq = seq;
		this.parent_seq = parent_seq;
		this.oriname = oriname;
		this.sysname = sysname;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getParent_seq() {
		return parent_seq;
	}
	public void setParent_seq(int parent_seq) {
		this.parent_seq = parent_seq;
	}
	public String getOriname() {
		return oriname;
	}
	public void setOriname(String oriname) {
		this.oriname = oriname;
	}
	public String getSysname() {
		return sysname;
	}
	public void setSysname(String sysname) {
		this.sysname = sysname;
	}
	
}

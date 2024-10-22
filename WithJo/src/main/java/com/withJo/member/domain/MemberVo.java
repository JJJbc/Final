package com.withJo.member.domain;

import java.util.Date;

public class MemberVo {
	
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberBirthDate;
	private int memberGender;
	private String memberZipCode;
	private String memberAddress;
	private String memberAddressInfo;	
	private Date memberCredate;
	private Date memberUpdate;
	private int memberEMoney;
	private int authority;
	
	public MemberVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVo(int memberNo, String memberId, String memberPw, String memberName, String memberBirthDate,
			String memberZipCode, String memberAddress, String memberAddressInfo, int memberGender, Date memberCredate,
			Date memberUpdate, int memberEMoney, int authority) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberBirthDate = memberBirthDate;
		this.memberGender = memberGender;
		this.memberZipCode = memberZipCode;
		this.memberAddress = memberAddress;
		this.memberAddressInfo = memberAddressInfo;		
		this.memberCredate = memberCredate;
		this.memberUpdate = memberUpdate;
		this.memberEMoney = memberEMoney;
		this.authority = authority;
	}	
	
	// 로그인 체킹
	public MemberVo(String memberId, String memberPw) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberBirthDate() {
		return memberBirthDate;
	}

	public void setMemberBirthDate(String memberBirthDate) {
		this.memberBirthDate = memberBirthDate;
	}

	public String getmemberZipCode() {
		return memberZipCode;
	}

	public void setmemberZipCode(String memberZipCode) {
		this.memberZipCode = memberZipCode;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberAddressInfo() {
		return memberAddressInfo;
	}

	public void setMemberAddressInfo(String memberAddressInfo) {
		this.memberAddressInfo = memberAddressInfo;
	}

	public int getMemberGender() {
		return memberGender;
	}

	public void setMemberGender(int memberGender) {
		this.memberGender = memberGender;
	}

	public Date getMemberCredate() {
		return memberCredate;
	}

	public void setMemberCredate(Date memberCredate) {
		this.memberCredate = memberCredate;
	}

	public Date getMemberUpdate() {
		return memberUpdate;
	}

	public void setMemberUpdate(Date memberUpdate) {
		this.memberUpdate = memberUpdate;
	}

	public int getMemberEMoney() {
		return memberEMoney;
	}

	public void setMemberEMoney(int memberEMoney) {
		this.memberEMoney = memberEMoney;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}

	@Override
	public String toString() {
		return "MemberVo [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPw=" + memberPw + ", memberName="
				+ memberName + ", memberBirthDate=" + memberBirthDate + ", memberZipCode=" + memberZipCode + ", memberAddress="
				+ memberAddress + ", memberAddressInfo=" + memberAddressInfo + ", memberGender=" + memberGender
				+ ", memberCredate=" + memberCredate + ", memberUpdate=" + memberUpdate + ", memberEMoney="
				+ memberEMoney + ", authority=" + authority + "]";
	}
	
	

}

package com.withJo.member.service;

import java.util.List;

import com.withJo.member.domain.MemberVo;

public interface MemberService {
	
	List<MemberVo> memberSelectList(int start, int end, String searchField, String searchKeyword);
	public int memberTotalCount(String searchField, String searchKeyword); 
	public MemberVo memberExist(MemberVo memberVo);
	public int memberInsertOne(MemberVo memberVo);
	public MemberVo memberSelectOne(int no);
	public int memberUpdateOne(MemberVo memberVo);

}

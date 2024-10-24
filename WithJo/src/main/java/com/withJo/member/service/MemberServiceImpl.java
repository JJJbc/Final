package com.withJo.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.withJo.member.dao.MemberDao;
import com.withJo.member.domain.MemberVo;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	public MemberDao memberDao;

	@Override
	public List<MemberVo> memberSelectList(int start, int end, String searchField, String searchKeyword) {
		// TODO Auto-generated method stub
		return memberDao.memberSelectList(start, end, searchField, searchKeyword);
	}

	@Override
	public int memberTotalCount(String searchField, String searchKeyword) {
		// TODO Auto-generated method stub
		return memberDao.memberTotalCount(searchField, searchKeyword);
	}

	@Override
	public MemberVo memberExist(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return memberDao.memberExist(memberVo);
	}

	@Override
	public int memberInsertOne(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return memberDao.memberInsertOne(memberVo);
	}

	@Override
	public MemberVo memberSelectOne(int no) {
		// TODO Auto-generated method stub
		return memberDao.memberSelectOne(no);
	}

	@Override
	public int memberUpdateOne(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return memberDao.memberUpdateOne(memberVo);
	}

	@Override
	public boolean isDuplicateId(String memberId) {
		// TODO Auto-generated method stub
		return memberDao.countByMemberId(memberId) > 0;
	}

	@Override
	public int memberDeleteOne(int memberNo) {
		// TODO Auto-generated method stub
		
        return memberDao.memberDeleteOne(memberNo);
    }
	

}

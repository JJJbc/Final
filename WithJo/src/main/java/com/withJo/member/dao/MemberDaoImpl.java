package com.withJo.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.withJo.member.domain.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	String namespace = "com.withJo.member.";

	@Override
	public List<MemberVo> memberSelectList(int start, int end, String searchField, String searchKeyword) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("searchField", searchField);
		map.put("searchKeyword", searchKeyword);
		return sqlSession.selectList(namespace + "memberSelectList", map) ;
	}

	@Override
	public int memberTotalCount(String searchField, String searchKeyword) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("searchField", searchField);
		map.put("searchKeyword", searchKeyword);
		return sqlSession.selectOne(namespace + "memberTotalCount", map);
	}

	@Override
	public MemberVo memberExist(MemberVo memberVo) {
		// TODO Auto-generated method stub		
		
		return sqlSession.selectOne(namespace + "memberExist", memberVo);
	}

	@Override
	public int memberInsertOne(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + "memberInsertOne", memberVo);
	}

	@Override
	public MemberVo memberSelectOne(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "memberSelectOne", no);
	}

	@Override
	public int memberUpdateOne(MemberVo memberVo) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "memberUpdateOne", memberVo);
	}

	@Override
	public int countByMemberId(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "countByMemberId", memberId);
	}

}

package com.mycompany.app.infra.member;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDao {
	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.mycompany.app.infra.member.MemberMapper";
	
	public int selectOneCount(MemberVo vo) {return sqlSession.selectOne(namespace + ".selectOneCount", vo); }
	public List<Member> selectList(MemberVo vo) { return sqlSession.selectList(namespace + ".selectList", vo); }
	
	public Member selectOne(MemberVo vo) {
		Member member = sqlSession.selectOne(namespace + ".selectOne", vo);
		
		return member;
	}
	
	public Member selectOneLogin(MemberVo vo) {
		Member login = sqlSession.selectOne(namespace + ".selectOneLogin", vo);
		
		return login;
	}
	
	public int insert(Member dto) { return sqlSession.insert(namespace + ".insert", dto); }
	
}

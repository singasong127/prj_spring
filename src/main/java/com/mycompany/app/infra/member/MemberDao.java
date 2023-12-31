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
	
	public Member selectOneProfile(MemberVo vo) {
		Member member = sqlSession.selectOne(namespace + ".selectOneProfile", vo);
		
		return member;
	}
	
	public int updtProfile(Member dto) {
		return sqlSession.update(namespace + ".updtProfile", dto); 
	}
	
	public Member selectOneLogin(MemberVo vo) {
		Member login = sqlSession.selectOne(namespace + ".selectOneLogin", vo);
		
		return login;
	}
	
	public Member loginXdm(MemberVo vo) { Member loginXdm = sqlSession.selectOne(namespace + ".loginXdm", vo); 
		return loginXdm; 
	}
	
	public int insert(Member dto) { return sqlSession.insert(namespace + ".insert", dto); }
	
	public int idCheck(MemberVo vo) {
		
		return sqlSession.selectOne(namespace + ".idCheck", vo);
	}
	
	public List<Member> selectListUpload(Member dto) { return sqlSession.selectList(namespace + ".selectListUpload", dto); }
	
	public int insertUploaded(Member dto) { return sqlSession.insert(namespace + ".insertUploaded", dto); }
	
	public int deleteUpload(Member dto) { return sqlSession.delete(namespace + ".deleteUpload", dto); }
	
}

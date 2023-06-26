package com.mycompany.app.codegroup;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CodeGroupDao {
	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.mycompany.app.codegroup.CodeGroupMapper";
	
	public List<CodeGroup> selectList(CodeGroupVo vo){ return sqlSession.selectList(namespace + ".selectList", vo); }
	
	public CodeGroup selectOne(CodeGroupVo vo) {
		CodeGroup codeGroup = sqlSession.selectOne(namespace + ".selectOne", vo);
		
		return codeGroup;
	}
	
//	public List<CodeGroup> selectList(){ 
//		return sqlSession.selectList(namespace + ".selectList", ""); 
//	}
}

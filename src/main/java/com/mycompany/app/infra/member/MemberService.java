package com.mycompany.app.infra.member;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;


public interface MemberService {
	
	public int selectOneCount(MemberVo vo);
	public List<Member> selectList(MemberVo vo);
	
	public Member selectOne(MemberVo vo);
	
	public Member selectOneProfile(String id);
	
	public Member selectOneLogin(MemberVo vo);
	
	public Member loginXdm(MemberVo vo);
	
	public int insert(Member dto);
	
	public int idCheck(MemberVo vo);
	
	List<Member> selectListUpload(Member dto);
	
	void uploadFiles(MultipartFile[] multipartFiles, Member dto, String tableName, int type, int maxNumber) throws Exception;

}

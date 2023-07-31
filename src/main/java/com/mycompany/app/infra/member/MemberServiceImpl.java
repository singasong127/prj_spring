package com.mycompany.app.infra.member;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao dao;
	
	public static final String UPLOAD_PATH_PREFIX_EXTERNAL = "D://factory/ws_sts4_4181/prj_spring/src/main/webapp";
	public static final String UPLOAD_PATH_PREFIX = "D://factory/ws_sts4_4181/prj_spring/src/main/webapp/resources/uploaded";
	public static final String UPLOAD_PATH_PREFIX_FOR_VIEW = "/resources/uploaded";
	
	@Override
	public int selectOneCount(MemberVo vo) {
		
		return dao.selectOneCount(vo);
	}
	
	@Override
	public List<Member> selectList(MemberVo vo) {
		
		List<Member> aaa = dao.selectList(vo);
		
		return aaa;
	}

	@Override
	public Member selectOne(MemberVo vo) {
		
		return dao.selectOne(vo);
	}

	@Override
	public int insert(Member dto) {
		
		// uploadFiles(dto.getUploadImgProfile(), dto, "infrMemberUploaded", dto.getUploadImgProfileType(), dto.getUploadImgProfileMaxNumber());
    	// uploadFiles(dto.getUploadImg(), dto, "userUploaded", dto.getUploadImgType(), dto.getUploadImgMaxNumber());
    	// uploadFiles(dto.getUploadFile(), dto, "infrMemberUploaded", dto.getUploadFileType(), dto.getUploadFileMaxNumber());
		
		return dao.insert(dto);
	}

	@Override
	public Member selectOneLogin(MemberVo vo) {
		
		return dao.selectOneLogin(vo);
	}

	@Override
	public int idCheck(MemberVo vo) {
		
		return dao.idCheck(vo);
	}

	@Override
	public Member loginXdm(MemberVo vo) {
		
		return dao.loginXdm(vo);
	}
	
	
	  public void uploadFiles(MultipartFile[] multipartFiles, Member dto, String tableName, int type, int maxNumber) throws Exception {
	  
		  for(int i=0; i<multipartFiles.length; i++) {
		  
			  if(!multipartFiles[i].isEmpty()) {
			  
			  String className = dto.getClass().getSimpleName().toString().toLowerCase();
			  String fileName = multipartFiles[i].getOriginalFilename(); 
			  String ext = fileName.substring(fileName.lastIndexOf(".") + 1); 
			  String uuid = UUID.randomUUID().toString(); 
			  String uuidFileName = uuid + "." + ext; 
			  String pathModule = className; 
			  //String pathDate = nowString.substring(0,4) + "/" + nowString.substring(5,7) + "/" + nowString.substring(8,10); 
			  //String path = Constants.UPLOAD_PATH_PREFIX + "/" + pathModule + "/" + pathDate + "/";
			  //String pathForView = Constants.UPLOAD_PATH_PREFIX_FOR_VIEW + "/" + pathModule + "/" + pathDate + "/";
			  
			  //File uploadPath = new File(path);
		  
			  //if (!uploadPath.exists()) {
				//  uploadPath.mkdir(); 
			  //} else { 
				  // by pass 
			  }
		  }
	  
		  //multipartFiles[i].transferTo(new File(path + uuidFileName));
		  
		  //dto.setPath(pathForView); dto.setOriginalName(fileName);
		  //dto.setUuidName(uuidFileName); dto.setExt(ext);
		  //dto.setSize(multipartFiles[i].getSize());
		  
		  dto.setTableName(tableName); dto.setType(type); // dto.setDefaultNy();
		  //dto.setSort(maxNumber + i); dto.setUserSeq(dto.getUlSeq());
		  
		  dao.insertUploaded(dto);
	  
  		} 
	  
}
	 

		


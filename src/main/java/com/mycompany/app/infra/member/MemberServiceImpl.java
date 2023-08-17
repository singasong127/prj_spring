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
		
		return dao.insert(dto);
	}
	
	@Override
	public Member selectOneProfile(MemberVo vo) {
		return dao.selectOneProfile(vo);
	}

	@Override
	public int updtProfile(Member dto) {
		return dao.updtProfile(dto);
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
	
	
	public static String nowString() throws Exception {
		LocalDateTime localDateTime = LocalDateTime.now();
		String localDateTimeString = localDateTime.format(DateTimeFormatter.ofPattern(Constants.DATETIME_FORMAT_BASIC));
		return localDateTimeString;
	}
	
  public void uploadFiles(MultipartFile[] multipartFiles, Member dto, String userUploaded, int type, int maxNumber) throws Exception {
  
	  for(int i=0; i<multipartFiles.length; i++) {
	  
		  if(!multipartFiles[i].isEmpty()) {
		  
		  String className = dto.getClass().getSimpleName().toString().toLowerCase();
		  String fileName = multipartFiles[i].getOriginalFilename(); 
		  String ext = fileName.substring(fileName.lastIndexOf(".") + 1); 
		  String uuid = UUID.randomUUID().toString(); 
		  String uuidFileName = uuid + "." + ext; 
		  String pathModule = className; 
		  String pathDate = nowString().substring(0,4) + "/" + nowString().substring(5,7) + "/" + nowString().substring(8,10); 
		  String path = Constants.UPLOAD_PATH_PREFIX + "/" + pathModule + "/" + pathDate + "/";
		  String pathForView = Constants.UPLOAD_PATH_PREFIX_FOR_VIEW + "/" + pathModule + "/" + pathDate + "/";
		  
		  File uploadPath = new File(path);
	  
			  if (!uploadPath.exists()) {
				  uploadPath.mkdir(); 
			  } else { 
				  // by pass 
			  }
		  
  
		  multipartFiles[i].transferTo(new File(path + uuidFileName));
		  
		  dto.setPath(pathForView); dto.setOriginalName(fileName);
		  dto.setUuidName(uuidFileName); dto.setExt(ext);
		  dto.setSize(multipartFiles[i].getSize());
		  dto.setUserUploaded(userUploaded); 
		  dto.setType(type); // dto.setDefaultNy();
		  dto.setSort(maxNumber + i); 
		  dto.setUserSeq(dto.getUlSeq());
		  
		  dao.insertUploaded(dto);
  
		  } 
  
	  }

  }

	@Override
	public List<Member> selectListUpload(Member dto) {
		return dao.selectListUpload(dto);
	}




}
	 

		


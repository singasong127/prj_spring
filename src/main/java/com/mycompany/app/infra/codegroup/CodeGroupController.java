package com.mycompany.app.infra.codegroup;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.app.infra.code.Code;
import com.mycompany.app.infra.code.CodeVo;

@Controller
public class CodeGroupController {
	
	@Autowired
	CodeGroupServiceImpl service;
	
	@RequestMapping(value="/xdmindex")
	public String xdmIndex(CodeGroupVo vo, Model model) {
		
		List<CodeGroup> list = service.selectList(vo);
		
//		왼쪽의 list는 jsp에서 사용할 변수명
		model.addAttribute("list", list);
		
		return "xdm/infra/index/indexXdmView";
	}
	
	@RequestMapping(value="/cglist")
	public String codeGroupList(@ModelAttribute("vo") CodeGroupVo vo, Model model) {
		
		vo.setShKey(vo.getShKey() == null ? "" : vo.getShKey());
		
		vo.setParamsPaging(service.selectOneCount(vo));
		
		if(vo.getTotalRows() > 0) {
			List<CodeGroup> list = service.selectList(vo);
			model.addAttribute("list", list);
//			model.addAttribute("vo", vo);
		} else {
//			by pass
		}
		
		return "xdm/infra/codegroup/codeGroupXdmList";
	}
	
//	vo.setShKey(vo.getShKey() == null ? "email" : vo.getShKey());
//	
//	List<CodeGroup> list = service.selectList(vo);
//	
////	왼쪽의 list는 jsp에서 사용할 변수명
//	model.addAttribute("list", list);
////	model.addAttribute("vo", vo);
//	
//	return "xdm/infra/codegroup/codeGroupXdmList";
	
	@RequestMapping(value="/cgform")
	public String codeGroupForm(CodeGroupVo vo, Model model) {
		CodeGroup codeGroup = service.selectOne(vo);
		
		model.addAttribute("item", codeGroup);
		
		return "xdm/infra/codegroup/codeGroupForm";
	}
	
	@RequestMapping(value="/cgupdate")
	public String codeGroupUpdate(CodeGroup dto) {
		
		System.out.println("codeGroupUpdate");
		
		service.update(dto);
		
		return "redirect:/cglist";
	}
	
	@RequestMapping(value="/cguelect")
	public String codeGroupUelect(CodeGroup dto) {
		
		System.out.println("Uelect");
		
		service.uelect(dto);
		
		return "redirect:/cglist";
	}
	
	@RequestMapping(value="/cgdelete")
	public String codeGroupDelete(CodeGroup dto) {
		
		System.out.println("Deleted");
		
		service.delete(dto);
		
		return "redirect:/cglist";
	}
	
	@RequestMapping(value="/cginsert")
	public String codeGroupInsert(CodeGroup dto) {
		
		System.out.println("Inserted");
		
		service.insert(dto);
		
		return "redirect:/cglist";
	}
	
	// Excel 다운로드 메소드
	@RequestMapping("/excelDownload")
    public void excelDownload(CodeGroupVo vo, HttpServletResponse httpServletResponse) throws Exception {
		
		vo.setParamsPaging(service.selectOneCount(vo));

		if (vo.getTotalRows() > 0) {
			List<CodeGroup> list = service.selectList(vo);
			
//			Workbook workbook = new HSSFWorkbook();	// for xls
	        Workbook workbook = new XSSFWorkbook();
	        Sheet sheet = workbook.createSheet("첫번째 시트");
	        CellStyle cellStyle = workbook.createCellStyle();        
	        Row row = null;
	        Cell cell = null;
	        int rowNum = 0;
			
//	        each column width setting
	        sheet.setColumnWidth(0, 2100);
	        sheet.setColumnWidth(1, 3100);

//	        Header
	        String[] tableHeader = {"시퀀스", "코드그룹 이름", "삭제 여부"};

	        row = sheet.createRow(rowNum++);
			for(int i=0; i<tableHeader.length; i++) {
				cell = row.createCell(i);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
				cell.setCellValue(tableHeader[i]);
			}

//	        Body
	        for (int i=0; i<list.size(); i++) {
	            row = sheet.createRow(rowNum++);
	            
//	            String type: null 전달 되어도 ok
//	            int, date type: null 시 오류 발생 하므로 null check
//	            String type 이지만 정수형 데이터가 전체인 seq 의 경우 캐스팅
	            
	            cell = row.createCell(0);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	            cell.setCellValue(Integer.parseInt(list.get(i).getCgSeq()));
	            
	            cell = row.createCell(1);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	cell.setCellValue(list.get(i).getCgName());
	        	
	            cell = row.createCell(2);
	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
	        	cell.setCellStyle(cellStyle);
	        	cell.setCellValue(list.get(i).getDelNy());
	        	
//	            cell = row.createCell(3);
//	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
//	        	cell.setCellStyle(cellStyle);
//	        	cell.setCellValue(list.get(i).getIfcdSeqAnother());
//	            
//	            cell = row.createCell(4);
//	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
//	            cell.setCellStyle(cellStyle);
//	            cell.setCellValue(list.get(i).getIfcdName());
//	            
//	            cell = row.createCell(5);
//	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
//	            cell.setCellStyle(cellStyle);
//	            cell.setCellValue(list.get(i).getIfcdNameEng());
//     
//	            cell = row.createCell(6);
//	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
//	            cell.setCellStyle(cellStyle);
//	            if(list.get(i).getIfcdUseNy() != null) cell.setCellValue(list.get(i).getIfcdUseNy() == 0 ? "N" : "Y");
//	            
//	            cell = row.createCell(7);
//	            cellStyle.setAlignment(HorizontalAlignment.CENTER);
//	            cell.setCellStyle(cellStyle);
//	            if(list.get(i).getIfcdOrder() != null) cell.setCellValue(list.get(i).getIfcdOrder());
//	            
//	            cell = row.createCell(8);
//	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
//	        	cell.setCellStyle(cellStyle);
//	        	if(list.get(i).getRegDateTime() != null) cell.setCellValue(UtilDateTime.dateTimeToString(list.get(i).getRegDateTime()));
//	        	
//	        	cell = row.createCell(9);
//	        	cellStyle.setAlignment(HorizontalAlignment.CENTER);
//	        	cell.setCellStyle(cellStyle);
//	        	if(list.get(i).getModDateTime() != null) cell.setCellValue(UtilDateTime.dateTimeToString(list.get(i).getModDateTime()));
	        }

	        httpServletResponse.setContentType("ms-vnd/excel");
//	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xls");	// for xls
	        httpServletResponse.setHeader("Content-Disposition", "attachment;filename=example.xlsx");

	        workbook.write(httpServletResponse.getOutputStream());
	        workbook.close();
		}
    }
	
}

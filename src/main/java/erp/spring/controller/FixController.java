package erp.spring.controller;

import java.io.File;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import erp.spring.dto.FixDTO;
import erp.spring.dto.FixFileDTO;
import erp.spring.service.FixService;

@Controller
@RequestMapping("/fixtures/")
public class FixController {
	@Autowired
	private HttpSession session;

	@Autowired
	private FixService fservice;

	@RequestMapping("toFixtures") // 비품 관리 목록 페이지로 이동
	public String toFixtures(HttpServletRequest request) {
		request.setAttribute("fix_list", fservice.selectAll());
		return "fixtures/fixtures";
	}
	@RequestMapping("toFixturesEnrollView") // 비품 등록 페이지로 이동
	public String toFixturesEnrollView() {
		return "fixtures/add_fixtures";
	}
	@RequestMapping("toFixturesView")
	public String toFixturesView(int seq, HttpServletRequest request) {
		FixDTO fdto = fservice.selectBySeq(seq);
		FixFileDTO ffdto = fservice.selectFileBySeq(seq);
		request.setAttribute("fdto", fdto);
		request.setAttribute("ffdto", ffdto);
		return "fixtures/fixtures_view";
	}
	@RequestMapping(value="enrollFixtures", method=RequestMethod.POST) // 비품 등록 기능
	public String enrollFixtures(FixDTO fdto, @RequestParam("image_file") MultipartFile file) throws Exception{
		// 뷰 -> 컨트롤러 데이터 입력 테스트
		System.out.println(fdto.getSeq() + " : "
				+ fdto.getName() + " : "
				+ fdto.getName() + " : "
				+ fdto.getCategory() + " : "
				+ fdto.getCategory_detail() + " : "
				+ fdto.getCode() + " : "
				+ fdto.getModel_name() + " : "
				+ fdto.getQuantity() + " : "
				+ fdto.getQuantity_unit() + " : "
				+ fdto.getManufacture() + " : "
				+ fdto.getPurchase_date());
		System.out.println("fileOriName" + file.getOriginalFilename());
		
		// 코드입력 로직
		String code = this.getCode(fdto.getCategory());
		fdto.setCode(code);
		// 입력
		// 이미지 파일 등록
		String realPath = session.getServletContext().getRealPath("upload/fixtures");
		File filePath = new File(realPath);
		if(!filePath.exists()) {
			filePath.mkdirs();
		}
		String enroll_date = new SimpleDateFormat("YYYY-MM-dd-ss").format(System.currentTimeMillis());
		String sysname = enroll_date + "_" + file.getOriginalFilename();
		FixFileDTO ffdto = new FixFileDTO();
		ffdto.setOriname(file.getOriginalFilename());
		ffdto.setSysname(sysname);
		fservice.insert(fdto, ffdto);
		File targetLoc = new File(realPath + "/" + ffdto.getSysname());
		file.transferTo(targetLoc);
		return "redirect:/fixtures/toFixtures";
	}
	public String getCode(String category) {
		String value = null;
		if(category.equals("문구사무용품")) {
			value = "PR-";
		}else if(category.equals("전자기기")) {
			value = "EL-";
		}else if(category.equals("비상용(의약품)")) {
			value = "MD-";
		}else if(category.equals("가구")) {
			value = "PF-";
		}else if(category.equals("도서")) {
			value = "BK-";
		}
		String code = fservice.selectByCategory(value);
		if(code.equals("검색결과 없음")) {
			// 검색결과가 없을 경우, 1부터 시작하도록 한다.
			code = value + "001";
		}else {
			// 검색결과가 있을 경우, +1을 한 코드를 반환한다.
			int code_seq = Integer.parseInt(code.substring(3, 6)) + 1;
			String format = String.format("%03d", code_seq);
			code = value + format;
		}
		return code;
	}
}

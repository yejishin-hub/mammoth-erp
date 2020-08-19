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
		// ㅇㅇ
		return "fixtures/fixtures";
	}
	@RequestMapping("toFixturesEnrollView") // 비품 등록 페이지로 이동
	public String toFixturesEnrollView() {
		return "fixtures/add_fixtures";
	}
	@RequestMapping(value="enrollFixtures", method=RequestMethod.POST) // 비품 등록 기능
	public String enrollFixtures(FixDTO fdto, @RequestParam("image_file") MultipartFile file) {
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
		// 입력
		// 이미지 파일 등록
		String realPath = session.getServletContext().getRealPath("upload/files");
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
		return "redirect:/fixtures/toFixtures";
	}
}

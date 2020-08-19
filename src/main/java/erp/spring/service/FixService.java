package erp.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import erp.spring.dao.FixDAO;
import erp.spring.dao.FixFileDAO;
import erp.spring.dto.FixDTO;
import erp.spring.dto.FixFileDTO;

@Service
public class FixService {
	@Autowired
	private FixDAO fdao;
	@Autowired
	private FixFileDAO ffdao;
	
	public List<FixDTO> selectAll(){
		return fdao.selectAll();
	}
	@Transactional("txManager")
	public void insert(FixDTO fdto, FixFileDTO ffdto) {
		fdao.insert(fdto);
		int seq = fdao.getNextval();
		ffdto.setParent_seq(seq);
		ffdao.insert(ffdto);
	}
}

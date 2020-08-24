package erp.spring.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import erp.spring.dto.FixFileDTO;

@Repository
public class FixFileDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insert(FixFileDTO ffdto) {
		return mybatis.insert("Fixtures.insertImage",ffdto);
	}
	public FixFileDTO selectFileBySeq(int parent_seq) {
		return mybatis.selectOne("Fixtures.selectFileBySeq", parent_seq);
	}
}

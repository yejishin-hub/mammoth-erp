package erp.spring.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import erp.spring.dto.FixDTO;

@Repository
public class FixDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	public List<FixDTO> selectAll() {
		return mybatis.selectList("Fixtures.selectAll");
	}
	public int getNextval() {
		return mybatis.selectOne("Fixtures.getNextval");
	}
	public int insert(FixDTO fdto) {
		return mybatis.insert("Fixtures.insert", fdto);
	}
	public String selectByCategory(String category) {
		String result = mybatis.selectOne("Fixtures.selectByCategory", category);
		if(result == null) {
			result = "검색결과 없음";
		}
		return result;
	}
	public FixDTO selectBySeq(int seq) {
		return mybatis.selectOne("Fixtures.selectBySeq", seq);
	}
}

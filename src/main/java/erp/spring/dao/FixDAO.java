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
}

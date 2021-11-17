package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import kr.co.sist.dao.GetJdbcTemplate;
import valueObject.JobListVO;

public class JobPostDAO {
	/**
	 * 총 공고 수 얻기
	 * @return 총 공고 수
	 * @throws DataAccessException
	 */
	public int selCnt() throws DataAccessException {
		int cnt=0;
		
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		
		JdbcTemplate jt=gjt.getJdbcTemplate();
		
		String select="select count(idx) from job_post";
		cnt=jt.queryForObject(select, Integer.class);
		
		gjt.closeAc();
		
		return cnt;
	}//selCnt
	
	/**
	 * 전체 공고 리스트
	 * @return 회사명, 이미지, 경력, 주소
	 * @throws SQLException
	 */
	public List<JobListVO> selAllTitle(int begin, int end) throws SQLException {
		List<JobListVO> list=null;
		
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		
		JdbcTemplate jt=gjt.getJdbcTemplate();
		
		StringBuilder select=new StringBuilder();
		select
		.append("	select idx, company, img, career, address	")
		.append("	from (select rownum r_num, idx, company, img, career, address	")
		.append("			from job_post)	")
		.append("	where r_num between ? and ?	");
		list=jt.query(select.toString(), new Object[] { begin, end }, new RowMapper<JobListVO>() {
			public JobListVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				JobListVO jVO=new JobListVO();
				jVO.setIdx(rs.getInt("idx"));
				jVO.setCompany(rs.getString("company"));
				jVO.setImg(rs.getString("img"));
				jVO.setCareer(rs.getInt("career"));
				jVO.setAddress(rs.getString("address"));
				return jVO;
			}
		});
		
		gjt.closeAc();
		
		return list;
	}//selAllTitle
	
}

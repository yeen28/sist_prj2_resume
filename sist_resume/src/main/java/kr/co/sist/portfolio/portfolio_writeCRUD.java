package kr.co.sist.portfolio;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;

import kr.co.sist.dao.GetJdbcTemplate;

public class portfolio_writeCRUD {
	
	public int insertPortfolio(portfolio_writeVO pbVO) throws DataAccessException {
		int cnt=0;
		
		//1. GetJdbcTemplate 얻기
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		//2. JdbcTemplate 얻기
		JdbcTemplate jt=gjt.getJdbcTemplate();
		//3. 쿼리문 작성
		String insert="insert into portfolio(idx, proj_title, date_year, team, description, id) values(port_seq.nextval,?,?,?,?,?)";
		cnt=jt.update(insert, pbVO.getProj_title(), pbVO.getDate_year(), pbVO.getTeam(), pbVO.getDescription(), pbVO.getId());
		//4. 닫기
		gjt.closeAc();
		
		return cnt;
		
	}//insertPortfolio

}//class
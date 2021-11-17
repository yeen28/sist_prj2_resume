package kr.co.sist.profile;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import kr.co.sist.dao.GetJdbcTemplate;


public class ProfileDAO {
	
	/**
	 * 	프로필 정보  insert
	 * @param pVO
	 * @throws DataAccessException
	 */
	public void insertProfile(ProfileVO pVO)throws DataAccessException {
			
			//1. Spring Container 생성
			GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
			
			//2. JdbcTemplate 얻기
			JdbcTemplate jt = gjt.getJdbcTemplate();
			
			//3. 쿼리문 수행
			String insertProfile = 
					"insert into profile(idx,gender,phone,description,url,img,input_date,tech_idx,id) values(profile_seq.nextval,?,?,?,?,?,sysdate,?,?)";
			jt.update(insertProfile, 
		            pVO.getGender(), pVO.getPhone(), pVO.getDescription(), pVO.getUrl(), pVO.getImg(),
		            pVO.getTech_idx(), pVO.getId());
			//4. Spring Container 닫기
			gjt.closeAc();
			
		}//insertProfile
	
	public ProfileVO selProfile(String id) throws DataAccessException{
		ProfileVO pv = new ProfileVO();
		
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		JdbcTemplate jt = gjt.getJdbcTemplate();
		
		String select = "select gender,phone,description,url,img,tech_idx from profile where id=?";
		pv = jt.queryForObject(select, new Object[] { id }, new RowMapper<ProfileVO>() {
			public ProfileVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				ProfileVO pv = new ProfileVO();
				pv.setGender(rs.getString("gender"));
				pv.setPhone(rs.getString("phone"));
				pv.setDescription(rs.getString("description"));
				pv.setUrl(rs.getString("url"));
				pv.setImg(rs.getString("img"));
				pv.setTech_idx(rs.getInt("tech_idx"));
				return pv;
			}
		});
		
		gjt.closeAc();
		
		return pv;
	}//updateProfile
	
	public int updateProfile(ProfileVO pVO)throws DataAccessException{
		
		int cnt = 0;
		
		//스프링 컨데이터 얻기
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		
		//JdbcTemplate 얻기
		JdbcTemplate jt = gjt.getJdbcTemplate();
		
		//쿼리 실행
		String updataProfile = "update profile set phone=?,description=?,url=?,img=?,tech_idx=? where id=?";
		cnt = jt.update(updataProfile, pVO.getPhone(), pVO.getDescription(), pVO.getUrl(), pVO.getImg(), pVO.getTech_idx(), pVO.getId() );
		
		gjt.closeAc();
		
		return cnt;
	}//updateProfile
	
	public List<TechVO> selectTech() throws DataAccessException{
		
		List<TechVO> list=null;
		
		//스프링 컨데이터 얻기
		GetJdbcTemplate gjt = GetJdbcTemplate.getInstance();
		
		//JdbcTemplate 얻기
		JdbcTemplate jt = gjt.getJdbcTemplate();
		
		//쿼리 실행
		String select = "select idx,subject from tech_stack";
		list = jt.query(select, new RowMapper<TechVO>() {
			public TechVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				TechVO tv=new TechVO();
				tv.setIdx(rs.getInt("idx"));
				tv.setSubject(rs.getString("subject"));
				return tv;
			}
		});
		
		gjt.closeAc();
		
		return list;
	}//selectTech
	



}//class













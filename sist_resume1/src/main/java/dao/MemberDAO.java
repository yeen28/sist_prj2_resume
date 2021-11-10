package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.dao.IncorrectResultSizeDataAccessException;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import kr.co.sist.dao.GetJdbcTemplate;
import valueObject.LoginVO;
import valueObject.MemberVO;
import valueObject.UpdatePwdVO;

public class MemberDAO {

	/**
	 * 회원가입 처리
	 * @param mVO 회원정보VO
	 * @throws DataAccessException
	 */
	public void insertMember( MemberVO mVO ) throws DataAccessException {
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		
		JdbcTemplate jt=gjt.getJdbcTemplate();
		
		String insertMember="insert into users(id, password, name, email, input_date) values(?,?,?,?,sysdate)";
		jt.update(insertMember, mVO.getId(), mVO.getPassword(), mVO.getName(), mVO.getEmail());
		
		gjt.closeAc();
	}//insertMember
	
	/**
	 * 로그인 처리
	 * @param id
	 * @param pw
	 * @return 회원이름
	 * @throws EmptyResultDataAccessException
	 * @throws IncorrectResultSizeDataAccessException
	 * @throws BadSqlGrammarException
	 */
	public String selectLogin( String id, String pw ) throws SQLException {
		String result="";
		
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		
		JdbcTemplate jt=gjt.getJdbcTemplate();
		
		StringBuilder selectMember=new StringBuilder();
		selectMember
		.append("	select name	")
		.append("	from users	")
		.append("	where id=? and password=? ");
		result=jt.queryForObject(selectMember.toString(), new Object[] { id, pw }, String.class);
		
		gjt.closeAc();
		
		return result;
	}//selectLogin
	
	/**
	 * 회원 정보 조회
	 * @param id
	 * @param pw
	 * @return 아이디,이름,이메일
	 * @throws SQLException
	 */
//		public MemberVO selectAll( String id, String pw ) throws SQLException {
	public LoginVO selectAll( String id, String pw ) throws SQLException {
		LoginVO returnMember=null;
		/* MemberVO returnMember=null; */
		
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		
		JdbcTemplate jt=gjt.getJdbcTemplate();
		
		StringBuilder selectMember=new StringBuilder();
		selectMember
		.append("	select id, name, email	")
		.append("	from users	")
		.append("	where id=? and password=? ");
		returnMember=jt.queryForObject(selectMember.toString(), new Object[] { id, pw }, 
				new RowMapper<LoginVO>() {
					public LoginVO mapRow(ResultSet rs, int rowNum) throws SQLException{
						LoginVO lv=new LoginVO();
						lv.setId(rs.getString("id"));
						lv.setName(rs.getString("name"));
						lv.setEmail(rs.getString("email"));
						return lv;
					}//mapRow
				});
//		returnMember=jt.queryForObject(selectMember.toString(), new Object[] { id, pw }, 
//				new RowMapper<MemberVO>() {
//			public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException{
//				MemberVO mv=new MemberVO();
//				mv.setId(rs.getString("id"));
//				mv.setPassword(rs.getString("password"));
//				mv.setName(rs.getString("name"));
//				mv.setEmail(rs.getString("email"));
//				mv.setInput_date(rs.getString("input_date"));
//				return mv;
//			}//mapRow
//		});
		
		gjt.closeAc();
		
		return returnMember;
	}//selectLogin
	
	/**
	 * 아이디 찾기
	 * @param name
	 * @param email
	 * @return 아이디
	 * @throws EmptyResultDataAccessException
	 * @throws IncorrectResultSizeDataAccessException
	 * @throws BadSqlGrammarException
	 */
	public String selectFindId( String name, String email ) throws SQLException {
		String id="";
		
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		
		JdbcTemplate jt=gjt.getJdbcTemplate();
		
		StringBuilder selectId=new StringBuilder();
		selectId
		.append("	select id	")
		.append("	from users	")
		.append("	where name=? and email=?	");
		id=jt.queryForObject(selectId.toString(), new Object[] { name, email }, String.class);
		
		gjt.closeAc();
		
		return id;
	}//selectFindId
	
	/**
	 * 비밀번호 찾기
	 * @param name
	 * @param id
	 * @param email
	 * @return 비밀번호
	 * @throws EmptyResultDataAccessException
	 * @throws IncorrectResultSizeDataAccessException
	 * @throws BadSqlGrammarException
	 */
	public String selectFindPw ( String name, String id, String email ) throws SQLException {
		String pw="";
		
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		
		JdbcTemplate jt=gjt.getJdbcTemplate();
		
		StringBuilder selectId=new StringBuilder();
		selectId
		.append("	select password	")
		.append("	from users	")
		.append("	where name=? and id=? and email=?	");
		pw=jt.queryForObject(selectId.toString(), new Object[] { name, id, email }, String.class);
		
		gjt.closeAc();
		
		return pw;
	}//selectFindPw
	
	/**
	 * 세션의 아이디를 사용하여 일치하는 비밀번호 얻기
	 * @param id
	 * @return 비밀번호
	 */
	public String selChangePw(String id) throws SQLException {
		String pw="";
		
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		
		JdbcTemplate jt=gjt.getJdbcTemplate();
		
		StringBuilder selectPw=new StringBuilder();
		selectPw
		.append("	select password	")
		.append("	from users	")
		.append("	where id=?	");
		pw=jt.queryForObject(selectPw.toString(), new Object[] { id }, String.class);
		
		gjt.closeAc();
		
		return pw;
	}//selectPw
	
	/**
	 * 비밀번호 변경
	 * @param uVO
	 * @return
	 * @throws DataAccessException
	 */
	public void updatePw( UpdatePwdVO uVO ) throws DataAccessException {
		
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		
		JdbcTemplate jt=gjt.getJdbcTemplate();
		
		StringBuilder updateMember=new StringBuilder();
		updateMember
		.append("	update users	")
		.append("	set password=?	")
		.append("	where id=?");
		jt.update(updateMember.toString(), uVO.getNew_pass(), uVO.getId());
		
		gjt.closeAc();
		
	}//insertMember
	
	/**
	 * 아이디 중복검사 : 아이디가 DB Table에 존재하는지?
	 * @param id 조회할 id
	 * @return 조회된 id
	 * @throws SQLException
	 */
	public String selectId(String id) throws SQLException{
		String returnId="";
		
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		
		JdbcTemplate jt=gjt.getJdbcTemplate();
		
		String selectId="select id from users where id=?";
		try {
			//한 건의 레코드가 조회되면 조회결과가 변수에 저장
			returnId=jt.queryForObject(selectId, new Object[] { id }, String.class);
		} catch(EmptyResultDataAccessException erdae) {
			//조회결과가 없을 때에는 예외발생.
			returnId="";
		}//end catch
		
		gjt.closeAc();
		
		return returnId;
	}//selectId
	
	/**
	 * 회원탈퇴<br/>
	 * 회원의 아이디와 비밀번호가 일치하는지 확인
	 * @param mVO
	 * @return 비밀번호
	 * @throws SQLException
	 */
	public String selectPw(MemberVO mVO) throws SQLException {
		String pw="";
		
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		
		JdbcTemplate jt=gjt.getJdbcTemplate();
		
		StringBuilder selectPw=new StringBuilder();
		selectPw
		.append("	select password	")
		.append("	from users	")
		.append("	where id=?	");
		pw=jt.queryForObject(selectPw.toString(), new Object[] { mVO.getId() }, String.class);
		
		gjt.closeAc();
		
		return pw;
	}//selectPw
	
	/**
	 * 회원탈퇴 ( 회원이 탈퇴하면 모든 기록 삭제 )
	 * @throws SQLException
	 */
	public void deleteMember(MemberVO mVO) throws SQLException{
		
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
	
		JdbcTemplate jt=gjt.getJdbcTemplate();
	
		String deleteMember="delete from users where id=?";
		jt.update(deleteMember, mVO.getId());
		
		gjt.closeAc();
	}//deleteMember
	
//	/**
//	 * 회원탈퇴 ( 회원이 탈퇴하면 id외의 정보는 삭제 )
//	 * @throws SQLException
//	 */
//	public void deleteMember(MemberVO mVO) throws SQLException{
//		
//		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
//		
//		JdbcTemplate jt=gjt.getJdbcTemplate();
//		
//		String deleteMember="update users set password='-',name='-',email='-',is_leave='y' where id=?";
//		jt.update(deleteMember, mVO.getId());
//		
//		gjt.closeAc();
//	}//deleteMember
	
	/**
	 * 회원이 선택한 관심분야 얻기
	 * @param id
	 * @return 관심분야
	 * @throws SQLException
	 */
	public List<String> selectSub(String id) throws SQLException{
		List<String> returnSub=null;
		
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		
		JdbcTemplate jt=gjt.getJdbcTemplate();
		
		StringBuilder subject=new StringBuilder();
		subject
		.append("	select subject	")
		.append("	from tech_stack	")
		.append("	where idx in (	")
		.append("	select tech_idx	")
		.append("	from profile	")
		.append("	where id=?)	");
		returnSub=jt.query(subject.toString(), new Object[] { id }, new RowMapper<String>() {
			public String mapRow( ResultSet rs, int rowNum ) throws SQLException{
				return String.valueOf(rs.getString("subject"));
			}//mapRow
		});
		
		gjt.closeAc();
		
		return returnSub;
	}//selectSub
	
	/**
	 * 회원의 홈페이지 주소 얻기
	 * @param id
	 * @return 회원의 홈페이지 URL
	 * @throws SQLException
	 */
	public List<String> selectUrl(String id) throws SQLException{
		List<String> returnUrl=null;
		
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		
		JdbcTemplate jt=gjt.getJdbcTemplate();
		
		StringBuilder select=new StringBuilder();
		select
		.append("	select url	")
		.append("	from profile	")
		.append("	where id=?	");
		returnUrl=jt.query(select.toString(), new Object[] { id }, new RowMapper<String>() {
			public String mapRow( ResultSet rs, int rowNum ) throws SQLException{
				return String.valueOf(rs.getString("url"));
			}//mapRow
		});
		
		gjt.closeAc();
		
		return returnUrl;
	}//selectUrl
	
	public List<String> selectPhone(String id) throws SQLException{
		List<String> returnPhone=null;
		
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		
		JdbcTemplate jt=gjt.getJdbcTemplate();
		
		StringBuilder select=new StringBuilder();
		select
		.append("	select phone	")
		.append("	from profile	")
		.append("	where id=?	");
		returnPhone=jt.query(select.toString(), new Object[] { id }, new RowMapper<String>() {
			public String mapRow( ResultSet rs, int rowNum ) throws SQLException{
				return String.valueOf(rs.getString("phone"));
			}//mapRow
		});
		
		gjt.closeAc();
		
		return returnPhone;
	}//selectPhone
	
	
	
	public List<MemberVO> selectAllUser(String pw) throws SQLException{
		List<MemberVO> list=null;
		
		GetJdbcTemplate gjt=GetJdbcTemplate.getInstance();
		
		JdbcTemplate jt=gjt.getJdbcTemplate();
		
		StringBuilder selectMember=new StringBuilder();
		selectMember
		.append("	select id, password, name, email, input_date	")
		.append("	from users	");
		
		//dynamic query
		if( pw != "" || pw != null ) {
			selectMember.append("	where password=?");
		}//end if
		
		if( pw == "" || pw == null ) {
			//모든 회원정보를 조회
			list=jt.query(selectMember.toString(), new SelectMember());
		} else {
			//비밀번호가 맞는 회원정보를 조회
			list=jt.query(selectMember.toString(), new Object[] { pw }, new SelectMember());
		}//end else
		
		//4.Spring Container 닫기
		gjt.closeAc();
		return list;
	}//selectAllUser
	
	/////////////// inner class : 회원정보를 저장할 목적의 클래스 시작 /////////////////
	public class SelectMember implements RowMapper<MemberVO>{
		public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			MemberVO mv=new MemberVO();
			mv.setId(rs.getString("id"));
			mv.setPassword(rs.getString("password"));
			mv.setName(rs.getString("name"));
			mv.setEmail(rs.getString("email"));
			mv.setInput_date(rs.getString("input_date"));
			return mv;
		}//mapRow
	}
	
}//class

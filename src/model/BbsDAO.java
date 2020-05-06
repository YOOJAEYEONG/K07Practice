package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

public class BbsDAO {
	//DAO에서 기본 할일
	//1.DB연결
	//2. 자원해제
	Connection con;	
	PreparedStatement psmt;
	ResultSet rs;	
	
	
	//인자생성자:DB연결
	public BbsDAO(String diver, String url) {
		
		try {
			//드라이버로드
			Class.forName(diver);
			String id = "kosmo";
			String pw = "1234";
			
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB연결 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	//DB자원해제
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
			
		} catch (Exception e) {
			System.out.println("자원반납시 예외발생");
			e.printStackTrace();
		}
	}
	
	/*
	게시판 리스트에서 게시물의 갯수를 count()를 통해 반환
	가상번호, 페이지 변호 처리를 위해 사용됨.
	*/
	public int getTotalRecordCount(Map<String,Object> map) {
		
		//게시물의 수는 0으로 초기화
		int totalCount =0;
		
		//기본쿼리문(전체 레코드를 대상으로 함)
		String query = "SELECT COUNT(*) FROM board ";
		
		//JSP페이지에서 검색어를 입력한 경우 where절이 동적으로 추가됨
		if(map.get("Word")!=null) {
			query += " WHERE "+ map.get("Column") +" "
					+ " LIKE '%"+map.get("Word")+"%' ";
		}
		System.out.println("query="+query);
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			rs.next();
			//반환된 결과값(레코드수)을 저장
			totalCount = rs.getInt(1);
		} catch (Exception e) {	}
		
		return totalCount;
	}
	
	/*
	게시판 리스트에서 조건에 맞는 레코드를 select하여 ResultSet(결과셋)을
	List컬렉션에 저장후 반환하는 메소드
	 */
	public List<BbsDTO> selectList(Map<String, Object> map){
		//arraylist , vector를 여기서 사용할 수 있다. 둘이 사용법이 같기때문임
		List<BbsDTO> bbs = new Vector<BbsDTO>();
		//기본쿼리문
		String query = "SELECT * FROM board ";
		
		//검색어가 있는경우 조건절 동적추가
		if(map.get("Word")!=null) {
			query += " WHERE "+map.get("Column")+" "
					+" LIKE '%"+map.get("Word")+"%'";
		}
		//최근 게시물의 항상 위로 노출되어야 하므로 작성된 순서의 역순으로 정렬
		query += " ORDER BY num DESC ";
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			//오라클이 반환해준 ResultSet의 갯수만큼 반복함
			while (rs.next()) {
				//하나의 레코드를 DTO객체에 저장하기위해 새로운 객체 생성
				BbsDTO dto = new BbsDTO();
				
				//setter를 통해 컬럼에 데이터 저장
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString(3));
				dto.setPostDate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString(6));
				
				//저장된 DTO객체를 List컬렉션에 추가
				bbs.add(dto);
			}
		} catch (Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		return bbs;
	}
}




























<%@page import="Util.PagingUtil"%>
<%@page import="model.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
//한글깨짐 처리 - 검색폼에서 입력된 할글이 전송되기 때뭉
request.setCharacterEncoding("UTF-8");


String drv = application.getInitParameter("JDBCDriver");
String url = application.getInitParameter("ConnectionURL");

BbsDAO dao = new BbsDAO(drv,url);

Map<String, Object> param = new HashMap<String, Object>();

String searchColumn = request.getParameter("searchColumn");
String searchWord = request.getParameter("searchWord");

String queryStr  = "";

	
if(searchWord != null ){
	param.put("Column", searchColumn);
	param.put("Word", searchWord);
}

int totalRecordCount = dao.getTotalRecordCount(param);

/***페이지처리 start ***/
int pageSize =
	Integer.parseInt(application.getInitParameter("PAGE_SIZE"));//10
int blockPage =
	Integer.parseInt(application.getInitParameter("BLOCK_PAGE"));//5
int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);

int nowPage = 
		request.getParameter("nowPage")==null 	||
		request.getParameter("nowPage").equals("")	? 1 :
				Integer.parseInt(request.getParameter("nowPage"));
				

int start = (nowPage-1) * pageSize+1;
int end = nowPage*pageSize;

param.put("start", start);
param.put("end", end);
/**페이지처리 end**/


List<BbsDTO> bbs = dao.selectList(param);

dao.close();


%>
  

   
    
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/boardHead.jsp" />
<body>
<div class="container">
	<jsp:include page="../common/boardTop.jsp" />
	<div class="row">		
		<jsp:include page="../common/boardLeft.jsp"/>
		<div class="col-9 pt-3">
			<h3>게시판 - <small>이런저런 기능이 있는 게시판입니다.</small></h3>
			
			<div class="row">
				<!-- 검색부분 -->
				<form class="form-inline ml-auto" name="searchFrm" method="get">	
					<div class="form-group">
						<select name="searchColumn" class="form-control">
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
					</div>
					<div class="input-group">
						<input type="text" name="searchWord"  class="form-control"/>
						<div class="input-group-btn">
							<button type="submit" class="btn btn-warning">
								<i class='fa fa-search' style='font-size:20px'></i>
							</button>
						</div>
					</div>
				</form>	
			</div>
			<div class="row mt-3">
				<!-- 게시판리스트부분 -->
				<table class="table table-bordered table-hover table-striped">
				<colgroup>
					<col width="60px"/>
					<col width="*"/>
					<col width="120px"/>
					<col width="120px"/>
					<col width="80px"/>
					<col width="60px"/>
				</colgroup>				
				<thead>
				<tr style="background-color: rgb(133, 133, 133);" 
					class="text-center text-white">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<!-- <th>첨부</th> -->
				</tr>
				</thead>				
				<tbody>
    
<%
			//List컬렉션에 입력된 데이터가 없을때 true를 반환.
			if(bbs.isEmpty()){
			%>	
				<tr>
					<td colspan="6" align="center" height="100">
						등록된 게시물이 없습니다.
					</td>
				</tr>
			<%
			} else {
				//게시물의 가상번호로 사용할 변수
				int vNum = 0;
				int countNum = 0;
				/*
				컬렉션에 입력된 데이터가 있다면 저장된 BbsDTO의 갯수만큼 즉, DB가 반환해준
				레코드의 갯수만큼 반복하면서 출력한다.
				*/
				for(BbsDTO dto : bbs){
					//전체 레코드수를 이용하여 하나씩 차감하면서 가상번호 부여
					vNum = totalRecordCount- 
						(nowPage-1)* pageSize + countNum++;
			%>	
    
    
				<%-- 리스트반복 시작 --%>
				<tr>
					<td class="text-center"><%=vNum %></td>
					<td class="text-left">
						<a href="BoardView.jsp?num=<%=dto.getNum() %>
							&nowPage=<%=nowPage%>&<%=queryStr%>">
							<%=dto.getTitle() %>
						</a>
					</td>
					<td class="text-center"><%=dto.getId() %></td>
					<td class="text-center"><%=dto.getPostDate() %></td>
					<td class="text-center"><%=dto.getVisitcount() %></td>
					<!-- <td class="text-center">
						<i class="material-icons" style="font-size:20px">
							attach_file</i>
					</td> --> 
					
				</tr>
				<%-- 리스트반복 끝--%>
			<%
				}//for-each
			}//if
			%>
				</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col text-right">
					<!-- 각종 버튼 부분 -->
					<button type="button" class="btn">Basic</button>
					<button type="button" class="btn btn-primary"
						onclick="location.href='./BoardWrite.jsp'">글쓰기</button>
					<!-- <button type="button" class="btn btn-secondary">수정하기</button>
					<button type="button" class="btn btn-success">삭제하기</button>
					<button type="button" class="btn btn-info">답글쓰기</button>
					<button type="button" class="btn btn-warning">리스트보기</button>
					<button type="button" class="btn btn-danger">전송하기</button>
					<button type="button" class="btn btn-dark">Reset</button>
					<button type="button" class="btn btn-light">Light</button>
					<button type="button" class="btn btn-link">Link</button> -->
				</div>
			</div>
			<div class="row mt-3">
				<div class="col">
					<!-- 페이지번호 부분 -->
					<%=PagingUtil.pagingImg(totalRecordCount, pageSize,
							blockPage, nowPage, "BoardList.jsp?"+queryStr) %>
					
					
				</div>				
			</div>		
		</div>
	</div>
	<jsp:include page="../common/boardBottom.jsp" />
	<!--"name"과 "value" 속성들을 포함한 "jsp:param" 표준 액션이 요구됩니다.
	=> 액션태그 닫는 태그가 />가 아닌경우 발생하였다.
	  -->
</div>
</body>
</html>   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
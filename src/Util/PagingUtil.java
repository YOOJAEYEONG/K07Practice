package Util;

public class PagingUtil {

	public static String pagingImg(int totalRecordCount,
			int pageSize, int blockPage, int nowPage, String pageName) {
		
		String pagingStr = "";
		int totalPage = 
				(int)(Math.ceil(((double)totalRecordCount/pageSize)));
		
		int intTemp = ((nowPage-1) / blockPage * blockPage )+1;
		
		if(intTemp != 1) {
			pagingStr += ""
					+ "<a href='"+pageName+"nowPage=1'>"
						+ "<img src='../images/paging1.gif'>"
					+ "</a>";
			
			pagingStr += "&nbsp;";
			
			pagingStr += 
					"a href='"+pageName+"nowPage="
					+ (intTemp-blockPage)+"'>"
						+ "<img src='../images/paging2.gif'>"
					+ "</a>";
		}
		
		int blockCount =1 ;
		
		while(blockCount<=blockPage && intTemp<=totalPage) {
			if(intTemp==nowPage) {
				pagingStr += "&nbsp;"+intTemp+"&nbsp;";
			}else {
				pagingStr += "&nbsp;"
						+ "<a href='"+pageName+"nowPage"+intTemp+"'>"
							+intTemp
						+ "</a>&nbsp;";
			}
			intTemp++;
			blockCount++;
		}
		if(intTemp <= totalPage) {
			pagingStr += 
					"<a href='"+pageName+"nowPage="+intTemp+"'>"
					+ "&nbsp;"
					+ "<a href='"+pageName+"nowPage="+totalPage+"'>"
					+ "	<img src='../images/paging4.gif'>"
					+ "</a>";
			
		}
		
		
		return pagingStr;
	}
	
	

	
	//blockPage:5 , pageSize : 10
	public static String pagingBS4(int totalRecordCount,
			int pageSize, int blockPage, int nowPage, String pageName) {
		
		String pagingStr = "";
		
		int totalPage = 
				(int)(Math.ceil(((double)totalRecordCount/pageSize)));
		System.out.println("totalPage"+totalPage);
		
		int intTemp = (((nowPage-1) / blockPage) * blockPage) +1;
		System.out.println("intTemp:"+intTemp);
		
		if(intTemp != 1) {
			
			/*
			<li class="page-item">
				<a href="#" class="page-link">
					<i class="fas fa-angle-double-left"></i>
				</a>
			</li>
			*/
			
			
			
			pagingStr += ""
					+ "<a href='"+pageName+"nowPage=1'>"
					+ "<img src='../images/paging1.gif'></a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='"+pageName+"nowPage="
					+ (intTemp-blockPage)+"'>"
					+ "<img src='../images/paging2.gif'></a>";
		}
		
		int blockCount =1;
		
		while(blockCount<=blockPage && intTemp<=totalPage) {
			if(intTemp==nowPage) {
				pagingStr += "&nbsp;"+intTemp+"&nbsp;";
			}else {
				pagingStr += "&nbsp;<a href='"+pageName
						+"nowPage="+intTemp+"'>"+intTemp+"</a>&nbsp;";
			}
			intTemp++;
			blockCount++;
		}
		if(intTemp <= totalPage) {
			pagingStr += "<a href='"+pageName+"nowPage="+intTemp+"'>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='"+pageName+"nowPage="+totalPage+"'>"
					+ "<img src='../images/paging4.gif'></a>";
		}
		
		return pagingStr;
	}
}




































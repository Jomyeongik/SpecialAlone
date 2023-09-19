package com.alone.special.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alone.special.admin.domain.Singo;
import com.alone.special.admin.service.AdminService;
import com.alone.special.hobby.domain.Board;
import com.alone.special.hobby.service.BoardService;
import com.alone.special.noticeEvent.domain.NoticeEvent;
import com.alone.special.noticeEvent.domain.PageInfo;
import com.alone.special.noticeEvent.service.NoticeEventService;
import com.alone.special.product.domain.Product;
import com.alone.special.product.domain.ProductPageInfo;
import com.alone.special.product.service.ProductService;
import com.alone.special.user.domain.User;
import com.alone.special.user.service.UserService;

@Controller
public class AdminController {

	@Autowired
	private AdminService aService;
	@Autowired
	private UserService uService;
	@Autowired
	private BoardService hService;
	@Autowired
	private NoticeEventService nService;
	@Autowired
	private ProductService pService;
	
	
	@RequestMapping(value="/member/list.do", method=RequestMethod.GET)
	public ModelAndView showMemberList(ModelAndView mv,
			@RequestParam(value="currentPage", required=false, defaultValue="1") Integer currentPage) {
//		try {
//			Integer totalCount = uService.getUserListCount();
//			PageInfo pInfo = this.getPageInfo(totalCount, currentPage);
//			List<User> mList = uService.selectUserList(pInfo);
//			if(!mList.isEmpty()) {
//				mv.addObject("mList", mList).addObject("pInfo", pInfo).setViewName("admin/manageMember");
//			} else {
//				mv.addObject("msg", "멤버 조회가 완료되지 않았습니다.");
//				mv.addObject("url", "/index.jsp");
//				mv.setViewName("common/errorPage");
//			}
//		} catch (Exception e) {
//			mv.addObject("msg", "멤버 조회가 완료되지 않았습니다.");
//			mv.addObject("url", "/index.jsp");
//			mv.setViewName("common/errorPage");
//		}
		
		return mv;
	}
	
	@RequestMapping(value="/manageReply.do", method=RequestMethod.GET)
	public ModelAndView checkReplyType(ModelAndView mv,
			@RequestParam("selectedValue") String selectedValue,
			@RequestParam(value="currentPage", required=false, defaultValue="1") Integer currentPage) {
		if(selectedValue.equals("hobby")) {
			
		} else if(selectedValue.equals("security")) {
			
		}
		
		return mv;
	}
	
	@RequestMapping(value="/manageReply/search.do", method=RequestMethod.GET)
	public ModelAndView checkReplyTypeSearch(ModelAndView mv,
			@RequestParam("selectedValue") String selectedValue,
			@RequestParam("searchKeyword") String searchKeyword,
			@RequestParam(value="currentPage", required=false, defaultValue="1") Integer currentPage) {
		if(selectedValue.equals("hobby")) {
			
		} else if(selectedValue.equals("security")) {
			
		}
		
		return mv;
	}
	
	@RequestMapping(value="/manageBoard/search.do", method = RequestMethod.GET)
	public ModelAndView checkBoardTypeSearch(ModelAndView mv,
			@RequestParam("selectedValue") String selectedValue,
			@RequestParam("searchKeyword") String searchKeyword,
			@RequestParam(value="currentPage", required=false, defaultValue="1") Integer currentPage) {
		if(selectedValue.equals("notice")) { // 공지사항
			Integer totalCount = nService.getNoticeListCount(searchKeyword);
			PageInfo pInfo = this.getPageInfo(totalCount, currentPage);
			List<NoticeEvent> sList = nService.searchNoticeByKeyword(pInfo, searchKeyword);
			mv.addObject("sList", sList).addObject("pInfo", pInfo)
			.addObject("searchKeyword", searchKeyword).setViewName("/admin/manageNoticeSearch");
		} else if(selectedValue.equals("event")) { // 행사
			Integer totalCount = nService.getEventListCount(searchKeyword);
			PageInfo pInfo = this.getPageInfo(totalCount, currentPage);
			List<NoticeEvent> sList = nService.searchEventByKeyword(pInfo, searchKeyword);
			mv.addObject("sList", sList).addObject("pInfo", pInfo)
			.addObject("searchKeyword", searchKeyword).setViewName("/admin/manageEventSearch");
		}
		return mv;
	}
	
	@RequestMapping(value="/manageBoard.do", method = RequestMethod.GET)
	public ModelAndView checkBoardType(ModelAndView mv,
			@RequestParam("selectedValue") String selectedValue,
			@RequestParam(value="currentPage", required=false, defaultValue="1") Integer currentPage) {
		if(selectedValue.equals("notice")) { // 공지사항
			Integer totalCount = nService.getNoticeListCount();
			PageInfo pInfo = this.getPageInfo(totalCount, currentPage);
			List<NoticeEvent> nList = nService.selectNoticeList(pInfo);
			mv.addObject("nList", nList).addObject("pInfo", pInfo).setViewName("/admin/manageNotice");
		} else if(selectedValue.equals("event")) { // 행사
			Integer totalCount = nService.getEventListCount();
			PageInfo pInfo = this.getPageInfo(totalCount, currentPage);
			List<NoticeEvent> eList = nService.selectEventList(pInfo);
			mv.addObject("eList", eList).addObject("pInfo", pInfo).setViewName("/admin/manageEvent");
		} else if(selectedValue.equals("sProduct")) { // 안전 상품
			int totalCount = pService.getListCount();
			ProductPageInfo pInfo = this.getPageInfoS(totalCount, currentPage);
			List<Product> pList = pService.selectProductLust(pInfo);
			mv.addObject("pList", pList).addObject("pInfo", pInfo).setViewName("/admin/manageSProduct");
		} else if(selectedValue.equals("hBoard")) { //취미 게시글
			Integer totalCount = hService.getListCount("캠핑");
			com.alone.special.hobby.domain.PageInfo pInfo = this.getPageInfoH(totalCount, currentPage);
			Map<String, Object> getListMap = new HashMap<String, Object>();
			getListMap.put("refCategoryName", "캠핑");
			getListMap.put("pInfo", pInfo);
			List<Board> hList = hService.selectBoardList(getListMap);
			mv.addObject("hList", hList).addObject("pInfo", pInfo).setViewName("/admin/manageHBoard");
		} else if(selectedValue.equals("sReview")) { // 안전 리뷰
			//sList
		} else if(selectedValue.equals("fBoard")) { // 음식 추천
			//fList
		} else if(selectedValue.equals("fReview")) { // 음식 리뷰
			//fList
		}
		
		return mv;
	}
	
	
	@RequestMapping(value="/member/search.do", method=RequestMethod.GET)
	public ModelAndView showSearchMemberList(ModelAndView mv,
			@RequestParam("searchKeyword") String searchKeyword,
			@RequestParam(value="currentPage", required=false, defaultValue="1") Integer currentPage) {
//		try {
//			Integer totalCount = uService.getUserListCount(searchKeyword);
//			PageInfo pInfo = this.getPageInfo(totalCount, currentPage);
//			List<User> searchList = uService.selectUserList(pInfo, searchKeyword);
//			if(!searchList.isEmpty()) {
//				mv.addObject("searchKeyword", searchKeyword).addObject("pInfo", pInfo)
//				.addObject("sList", searchList).setViewName("admin/manageMemberSearch");
//			} else {
//				mv.addObject("msg", "멤버검색 조회가 완료되지 않았습니다.");
//				mv.addObject("url", "/index.jsp");
//				mv.setViewName("common/errorPage");
//			}
//		} catch (Exception e) {
//			mv.addObject("msg", "멤버검색 조회가 완료되지 않았습니다.");
//			mv.addObject("url", "/index.jsp");
//			mv.setViewName("common/errorPage");
//		}
		
		return mv;
	}
	
	@RequestMapping(value="/admin/singo.do", method=RequestMethod.POST)
	public String insertSingo(
			@RequestParam("reason") String reason,
			@RequestParam("productTitle") String productTitle,
			@RequestParam("name") String name,
			@RequestParam("url") String url,
			@RequestParam("content") String content) {
		String resultVal = "";
		try {
			//파라값들 받아서  singo 클래스에 넣어서 보내기-ajax로 받아서 String으로 리턴?
			Singo singo = new Singo();
			singo.setSingoContent(content);
			singo.setSingoId(name);
			singo.setSingoLocation(url);
			singo.setSingoLocationTitle(productTitle);
			singo.setSingoReason(reason);

			int result = aService.insertSingo(singo);
			if(result > 0) {
				resultVal = "success";
			} else {
				resultVal = "fail";
			}
		} catch (Exception e) {
			resultVal = "fail";
		}
		return resultVal;
	}
	
	@RequestMapping(value="/singo/list.do", method=RequestMethod.GET)
	public ModelAndView showSingoList(ModelAndView mv,
			@RequestParam(value="currentPage", required=false, defaultValue="1") Integer currentPage) {
		try {
			Integer totalCount = aService.getSingoListCount();
			PageInfo pInfo = this.getPageInfo(totalCount, currentPage);
			List<Singo> singoList = aService.selectSingoList(pInfo);
			if(!singoList.isEmpty()) {
				mv.addObject("singoList", singoList).addObject("pInfo", pInfo).setViewName("admin/singo");
			} else {
				mv.addObject("msg", "신고 회원 조회가 완료되지 않았습니다.");
				mv.addObject("url", "/index.jsp");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "신고 회원 조회가 완료되지 않았습니다.");
			mv.addObject("url", "/index.jsp");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/singo/search.do", method=RequestMethod.GET)
	public ModelAndView showSearchSingoList(ModelAndView mv,
			@RequestParam("searchKeyword") String searchKeyword,
			@RequestParam(value="currentPage", required=false, defaultValue="1") Integer currentPage) {
		try {
			Integer totalCount = aService.getSingoListCount(searchKeyword);
			PageInfo pInfo = this.getPageInfo(totalCount, currentPage);
			List<Singo> searchList = aService.selectSingoList(pInfo, searchKeyword);
			if(!searchList.isEmpty()) {
				mv.addObject("searchKeyword", searchKeyword).addObject("pInfo", pInfo)
				.addObject("singoList", searchList).setViewName("admin/singoSearch");
			} else {
				mv.addObject("msg", "신고회원 검색이 완료되지 않았습니다.");
				mv.addObject("url", "/singo/list.do");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "신고회원 검색이 완료되지 않았습니다.");
			mv.addObject("url", "/singo/list.do");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/singo/delete.do", method=RequestMethod.GET)
	public ModelAndView deleteSingo(ModelAndView mv,
			@RequestParam("singoNo") Integer singoNo) {
		try {
			int result = aService.deleteSingo(singoNo);
			if(result > 0) {
				mv.setViewName("redirect:/singo/list.do");
			} else {
				mv.addObject("msg", "신고 취소 실패");
				mv.addObject("url", "/singo/list.do");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "신고 취소가 완료되지 않았습니다.");
			mv.addObject("url", "/singo/list.do");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	public PageInfo getPageInfo(int totalCount,int currentPage) {
		PageInfo page =null;
		int recordCountPerPage = 10;
		int naviCountPerPage = 10;
		int naviTotalCount;
		int startNavi;
		int endNavi;
		naviTotalCount =(int)((double)totalCount/recordCountPerPage + 0.9);
		startNavi = (((int)((double)currentPage/naviCountPerPage+0.9))-1)*naviCountPerPage+1;
		endNavi = startNavi + naviCountPerPage - 1;
		//endNavi는 startNavi에 무조건 naviCountPerPage에 값을 더하므로 실제 최대값 보다 무조건 클 수 있다.
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		page = new PageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
				
		return page;
	}
	
	public com.alone.special.hobby.domain.PageInfo getPageInfoH(int totalCount,int currentPage) {
		com.alone.special.hobby.domain.PageInfo page =null;
		int recordCountPerPage = 10;
		int naviCountPerPage = 10;
		int naviTotalCount;
		int startNavi;
		int endNavi;
		naviTotalCount =(int)((double)totalCount/recordCountPerPage + 0.9);
		startNavi = (((int)((double)currentPage/naviCountPerPage+0.9))-1)*naviCountPerPage+1;
		endNavi = startNavi + naviCountPerPage - 1;
		//endNavi는 startNavi에 무조건 naviCountPerPage에 값을 더하므로 실제 최대값 보다 무조건 클 수 있다.
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		page = new com.alone.special.hobby.domain.PageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
				
		return page;
	}
	
	public ProductPageInfo getPageInfoS(int totalCount,int currentPage) {
		ProductPageInfo page =null;
		int recordCountPerPage = 10;
		int naviCountPerPage = 10;
		int naviTotalCount;
		int startNavi;
		int endNavi;
		naviTotalCount =(int)((double)totalCount/recordCountPerPage + 0.9);
		startNavi = (((int)((double)currentPage/naviCountPerPage+0.9))-1)*naviCountPerPage+1;
		endNavi = startNavi + naviCountPerPage - 1;
		//endNavi는 startNavi에 무조건 naviCountPerPage에 값을 더하므로 실제 최대값 보다 무조건 클 수 있다.
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		page = new ProductPageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
				
		return page;
	}
}

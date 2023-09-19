package com.alone.special.hobby.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.alone.special.hobby.domain.Board;
import com.alone.special.hobby.domain.Reply;
import com.alone.special.hobby.service.BoardService;
import com.alone.special.hobby.service.ReplyService;

@Controller
@RequestMapping("/hobby/reply")
public class ReplyController {

	@Autowired
	private ReplyService rService;
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public ModelAndView insertReply(ModelAndView mv
			, @ModelAttribute Reply reply
			, @RequestParam("category") String refCategoryName
			, HttpSession session) {
		
		String url = "";
		try {
//			String replyWriter = (String)session.getAttribute("memberId");		// 로그인 되어있는 아이디로 댓글 등록되게
//			reply.sethReplyWriter(replyWriter);
			int result = rService.insertReply(reply);
			
			Board board = new Board();
			board.setRefCategoryName(refCategoryName);
			String encodedCategory = URLEncoder.encode(board.getRefCategoryName(), "UTF-8");
			url = "/hobby/board/detail.do?category=" + encodedCategory + "&hBoardNo=" + reply.getRefBoardNo();
			
			if(result > 0) {
				int refBoardNo = reply.getRefBoardNo();
				int replyTotalCount = rService.getReplyCount(reply.getRefBoardNo());
				
				Map<String, Integer> replyCountInfo = new HashMap<>();
				
		        replyCountInfo.put("refBoardNo", refBoardNo);
		        replyCountInfo.put("replyTotalCount", replyTotalCount);
				
				result = bService.updateReplyNum(replyCountInfo);
				mv.setViewName("redirect:"+url);
			} else {
				mv.addObject("msg", "댓글 등록이 완료되지 않았습니다.");
				mv.addObject("error", "댓글 등록 실패");
				mv.addObject("url", url);
				mv.setViewName("common/errorPage");
			}
			
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);		// reply에서 가져온 외래키 boardNo 사용
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/update.do", method = RequestMethod.POST)
	public ModelAndView updateReply(ModelAndView mv
			, @ModelAttribute Reply reply
			, @RequestParam("category") String refCategoryName
			, HttpSession session) {

		String url = "";
		try {
//			String replyWriter = (String)session.getAttribute("memberId");
//			if(!replyWriter.equals("")) {
//				reply.sethReplyWriter(replyWriter);
			
				Board board = new Board();
				board.setRefCategoryName(refCategoryName);
				String encodedCategory = URLEncoder.encode(board.getRefCategoryName(), "UTF-8");
				url = "/hobby/board/detail.do?category=" + encodedCategory + "&hBoardNo=" + reply.getRefBoardNo();
				
				int result = rService.updateReply(reply);
				mv.setViewName("redirect:"+url);
//			} else {
//				mv.addObject("msg", "로그인이 완료되지 않았습니다.");
//				mv.addObject("error", "로그인 정보 확인 요망");
//				mv.addObject("url", "/index.jsp");
//				mv.setViewName("common/errorPage");
//			}
			
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);		// reply에서 가져온 외래키 boardNo 사용
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/delete.do", method = RequestMethod.GET)
	public ModelAndView deleteReply(ModelAndView mv
			, @ModelAttribute Reply reply
			, @RequestParam("category") String refCategoryName
			, HttpSession session) {
		String url = "";
		try {
//			String memberId = (String)session.getAttribute("memberId");
//			String replyWriter = reply.gethReplyWriter();
			
			Board board = new Board();
			board.setRefCategoryName(refCategoryName);
			String encodedCategory = URLEncoder.encode(board.getRefCategoryName(), "UTF-8");
			url = "/hobby/board/detail.do?category=" + encodedCategory + "&hBoardNo=" + reply.getRefBoardNo();
//			if(replyWriter != null && replyWriter.equals(memberId)) {	// 세션 아이디, 작성자 비교
				int result = rService.deleteReply(reply);
				if(result > 0) {
					mv.setViewName("redirect:"+url);
				} else {
					mv.addObject("msg", "댓글 삭제가 완료되지 않았습니다.");
					mv.addObject("error", "댓글 삭제 실패");
					mv.addObject("url", url);
					mv.setViewName("common/errorPage");
				}
//			} else {
//				mv.addObject("msg", "자신의 댓글만 삭제 가능합니다.");
//				mv.addObject("error", "댓글 삭제 불가");
//				mv.addObject("url", url);
//				mv.setViewName("common/errorPage");
//			}
				
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", url);
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
}

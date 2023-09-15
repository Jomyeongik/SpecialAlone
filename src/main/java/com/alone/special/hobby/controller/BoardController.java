package com.alone.special.hobby.controller;

import java.io.File;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alone.special.hobby.domain.Board;
import com.alone.special.hobby.domain.PageInfo;
import com.alone.special.hobby.service.BoardService;

@Controller
@RequestMapping("/hobby/board")
public class BoardController {

	@Autowired
	private BoardService bService;
	
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	private ModelAndView showBoardListForm(ModelAndView mv
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			, @RequestParam(value="category") String refCategoryName) {
		
		try {
			Integer totalCount = bService.getListCount(refCategoryName);
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			
			Map<String, Object> getListMap = new HashMap<>();
			getListMap.put("refCategoryName", refCategoryName);
			getListMap.put("pInfo", pInfo);
	        
			List<Board> bList = bService.selectBoardList(getListMap);
//			if(!bList.isEmpty()) {
				mv.addObject("bList", bList);
				mv.addObject("pInfo", pInfo);
				mv.addObject("refCategoryName", refCategoryName);
				mv.setViewName("hobby/board");
//			} else {
//			}
		} catch (Exception e) {
		}
		mv.setViewName("hobby/board");
		return mv;
	}
	
	private PageInfo getPageInfo(Integer currentPage, int totalCount) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int naviTotalCount = (int)Math.ceil((double)totalCount/recordCountPerPage);
		int startNavi = (((int)((double)currentPage/naviCountPerPage+0.9))-1)*naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage - 1;
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		PageInfo pInfo = new PageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
		return pInfo;
	}
	
	@RequestMapping(value="/insert.do", method=RequestMethod.GET)
	public ModelAndView showInsertForm(ModelAndView mv
			, @RequestParam(value="category") String refCategoryName) {
		
		mv.addObject("refCategoryName", refCategoryName);
		mv.setViewName("hobby/insert");
		return mv;
	}
	
	@RequestMapping(value="insert.do", method=RequestMethod.POST)
	public ModelAndView insertBoard(ModelAndView mv
			, @ModelAttribute Board board
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, @RequestParam(value="category") String refCategoryName
			, @RequestParam("setTime") String setTime
			, HttpSession session
			, HttpServletRequest request) {
		
		try {
//			String boardWriter = (String)session.getAttribute("memberId");
//			if(boardWriter != null && !boardWriter.equals("")) {
//				board.sethBoardWriter(boardWriter);
				
				if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
					Map<String, Object> bMap = this.saveFile(request, uploadFile);				// long이 들어가서 object임
					board.sethBoardFilename((String)bMap.get("fileName"));
					board.sethBoardFilerename((String)bMap.get("fileRename"));
					board.sethBoardFilepath((String)bMap.get("filePath"));
					board.sethBoardFilelength((long)bMap.get("fileLength"));
				}
				
				if(setTime != null && !setTime.equals("")) {
					String dateTimeString = setTime.replace("T", " ");
					
					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
					LocalDateTime dateTime = LocalDateTime.parse(dateTimeString, formatter);
					Timestamp examDateTime = Timestamp.valueOf(dateTime);
					
					board.sethGroupTime(examDateTime);
				} else {
					board.sethGroupTime(null);
				}
				board.setRefCategoryName(refCategoryName);
				
				String encodedCategory = URLEncoder.encode(board.getRefCategoryName(), "UTF-8");
				String url = "hobby/board/list.do?category=" + encodedCategory;
				
				int result = bService.insertBoard(board);
				if(result > 0) {
					mv.setViewName("redirect:/"+url);
				} else {
					mv.addObject("msg", "게시글 등록 권한이 없습니다.");
					mv.addObject("error", "로그인이 필요합니다.");
					mv.addObject("url", "/index.jsp");
					mv.setViewName("common/errorPage");
				}
//			} else {
//			}
			
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "게시글 등록이 완료되지 않았습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "hobby/board/insert.do");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	public Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception {
		Map<String, Object> fileMap = new HashMap<String, Object>();
		String root = request.getSession().getServletContext().getRealPath("resources");	// 파일 넣을 resources 경로
		String savePath = root + "//hbuploadFiles";											// 파일 저장 경로
		String fileName = uploadFile.getOriginalFilename();
		String extension = fileName.substring(fileName.lastIndexOf(".")+1);					// 확장자 가져오기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");						// 시간 가져오기
		String fileRename = sdf.format(new Date(System.currentTimeMillis()))+"."+extension;	// 시간 형식 바꾸꿔서 리네임에 넣기
		File saveFolder = new File(savePath);												// 저장할 파일 있나 확인하고 없으면 생성
		if(!saveFolder.exists()) {
			saveFolder.mkdir();
		}
		File saveFile = new File(savePath+"//"+fileRename);									// 파일 저장
		uploadFile.transferTo(saveFile);
		long fileLength = uploadFile.getSize();
		
		fileMap.put("fileName", fileName);													// 해쉬맵에 넣어주기
		fileMap.put("fileRename", fileRename);
		fileMap.put("filePath", "../resources/hbuploadFiles/"+fileRename);
		fileMap.put("fileLength", fileLength);
		
		return fileMap;
	}
	
	@RequestMapping(value="/update.do", method = RequestMethod.GET)
	public ModelAndView showUpdateForm(ModelAndView mv
			, @RequestParam("hBoardNo") Integer boardNo
			, @RequestParam("category") String refCategoryName) {
		
		try {
			Board board = bService.selectBoardByNo(boardNo);
			mv.addObject("board", board);
			mv.addObject("refCategoryName", refCategoryName);
			mv.setViewName("hobby/update");
			
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/index.jsp");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/board/update.kh", method = RequestMethod.POST)
	public ModelAndView boardUpdate(ModelAndView mv
			, @ModelAttribute Board board
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, @RequestParam("setTime") String setTime
			, HttpSession session
			, HttpServletRequest request) {
		
		try {
//			String memberId = (String)session.getAttribute("memberId");
//			String boardWriter = board.getBoardWriter();
//			if(boardWriter != null & boardWriter.equals(memberId)) {
				if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
					String fileRename = board.gethBoardFilerename();
					if(fileRename != null) {
						this.deleteFile(fileRename, request);
					}
					Map<String, Object> bFileMap = this.saveFile(request, uploadFile);
					board.sethBoardFilename((String)bFileMap.get("fileName"));
					board.sethBoardFilerename((String)bFileMap.get("fileRename"));
					board.sethBoardFilepath((String)bFileMap.get("filePath"));
					board.sethBoardFilelength((long)bFileMap.get("fileLength"));
				}
				
				if(setTime != null && !setTime.equals("")) {
					String dateTimeString = setTime.replace("T", " ");
					
					DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
					LocalDateTime dateTime = LocalDateTime.parse(dateTimeString, formatter);
					Timestamp examDateTime = Timestamp.valueOf(dateTime);
					
					board.sethGroupTime(examDateTime);
				} else {
					board.sethGroupTime(null);
				}
				
				String encodedCategory = URLEncoder.encode(board.getRefCategoryName(), "UTF-8");
				String url = "hobby/board/detail.do?category=" + encodedCategory + "&hBoardNo=" + board.gethBoardNo();
				
				int result = bService.updateBoard(board);
				if(result > 0) {
					mv.setViewName("redirect:/"+url);
				} else {
					mv.addObject("msg", "게시글 수정이 완료되지 않았습니다.");
					mv.addObject("error", "게시글 수정 실패");
					mv.addObject("url", "/"+url);
					mv.setViewName("common/errorPage");
				}
//			} else {
//				mv.addObject("msg", "자신의 게시글만 삭제 가능합니다.");
//				mv.addObject("error", "게시글 삭제 불가");
//				mv.addObject("url", "/board/update.kh?boardNo="+board.getBoardNo());
//				mv.setViewName("common/errorPage");
//			}
			
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의하세요.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/hobby/board/update.do?boardNo="+board.gethBoardNo());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	private void deleteFile(String fileRename, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delPath = root + "//buploadFiles//" + fileRename;
		File delFile = new File(delPath);
		if(delFile.exists()) {
			delFile.delete();
		}
	}
	
	@RequestMapping(value="/delete.do", method = RequestMethod.GET)
	public ModelAndView deleteBoard(ModelAndView mv
			, @ModelAttribute Board board
			, HttpSession session) {
		String url = "";
		try {
//			String memberId = (String)session.getAttribute("memberId");
//			String boardWriter = board.getBoardWriter();
			url = "/hobby/board/list.do?category="+board.getRefCategoryName();
//			if(boardWriter != null && boardWriter.equals(memberId)) {	// 세션 아이디, 작성자 비교
				int result = bService.deleteBoard(board);
				if(result > 0) {
					mv.setViewName("redirect:"+url);
				} else {
					mv.addObject("msg", "게시글 삭제가 완료되지 않았습니다.");
					mv.addObject("error", "게시글 삭제 실패");
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
	
	@RequestMapping(value="/detail.do", method=RequestMethod.GET)
	public ModelAndView showBoardDetail(ModelAndView mv
			, @RequestParam("hBoardNo") Integer hBoardNo
			, @RequestParam("category") String refCategoryName ) {
		
		try {
			Board boardOne = bService.selectBoardByNo(hBoardNo);
			if(boardOne != null) {
//				List<Reply> replyList = rService.selectReplyList(boardNo);
//				if(replyList.size() > 0) {
//					mv.addObject("rList", replyList);
//				}
				mv.addObject("board", boardOne);
				mv.addObject("refCategoryName", refCategoryName);
				mv.setViewName("hobby/detail");
			} else {
				mv.addObject("msg", "게시글 조회가 완료되지 않았습니다.");
				mv.addObject("error", "게시글 상세조회 실패");
				mv.addObject("url", "/hobby/board/list.do");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "게시글 조회가 완료되지 않았습니다.");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/hobby/board/list.do");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
}

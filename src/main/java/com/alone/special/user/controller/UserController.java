package com.alone.special.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.alone.special.user.domain.User;
import com.alone.special.user.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService service;
	
	// 회원가입 페이지
	@RequestMapping(value="/user/register.do", method=RequestMethod.GET)
	public ModelAndView registerForm(ModelAndView mv) {
		mv.setViewName("user/register");
		return mv;
	}
	// 회원가입
	@RequestMapping(value="/user/register.do", method=RequestMethod.POST)
	public ModelAndView registerUser(ModelAndView mv, @ModelAttribute User user) {
		try {
			int result = service.insertUser(user);
			if(result > 0) {
				// 성공
				mv.setViewName("redirect:/index.jsp");
			}else {
				mv.addObject("msg", "회원가입 실패");
				mv.addObject("error", "회원가입 실패");
				mv.addObject("url", "/user/register.do");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의 바랍니다");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/user/register.do");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	// 회원정보 페이지
	@RequestMapping(value="/user/mypage.do", method=RequestMethod.GET)
	public ModelAndView mypageForm(ModelAndView mv, @RequestParam("userNo") Integer userNo) {
		try {
			User user = service.selectUserByNo(userNo);
			mv.addObject("user", user);
			mv.setViewName("user/mypage");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return mv;
	}
	
	
//	// 회원정보 페이지
//	@RequestMapping(value="/user/mypage.do", method=RequestMethod.GET)
//	public ModelAndView mypageFor(ModelAndView mv,@ModelAttribute User user) {
//		mv.setViewName("user/mypage");
//		return mv;
//	}
	
	// 회원정보 업데이트
	@RequestMapping(value="/user/mypage.do", method=RequestMethod.POST)
	public ModelAndView modifyUser(ModelAndView mv, @ModelAttribute User user) {
		try {
			int result = service.updateUser(user);
			if(result > 0) {
				// 성공
				mv.setViewName("redirect:/mypage.jsp");
			}else {
				// 실패
				mv.addObject("msg", "회원정보 수정 실패");
				mv.addObject("error", "회원정보 수정 실패");
				mv.addObject("url", "/user/update.do");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의 바랍니다");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/user/update.do");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	// 회원로그인 페이지
	@RequestMapping(value="/user/login.do", method=RequestMethod.GET)
	public ModelAndView loginForm(ModelAndView mv) {
		// 로그인 페이지 이동
		mv.setViewName("user/login");
		return mv;
	}
	// 회원로그인
	@RequestMapping(value="/user/login.do", method=RequestMethod.POST)
	public ModelAndView loginUser(ModelAndView mv, @ModelAttribute User user, HttpSession session) {
		try {
			int result = service.loginUser(user);
			if(result > 0) {
				// 성공
				session.setAttribute("userId", user.getUserId());
				mv.setViewName("redirect:/index.jsp");
			}else {
				// 실패
				mv.addObject("msg", "로그인 실패");
				mv.addObject("error", "로그인 실패");
				mv.addObject("url", "/user/register.do");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "관리자에게 문의 바랍니다");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/user/index.jsp");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
}

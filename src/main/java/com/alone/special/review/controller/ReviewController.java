package com.alone.special.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alone.special.review.domain.Review;
import com.alone.special.review.service.ReviewService;

@Controller
@RequestMapping(value="/review")
public class ReviewController {
	@Autowired
	private ReviewService reviewservice;

	
	@RequestMapping(value="/insertReview.do",method=RequestMethod.GET)
	public ModelAndView inserReview (ModelAndView mv) {
		
		mv.setViewName("sProduct/sdetail");
		return mv;
	}
	@RequestMapping(value="/inserReview.do",method=RequestMethod.POST)
	public ModelAndView insertReviewPost(ModelAndView mv) {
		
		return mv;
	}
	
	
	  @GetMapping("/singo.do")
	    public ModelAndView showSingoPage(ModelAndView mv,@RequestParam("sReviewId") String sReviewId) {
		  	Review rv = reviewservice.selectOne(sReviewId);
		  	mv.addObject("rv",rv).setViewName("sProduct/singo");
		  	return mv;
	    }
	
	
	    @PostMapping("/likeComment")
	    @ResponseBody
	    public int likeComment(@RequestParam String commentId) {

	        return 0;
	    }
	}


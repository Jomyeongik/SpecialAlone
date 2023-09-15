package com.alone.special.hobby.controller;

import java.io.File;
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

import com.alone.special.hobby.domain.Category;
import com.alone.special.hobby.service.CategoryService;

@Controller
@RequestMapping("/hobby/category")
public class CategoryController {
	
	@Autowired
	private CategoryService cService;
	
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public ModelAndView showCategoryListForm(ModelAndView mv) {
		
		List<Category> cList = cService.selectAllCategoryList();
		
		if(!cList.isEmpty()) {
			mv.addObject("cList", cList);
		} else {
			
		}
		mv.setViewName("hobby/category");
		return mv;
	}
	
	@RequestMapping(value="/searchByTag.do", method=RequestMethod.GET)
	public ModelAndView searchByTag(ModelAndView mv
			, @RequestParam("searchCondition") String searchCondition) {
		
		List<Category> tagList = cService.selectByTag(searchCondition);
		
		if(!tagList.isEmpty()) {
			mv.addObject("tagList", tagList);
			mv.addObject("searchCondition", searchCondition);
			mv.setViewName("hobby/category-searchByTag");
		}
		mv.setViewName("hobby/category-searchByTag");
		return mv;
	}
	
	@RequestMapping(value="/searchByKeyword.do", method=RequestMethod.GET)
	public ModelAndView searchByKeyword(ModelAndView mv
			, @RequestParam("searchKeyword") String searchKeyword) {
		
		List<Category> keyList = cService.searchByKeyword(searchKeyword);
		
		if(!keyList.isEmpty()) {
			mv.addObject("tagList", keyList);
			mv.addObject("searchCondition", searchKeyword);
			mv.setViewName("hobby/category-searchByTag");
		}
		mv.setViewName("hobby/category-searchByTag");
		return mv;
	}
	
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public ModelAndView insertCategoryList(ModelAndView mv
			, @ModelAttribute Category category
			, @RequestParam(value="uploadFile") MultipartFile uploadFile
			, HttpServletRequest request
			, HttpSession session) {
		
		try {
			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
				Map<String, Object> infoMap = this.saveFile(uploadFile, request);
				String hCategoryFilename = (String)infoMap.get("fileName");
				String hCategoryFilepath = (String)infoMap.get("filePath");
				long hCategoryFilelength = (long)infoMap.get("fileLength");
				
				category.sethCategoryFilename(hCategoryFilename);
				category.sethCategoryFilepath(hCategoryFilepath);
				category.sethCategoryFilelength(hCategoryFilelength);
			}
			int result = cService.insertCategory(category);
			if(result > 0) {
				mv.setViewName("redirect:/hobby/category/list.do");
			} else {
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return mv;
	}
	
	public Map<String, Object> saveFile(MultipartFile uploadFile, HttpServletRequest request) throws Exception {
		Map<String, Object> infoMap = new HashMap<String, Object>();
		
		String fileName = uploadFile.getOriginalFilename();
		String root = request.getSession().getServletContext().getRealPath("resources/hobby");
		String saveFolder = root + "//hUploadFiles";
		File folder = new File(saveFolder);
		if(!folder.exists()) {
			folder.mkdir();
		}
		String savePath = saveFolder + "//" + fileName;
		File file = new File(savePath);
		uploadFile.transferTo(file);
		long fileLength = uploadFile.getSize();
	
		infoMap.put("fileName", fileName);
		infoMap.put("filePath", savePath);
		infoMap.put("fileLength", fileLength);
		
		return infoMap;
	}
	
}

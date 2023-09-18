package com.alone.special.foodProduct.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

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

import com.alone.special.foodProduct.domain.FoodProduct;
import com.alone.special.foodProduct.domain.FoodProductFile;
import com.alone.special.foodProduct.service.FoodProductService;


@Controller
public class FoodProductController {

	@Autowired
	private FoodProductService FPService;
	
	@RequestMapping(value="/foodProduct/register.do", method=RequestMethod.GET)
	public ModelAndView showRegisterForm(ModelAndView mv) {		
		// 추천상품 정보등록 페이지 DD이동
		mv.setViewName("food/foodRecommend/productReg");
		return mv;
	}

	@RequestMapping(value="/foodProduct/fileregister.do", method=RequestMethod.GET)
	public ModelAndView showFileRegisterForm(ModelAndView mv) {		
		// 추천상품 파일등록 페이지 이동
		mv.setViewName("food/foodRecommend/productFileReg");
		return mv;
	}
	
	@RequestMapping(value="/foodProduct/register.do", method=RequestMethod.POST)
	public ModelAndView productInfoRegister(ModelAndView mv
			,@ModelAttribute FoodProduct fProduct
			,HttpSession session
			,HttpServletRequest request) {
		int result = FPService.insertProductInfo(fProduct);
		try {
			if(result>0) {
				//성공
				System.out.println(fProduct.toString());
				mv.setViewName("redirect:/foodProduct/fileregister.do");
			}else {
				//실패
				mv.addObject("msg", "게시글 등록이 완료되지 않았습니다");
				mv.addObject("error", "게시글 등록 실패");
				mv.addObject("url", "");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			// 에러처리
			mv.addObject("msg", "게시글 등록이 완료되지 않았습니다");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/foodProduct/register.do");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/foodProduct/fileregister.do", method=RequestMethod.POST)
	public ModelAndView productFileRegister(ModelAndView mv
			,@ModelAttribute FoodProduct fProduct
			,@RequestParam(value="imagename1", required=false) MultipartFile image1
			,@RequestParam(value="imagename2", required=false) MultipartFile image2
			,@RequestParam(value="imagename3", required=false) MultipartFile image3
			,HttpServletRequest request
			,HttpSession session) {
		try {
			int refFProductId = (int)session.getAttribute("generatedProductId");
			// 이미지 3개가 값이 들어갔으면
	        List<FoodProductFile> fList = new ArrayList<>();
			if(image1 != null && !image1.getOriginalFilename().equals("")
					&& image2 != null && !image2.getOriginalFilename().equals("")
					&& image3 != null && !image3.getOriginalFilename().equals("")) {
				Map<String,Object> fMap1 = this.saveFile(request, image1);
				Map<String,Object> fMap2 = this.saveFile(request, image2);
				Map<String,Object> fMap3 = this.saveFile(request, image3);
				
				for (int i = 1; i <= 3; i++) {
				    FoodProductFile fProductFile = new FoodProductFile();
				    fProductFile.setRefFProductId(refFProductId); // 연관 상품 ID 설정
				    fProductFile.setfProductFileorder(i); // 파일 순서 설정
				    
				    // 각 이미지에 따라 파일 정보 설정
				    if (i == 1) {
				        fProductFile.setfProductFilename((String) fMap1.get("fileName"));
				        fProductFile.setfProductFilerename((String) fMap1.get("fileRename"));
				        fProductFile.setfProductFilepath((String) fMap1.get("filePath"));
				    } else if (i == 2) {
				        fProductFile.setfProductFilename((String) fMap2.get("fileName"));
				        fProductFile.setfProductFilerename((String) fMap2.get("fileRename"));
				        fProductFile.setfProductFilepath((String) fMap2.get("filePath"));
				    } else if (i == 3) {
				        fProductFile.setfProductFilename((String) fMap3.get("fileName"));
				        fProductFile.setfProductFilerename((String) fMap3.get("fileRename"));
				        fProductFile.setfProductFilepath((String) fMap3.get("filePath"));
				    }
				    
				    fList.add(fProductFile);
				}
			}
	        int result = FPService.insertProductFiles(fList);
			
			if(result == 3) {
				// 리스트로 이동 해야함
				mv.setViewName("redirect:/foodProduct/register.do");
			}else {
				// 에러페이지
				mv.addObject("msg", "파일등록이 완료되지 않았습니다");
				mv.addObject("error", "게시글 등록 실패");
				mv.addObject("url", "/foodProduct/fileregister.do");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", "게시글 등록이 완료되지 않았습니다");
			mv.addObject("error", e.getMessage());
			mv.addObject("url", "/foodProduct/fileregister.do");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	

	
	public Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception{
		Map<String, Object> fileMap = new HashMap<String, Object>();
		// resources 경로 구하기
		String root = request.getSession().getServletContext().getRealPath("/resources");
		// 파일 저장 경로 구하기
		String savePath = root + "\\fuploadFiles";
		// 파일 이름 구하기
		String fileName = uploadFile.getOriginalFilename();
		// 파일 확장자 구하기
		String extension = fileName.substring(fileName.lastIndexOf(".")+1);
		// 시간으로 파일 리네임하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String fileRename = sdf.format(new Date(System.currentTimeMillis()))+ getRandomString()+"."+extension;
		// 파일 저장 전 폴더 만들기
		File saveFolder = new File(savePath);
		if(!saveFolder.exists()) {
			saveFolder.mkdir();
		}
		// 파일 저장
		File saveFile = new File(savePath+"\\"+fileRename);
		uploadFile.transferTo(saveFile);
		long fileLength = uploadFile.getSize();
		// 파일 정보 리턴
		fileMap.put("fileName", fileName);
		fileMap.put("fileRename", fileRename);
		fileMap.put("filePath", "../resources/fuploadFiles/"+fileRename);
		fileMap.put("fileLength", fileLength);
		return fileMap;
	}
	
	private String getRandomString() {
	    String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
	    StringBuilder randomString = new StringBuilder();
	    int length = 5; // 원하는 길이로 변경
	    Random random = new Random();
	    for (int i = 0; i < length; i++) {
	        randomString.append(characters.charAt(random.nextInt(characters.length())));
	    }
	    return randomString.toString();
	}
}


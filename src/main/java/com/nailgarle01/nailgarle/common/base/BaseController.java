package com.nailgarle01.nailgarle.common.base;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.nailgarle01.nailgarle.board.vo.ReviewImageVO;
import com.nailgarle01.nailgarle.goods.vo.ImageFileVO;


public abstract class BaseController {
	

	private static final String CURR_IMAGE_REPO_PATH = "C:\\nailgarle\\file_repo";
	
	@RequestMapping(value = "/*.do", method = { RequestMethod.POST, RequestMethod.GET })
	protected ModelAndView viewForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	

	protected List<ImageFileVO> upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		List<ImageFileVO> fileList = new ArrayList<ImageFileVO>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		UUID uuid = UUID.randomUUID();
		while (fileNames.hasNext()) {
			ImageFileVO imageFileVO = new ImageFileVO();
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			if(originalFileName!="") {
				imageFileVO.setFileType(fileName);
				imageFileVO.setFileName(uuid+originalFileName);
				fileList.add(imageFileVO);
			
				File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
				if (mFile.getSize() != 0) { // File Null Check
					if (!file.exists()) { // ???????????? ????????? ???????????? ?????? ??????
						if (file.getParentFile().mkdirs()) { // ????????? ???????????? ?????????????????? ??????
							file.createNewFile(); // ?????? ?????? ??????
						}
					}
					mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" +uuid+originalFileName)); // ????????? ?????????
																												// multipartFile???
																												// ?????? ????????? ??????
				}
			}
		}
		return fileList;
	}

	protected List<ReviewImageVO> reviewUpload(MultipartHttpServletRequest multipartRequest) throws Exception {
		List<ReviewImageVO> fileList = new ArrayList<ReviewImageVO>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		UUID uuid = UUID.randomUUID();
		while (fileNames.hasNext()) {
			ReviewImageVO reviewimageVO = new ReviewImageVO();
			String fileName = fileNames.next();
			reviewimageVO.setRe_fileName(fileName);
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = uuid.toString() + "_" + mFile.getOriginalFilename();
			reviewimageVO.setRe_fileName(originalFileName);
			fileList.add(reviewimageVO);

			File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
			if (mFile.getSize() != 0) { // File Null Check
				if (!file.exists()) { // ???????????? ????????? ???????????? ?????? ??????
					if (file.getParentFile().mkdirs()) { // ????????? ???????????? ?????????????????? ??????
						file.createNewFile(); // ?????? ?????? ??????
					}
				}
				mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + originalFileName)); // ????????? ?????????

			}
		}
		return fileList;
	}
	
	private void deleteFile(String fileName) {
		File file = new File(CURR_IMAGE_REPO_PATH + "\\" + fileName);
		try {
			file.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void deleteReviewFile(String re_fileName, @RequestParam("productNum") String productNum) {
		File file = new File(CURR_IMAGE_REPO_PATH + "\\" + "review_image" + "\\" + productNum + "\\" + re_fileName);
		try {
			file.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
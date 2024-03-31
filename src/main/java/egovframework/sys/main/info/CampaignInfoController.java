package egovframework.sys.main.info;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import egovframework.sys.cmm.util.PagingVO;
import egovframework.sys.main.MainService;
import egovframework.sys.main.mentor.CampaignMentorService;
import egovframework.sys.sec.handler.SundoUserDetails;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.omg.CORBA_2_3.portable.InputStream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class CampaignInfoController {
	private static final Logger logger = LoggerFactory.getLogger(CampaignInfoController.class);
	
	@Resource(name = "campaignInfo")
	private CampaignInfoService campaignInfoService;
	
	@Resource(name = "mainService")
	private MainService mainService;
    
	@Resource(name = "campaignMentor")
	private CampaignMentorService campaignMentorService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	// 다운대상 파일경로
	String filePath = "C:\\upload\\campaign\\file\\";
	/*String filePath = "D:\\";*/
	// 압축대상 파일 경로
	String filesPath = filePath;
	String imgPath = "C:\\upload\\campaign\\img\\";
	
	   @RequestMapping(value = "/main/info.do", method = RequestMethod.GET)
	   @ResponseBody
	   public ModelAndView CampaignGetInfo(ModelAndView mv, HttpServletRequest req) throws Exception {
//	     /main/info.do랑 /main/info/ajax/campaignInfoList.do 통합할 것
//	     search페이지에서 캠페인 카드 누르면 이 함수로 campaignId라는 파라미터 이름으로 캠페인 id값이 날라옴
	     mv.setViewName("home/info");
	      
	      Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	      SundoUserDetails userDetails = (SundoUserDetails) authentication.getDetails();
	      EgovMap params = this.paramMap(req);
	      
	      //알람개수
	      params.put("uId", userDetails.getUser_id());
	      int alarmCount = this.mainService.selectUserAlarmCountByHeader(params);
	      
	      mv.addObject("alarmCount", alarmCount);
	      
	      String auth = userDetails.getAuthority();
	      String userId = userDetails.getUser_id();
	      String userName = userDetails.getUser_nm();
	      params.put("uId", userId);
	      params.put("uNm", userName);
	      
	      List<EgovMap> userInfo = this.campaignInfoService.selectUserPkId(params);
		  params.put("cId", req.getParameter("campaignId"));
	      //params.put("cId", 271);
		  params.put("id", userInfo.get(0).get("id"));

		  if(auth.equals("A")) {
	    	  EgovMap createrCheck = this.campaignInfoService.selectCreaterCheck(params);
	    	  
	    	  if(createrCheck.get("exists").toString().equals("true")) {
	    		  mv.addObject("createrCheck", 1);
	    	  } else {
	    		  mv.addObject("createrCheck", 0);
	    		  
	    		  EgovMap applyCheck = this.campaignInfoService.selectCampaignApply(params);
	    	      
	    	      if(Integer.parseInt(applyCheck.get("count").toString()) == 0) {
	    	    	  mv.addObject("applyCheck", 0);
	    	      } else {
	    	    	  EgovMap applyInfo = this.campaignInfoService.selectApplyInfo(params);
	    	    	  int applyStatus = Integer.parseInt(applyInfo.get("status").toString());
	    	    	  
	    	    	  mv.addObject("applyStatus", applyStatus);
	    	    	  mv.addObject("applyCheck", 1);
	    	      }
	    	  }
	      } else {
	    	  params.put("createrCheck", 0);
	    	  EgovMap applyCheck = this.campaignInfoService.selectCampaignApply(params);

		      if(Integer.parseInt(applyCheck.get("count").toString()) == 0) {
		    	  mv.addObject("applyCheck", 0);
		      } else {
		    	  EgovMap applyInfo = this.campaignInfoService.selectApplyInfo(params);

		    	  int applyStatus = Integer.parseInt(applyInfo.get("status").toString());
		    	  mv.addObject("applyStatus", applyStatus);
		    	  mv.addObject("applyCheck", 1);
		      }
	      }
		  
	      String CSRF = UUID.randomUUID().toString();
	      
	      // 파라미터 이름은 campaignId로 캠페인 id가 날라옴, 이걸로 db에 날려서 캠페인 정보, 한 캠페인에 여러개인것들은 따로 받으셈(일정, 카테고리 등등)
	      // 해서 mv에 addObject해주고 첫번째 인자이름이 cId면 jsp에서 ${cId} 이런식으로 사용가능, infoList같은 경우는  ${infoList.cNm} 이런식
	      //System.out.println(req.getParameter("campaignId"));
	      
	      mv.addObject("cId", req.getParameter("campaignId"));
	      //mv.addObject("cId", "271");  
	      mv.addObject("auth", auth);
	      mv.addObject("userId", userId);
	      mv.addObject("CSRF_TOKEN", CSRF);
	      	      
	      return mv;
	    }
	
	   
	@RequestMapping(value = "/main/info/ajax/campaignInfoList.do", method = RequestMethod.GET)
	public ModelAndView campaignList(ModelAndView mv, HttpServletRequest req, HttpServletResponse res) throws Exception {
		mv.setViewName("jsonView");
		
		EgovMap params = this.paramMap(req);
		
		List<EgovMap> infoList = this.campaignInfoService.campaignInfo(params);
		
		mv.addObject("infoList", infoList);
		
		System.out.println(infoList);
		params.put("mentorEmail", infoList.get(0).get("uId"));
		
		EgovMap mentorId = this.campaignInfoService.selectMentorId(params);
		params.put("mentorId", mentorId.get("id"));
		mv.addObject("mentorPkId", mentorId.get("id"));
		  
		  EgovMap reviewCheck = this.campaignInfoService.selectReviewExistCheck(params);
		  
		  if(reviewCheck.get("exists").toString() == "true") {
			  mv.addObject("reviewCheck", 1);
			  EgovMap reviewAverage = this.campaignInfoService.selectReviewAverage(params);
			  mv.addObject("reviewAverage", reviewAverage.get("round"));
		  } else {
			  mv.addObject("reviewCheck", 0);
		  }
				
		return mv;
	}
	
	@RequestMapping(value = "/main/info/ajax/campaignApply.do", method = RequestMethod.GET)
	public ModelAndView campaignApply(ModelAndView mv, HttpServletRequest req, HttpServletResponse res) throws Exception {
		mv.setViewName("jsonView");

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		SundoUserDetails userDetails = (SundoUserDetails) authentication.getDetails();
		EgovMap params = this.paramMap(req);
		
		String auth = userDetails.getAuthority();
        String userId = userDetails.getUser_id();
        String userName = userDetails.getUser_nm();
		params.put("uId", userId);
		params.put("uNm", userName);
		
		List<EgovMap> userInfo = this.campaignInfoService.selectUserPkId(params);
		params.put("id", userInfo.get(0).get("id"));
		params.put("userCredit", userInfo.get(0).get("uBalance"));
		params.put("status", "1");
		
		int userCredit = Integer.parseInt(params.get("userCredit").toString());
		int estimate = Integer.parseInt(params.get("estimate").toString());

		
		if(userCredit < estimate) {
			mv.addObject("creditCheck", false);
			return mv;
		} else {
			int newCredit = userCredit - estimate;
			params.put("newCredit", newCredit);
			
			this.campaignInfoService.insertCampaignApply(params);
			this.campaignInfoService.updateUserCredit(params);
			this.campaignInfoService.insertCreditHistory(params);
			
			mv.addObject("creditCheck", true);
			return mv;
		}
	}
	
	@RequestMapping(value = "/main/info/ajax/campaignCancel.do", method = RequestMethod.GET)
	public ModelAndView campaignCancel(ModelAndView mv, HttpServletRequest req, HttpServletResponse res) throws Exception {
		mv.setViewName("jsonView");

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		SundoUserDetails userDetails = (SundoUserDetails) authentication.getDetails();
		EgovMap params = this.paramMap(req);
		
		String auth = userDetails.getAuthority();
        String userId = userDetails.getUser_id();
        String userName = userDetails.getUser_nm();
		params.put("uId", userId);
		params.put("uNm", userName);
		
		List<EgovMap> userInfo = this.campaignInfoService.selectUserPkId(params);
		params.put("id", userInfo.get(0).get("id"));
		params.put("userCredit", userInfo.get(0).get("uBalance"));
		params.put("status", "1");
		
		int userCredit = Integer.parseInt(params.get("userCredit").toString());
		int estimate = Integer.parseInt(params.get("estimate").toString());

		int newCredit = userCredit + estimate;
		params.put("newCredit", newCredit);
		
		this.campaignInfoService.deleteCampaignApply(params);
		this.campaignInfoService.updateUserCredit(params);
		this.campaignInfoService.insertCreditHistory(params);
		
		return mv;
	}
	
	@RequestMapping(value = "/main/download/ajax/imageDownload.do", method = RequestMethod.GET)
	public ModelAndView imageFileDown(ModelAndView mv, HttpServletRequest req, HttpServletResponse res) throws Exception {
		mv.setViewName("jsonView");
		
		EgovMap params = this.paramMap(req);

		List<EgovMap> infoList = this.campaignInfoService.campaignImageInfo(params);
		
		mv.addObject("imageInfolist", infoList);

		return mv;
	}
	
	@RequestMapping(value = "/main/download/ajax/download.do", method = RequestMethod.GET)
	public void fileDown(HttpServletRequest req, HttpServletResponse res, ModelAndView mv) throws Exception {
		
			// 다운로드 받을 파일명
			String fileName = req.getParameter("fileSvrName");
			
			res.setContentType("application/octet-stream");
			res.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(fileName, "UTF-8")+"\";");
			File file = new File(filePath, fileName);
			FileInputStream inputStream = null;
			
			try {
				inputStream = new FileInputStream(file);
				IOUtils.copy(inputStream, res.getOutputStream());
				res.flushBuffer();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					inputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
	}
	
	
	@RequestMapping(value = "/main/alldownload/ajax/alldownload.do", method = RequestMethod.GET)
	public void allFileDown(HttpServletRequest req, HttpServletResponse res, ModelAndView mv) throws Exception {
						
		try {
			// 다운로드 받을 파일들 이름
			String[] fileArr = req.getParameterValues("fileArr");
			// 압축대상 파일 경로
//			String filesPath = "C:\\upload\\";
//			String filesPath = "D:\\";
			
			// 압축대상 파일 경로 객체 생성
			File filesDir = new File(filesPath);
			
			if(!filesDir.exists()) {
				throw new Exception("해당 경로가 없음");
			}
			
			String zipFileTmpDir = "C:\\Temp";
			String zipFileName = "files.zip";
			String zipFileFullName = zipFileTmpDir + File.separator + zipFileName;
			File zipFile = new File(zipFileFullName);
			ZipOutputStream zOut = new ZipOutputStream(new FileOutputStream(zipFileFullName));
			
			for(int i=0; i<fileArr.length; i++) {
				zOut.putNextEntry(new ZipEntry(fileArr[i]));
				
				File file = new File(filesDir, fileArr[i]);
				FileInputStream inputStream = new FileInputStream(file);
				byte[] buffer = new byte[1024];
				int readLen = 0;
				
				while((readLen = inputStream.read(buffer)) > 0) {
					zOut.write(buffer, 0, readLen);
				}
				
				zOut.closeEntry();
				inputStream.close();
			}
			
			zOut.close();
			
			FileInputStream is = new FileInputStream(zipFile);
			OutputStream os = res.getOutputStream();
			String downloadFileName = URLEncoder.encode(zipFileName, "UTF-8");
			res.setHeader("Content-Disposition", "attachment; filename=\"" + downloadFileName + "\";");
			res.setHeader("Content-Transfer-Encoding", "binary");
			FileCopyUtils.copy(is, os);
			
			is.close();
			zipFile.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	/*
	@RequestMapping(value = "/ajax/useAreaList.do", method = RequestMethod.GET)
	public ModelAndView selectuseAreaList(HttpServletRequest req, HttpServletResponse res, ModelAndView mv) throws Exception {
		mv.setViewName("jsonView");
		
		EgovMap params = this.paramMap(req);
		
		List<EgovMap> useAreaList = this.mainService.selectuseAreaList();
		mv.addObject("useAreaList", useAreaList);
		
		return mv;
	}*/

	private EgovMap paramMap(HttpServletRequest request){
		EgovMap paramMap = new EgovMap();
		Set keySet = request.getParameterMap().keySet();
		Iterator<?> iter = keySet.iterator();
		while(iter.hasNext()){
			String key = (String) iter.next();
			paramMap.put(key, request.getParameter(key));
			logger.info("request.getParameter(\""+key+"\", \""+request.getParameter(key)+"\")");
		}
		return paramMap;
	}

}

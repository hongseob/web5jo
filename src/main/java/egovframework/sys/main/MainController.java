package egovframework.sys.main;

import java.io.File;
import java.io.FileInputStream;
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

import egovframework.sys.cmm.util.PagingVO;
import egovframework.sys.main.MainService;
import egovframework.sys.sec.handler.SundoUserDetails;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springmodules.validation.commons.DefaultBeanValidator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@Autowired
	protected AuthenticationManager authenticationManager;

	@Resource(name = "mainService")
	private MainService mainService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;
	
	@RequestMapping(value = "/main/getBbsCategory.do", method = RequestMethod.GET)
	public ModelAndView getBbsCategory(HttpServletRequest req, ModelAndView mv) throws Exception {
		mv.setViewName("jsonView");
		
		EgovMap params = this.paramMap(req);
		
		List<EgovMap> categoryList = this.mainService.getBbsCategory(params);
		System.out.println(categoryList);
		mv.addObject("categoryList", categoryList);
		
		return mv;
	}
	
	@RequestMapping(value = "/main/getBbsNotice.do", method = RequestMethod.GET)
	public ModelAndView getBbsNotice(HttpServletRequest req, ModelAndView mv) throws Exception {
		mv.setViewName("jsonView");
		
		EgovMap params = this.paramMap(req);
		
		List<EgovMap> noticeList = this.mainService.getBbsNotice(params);
		mv.addObject("noticeList", noticeList);
		
		return mv;
	}
	
	@RequestMapping(value = "/main/getBbsNoticeInfo.do", method = RequestMethod.GET)
	public ModelAndView getBbsNoticeInfo(HttpServletRequest req, ModelAndView mv) throws Exception {
		mv.setViewName("jsonView");
		
		EgovMap params = this.paramMap(req);
		
		EgovMap noticeInfo = this.mainService.getBbsNoticeInfo(params);
		mv.addObject("noticeInfo", noticeInfo);
		
		return mv;
	}
	
	@RequestMapping(value = "/main/searchBbsNotice.do", method = RequestMethod.GET)
	public ModelAndView searchBbsNotice(HttpServletRequest req, ModelAndView mv) throws Exception {
		mv.setViewName("jsonView");
		
		EgovMap params = this.paramMap(req);
		
		List<EgovMap> searchList = this.mainService.searchBbsNotice(params);
		mv.addObject("searchList", searchList);
		
		return mv;
	}

	private EgovMap paramMap(HttpServletRequest request) {
		EgovMap paramMap = new EgovMap();
		Set keySet = request.getParameterMap().keySet();
		Iterator<?> iter = keySet.iterator();
		while (iter.hasNext()) {
			String key = (String) iter.next();
			paramMap.put(key, request.getParameter(key));
			logger.info("request.getParameter(\"" + key + "\", \"" + request.getParameter(key) + "\")");
		}
		return paramMap;
	}

}

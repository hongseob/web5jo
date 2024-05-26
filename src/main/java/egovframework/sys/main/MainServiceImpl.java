package egovframework.sys.main;

import java.util.List;

import egovframework.sys.cmm.util.MenuInfo;
import egovframework.sys.cmm.util.PagingVO;
import egovframework.sys.main.MainService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("mainService")
public class MainServiceImpl implements MainService {

	// TODO mybatis �ъ��
	@Resource(name = "mainDAO")
	private MainDAO mainDAO;

	@Override
	public List<EgovMap> getBbsCategory(EgovMap params) {
		return this.mainDAO.getBbsCategory(params);
	}
	
	@Override
	public List<EgovMap> getBbsNotice(EgovMap params) {
		return this.mainDAO.getBbsNotice(params);
	}
	
	@Override
	public EgovMap getBbsNoticeInfo(EgovMap params) {
		return this.mainDAO.getBbsNoticeInfo(params);
	}
	
	@Override
	public List<EgovMap> searchBbsNotice(EgovMap params) {
		return this.mainDAO.searchBbsNotice(params);
	}

}

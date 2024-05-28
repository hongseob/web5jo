package egovframework.sys.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.sys.cmm.util.MenuInfo;
import egovframework.sys.cmm.util.PagingVO;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

@Repository("mainDAO")
public class MainDAO extends EgovAbstractMapper {

	public List<EgovMap> getBbsCategory(EgovMap params) {
		return selectList("main.getBbsCategory", params);
	}
	
	public List<EgovMap> getBbsNotice(EgovMap params) {
		return selectList("main.getBbsNotice", params);
	}
	
	public EgovMap getBbsNoticeInfo(EgovMap params) {
		return selectOne("main.getBbsNoticeInfo", params);
	}
	
	public List<EgovMap> searchBbsNotice(EgovMap params) {
		return selectList("main.searchBbsNotice", params);
	}
	
	public void comuInfoSave(EgovMap params) {
		insert("main.comuInfoSave", params);
	}
	
	public List<EgovMap> getComuBbsList(EgovMap params) {
		return selectList("main.getComuBbsList", params);
	}
	
	public List<EgovMap> searchComuBbs(EgovMap params) {
		return selectList("main.searchComuBbs", params);
	}
	
}

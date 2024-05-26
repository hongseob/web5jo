package egovframework.sys.main;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.sys.cmm.util.MenuInfo;
import egovframework.sys.cmm.util.PagingVO;


public interface MainService {
    
    List<EgovMap> getBbsCategory(EgovMap params);
    
    List<EgovMap> getBbsNotice(EgovMap params);
    
    EgovMap getBbsNoticeInfo(EgovMap params);
    
    List<EgovMap> searchBbsNotice(EgovMap params);
    
}

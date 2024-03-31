package egovframework.sys.main.info;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface CampaignInfoService {
	
	public List<EgovMap> campaignInfo(EgovMap params);
	
	public List<EgovMap> campaignImageInfo(EgovMap params);
	
	public EgovMap selectCreaterCheck(EgovMap params);
	
	public EgovMap selectCampaignApply(EgovMap params);
	
	public void insertCampaignApply(EgovMap params);
	
	public void insertCreditHistory(EgovMap params);
	
	public void deleteCampaignApply(EgovMap params);
	
	public EgovMap selectApplyInfo(EgovMap params);
	
	public void updateUserCredit(EgovMap params);
	
	public List<EgovMap> selectUserPkId(EgovMap params);
	
	public EgovMap selectMentorId(EgovMap params);
	
	public EgovMap selectReviewExistCheck(EgovMap params);
	
	public EgovMap selectReviewAverage(EgovMap params);
}
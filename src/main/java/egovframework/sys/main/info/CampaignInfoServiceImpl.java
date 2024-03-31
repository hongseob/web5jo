package egovframework.sys.main.info;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.util.EgovMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("campaignInfo")
public class CampaignInfoServiceImpl implements CampaignInfoService {
	
	// TODO mybatis 사용
	@Resource(name = "campaignInfoDAO")
	private CampaignInfoDAO campaignInfoDAO;
	
	@Override
	public List<EgovMap> campaignInfo(EgovMap params) {
		return this.campaignInfoDAO.selectCampaignInfo(params);
	}
	
	@Override
	public List<EgovMap> campaignImageInfo(EgovMap params) {
		return this.campaignInfoDAO.selectCampaignFile(params);
	}
	
	@Override
	public EgovMap selectCreaterCheck(EgovMap params) {
		return this.campaignInfoDAO.selectCreaterCheck(params);
	}
	
	@Override
	public EgovMap selectCampaignApply(EgovMap params) {
		return this.campaignInfoDAO.selectCampaignApply(params);
	}
	
	@Override
	public void insertCampaignApply(EgovMap params) {
		this.campaignInfoDAO.insertCampaignApply(params);
	}
	
	@Override
	public void insertCreditHistory(EgovMap params) {
		this.campaignInfoDAO.insertCreditHistory(params);
	}
	
	@Override
	public void deleteCampaignApply(EgovMap params) {
		this.campaignInfoDAO.deleteCampaignApply(params);
	}
	
	@Override
	public EgovMap selectApplyInfo(EgovMap params) {
		return this.campaignInfoDAO.selectApplyInfo(params);
	}
	
	@Override
	public void updateUserCredit(EgovMap params) {
		this.campaignInfoDAO.updateUserCredit(params);
	}
	
	@Override
	public List<EgovMap> selectUserPkId(EgovMap params) {
		return this.campaignInfoDAO.selectUserPkId(params);
	}
	
	@Override
	public EgovMap selectMentorId(EgovMap params) {
		return this.campaignInfoDAO.selectMentorId(params);
	}
	
	@Override
	public EgovMap selectReviewExistCheck(EgovMap params) {
		return this.campaignInfoDAO.selectReviewExistCheck(params);
	}
	
	@Override
	public EgovMap selectReviewAverage(EgovMap params) {
		return this.campaignInfoDAO.selectReviewAverage(params);
	}
}
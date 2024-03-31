package egovframework.sys.main.info;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

import org.springframework.stereotype.Repository;

@Repository("campaignInfoDAO")
public class CampaignInfoDAO extends EgovAbstractMapper {
		
	public List<EgovMap> selectCampaignInfo(EgovMap params) {
		return selectList("campain.campaignInfo", params);
	}
	
	public List<EgovMap> selectCampaignFile(EgovMap params) {
		return selectList("campain.selectImg", params);
	}
	
	public EgovMap selectCreaterCheck(EgovMap params) {
		return selectOne("campain.selectCreaterCheck", params);
	}
	
	public EgovMap selectCampaignApply(EgovMap params) {
		return selectOne("campain.selectCampaignApply", params);
	}
	
	public void insertCampaignApply(EgovMap params) {
		insert("campain.insertCampaignApply", params);
	}
	
	public void insertCreditHistory(EgovMap params) {
		insert("Member.insertCreditHistory", params);
	}
	
	public void deleteCampaignApply(EgovMap params) {
		delete("campain.deleteCampaignApply", params);
	}
	
	public EgovMap selectApplyInfo(EgovMap params) {
		return selectOne("campain.selectApplyInfo", params);
	}
	
	public void updateUserCredit(EgovMap params) {
		update("Member.updateCreditBalance", params);
	}
	
	public List<EgovMap> selectUserPkId(EgovMap params) {
		return selectList("Member.selectUserPkId", params);
	}
	
	public EgovMap selectMentorId(EgovMap params) {
		return selectOne("Member.selectMentorId", params);
	}
	
	public EgovMap selectReviewExistCheck(EgovMap params) {
		return selectOne("Member.selectReviewExistCheck", params);
	}

	public EgovMap selectReviewAverage(EgovMap params) {
		return selectOne("Member.selectReviewAverage", params);
	}
}
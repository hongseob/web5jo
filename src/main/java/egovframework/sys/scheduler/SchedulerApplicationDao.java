package egovframework.sys.scheduler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Repository("schedulerDao")
public class SchedulerApplicationDao extends EgovAbstractMapper {

	public void updateToProgressCampaign() {

		List<EgovMap> params = selectList("scheduler.selectCampaignProgressList");

		int expectnumOfupdate = selectOne("scheduler.countCampaignProgressList");

		// System.out.println(params);

		// List<EgovMap> params = selectList("scheduler.schedulerTest");
		
		List<Integer> campaignId = new ArrayList<>(); // update한 캠페인 id가 담길 리스트

		for (int i = 0; i < params.size(); i++) {
			// EgovMap
			params.get(i).put("email", params.get(i).get("uId"));
			params.get(i).put("title", "yonsei_notice 캠페인 알림");
			params.get(i).put("context", "[" + params.get(i).get("cNm") + "]" + " 회원님의 캠페인이 진행됩니다.");
			
			campaignId.add(i, (Integer)params.get(i).get("cId"));
		}

		insert("scheduler.insertAlarmAll", params);
		
		int numOfupdate = update("scheduler.updateToProgressCampaign");
		
		update("scheduler.updateToProgressApplicant", campaignId); // 신청유저 진행단계 업데이트
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("numOfSuccess", numOfupdate);
		map.put("numOfFail", expectnumOfupdate - numOfupdate);

		insert("scheduler.insertSchedulerLog", map);

	}
	
	public void updateToEndCampaign() {
		
		List<EgovMap> params = selectList("scheduler.selectCampaignToEndList"); // 종료될 리스트

		int expectnumOfupdate = selectOne("scheduler.countCampaignToEndList"); //종료될 리스트 숫자
		
		List<Integer> campaignId = new ArrayList<>();

		for (int i = 0; i < params.size(); i++) {
			// EgovMap
			params.get(i).put("email", params.get(i).get("uId"));
			params.get(i).put("title", "yonsei_notice 캠페인 알림");
			params.get(i).put("context", "[" + params.get(i).get("cNm") + "]" + " 회원님의 캠페인이 종료됩니다.");
			
			campaignId.add(i, (Integer)params.get(i).get("cId"));
		}
		
		insert("scheduler.insertAlarmAll", params); //알람 보내기
		
		int numOfupdate = update("scheduler.updateToEndCampaign");

		update("scheduler.updateToEndApplicant", campaignId);
		
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("numOfSuccess", numOfupdate);
		map.put("numOfFail", expectnumOfupdate - numOfupdate);

		insert("scheduler.insertSchedulerLog", map);

		
	}
	

	public List<EgovMap> schedulerTest() {
		return selectList("scheduler.schedulerTest");
	}
	
	public List<EgovMap> selectSchedulerLog(int pagenum) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("start", (pagenum-1)*30);
		map.put("end", pagenum*30);

		return selectList("scheduler.selectSchedulerLog", map);
	}
	
	public List<String> DupNotice(){
		return selectList("scheduler.DupNotice");
	}
	
	public int insertNotice(List<String> tmpList) {
		HashMap<String,String> noticemap = new HashMap<String,String>();
		
		noticemap.put("category", tmpList.get(0));
		noticemap.put("notice_link", tmpList.get(1));
		noticemap.put("notice_title", tmpList.get(2));
		noticemap.put("notice_writer", tmpList.get(3));
		noticemap.put("notice_dt", tmpList.get(4));
		
		return insert("scheduler.insertNotice",noticemap);
	}

}

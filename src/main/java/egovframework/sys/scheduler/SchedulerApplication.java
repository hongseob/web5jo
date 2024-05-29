package egovframework.sys.scheduler;

import java.io.*;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.net.HttpURLConnection;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
//import egovframework.sys.admin.AdminService;
import egovframework.sys.cmm.util.PagingVO;
//import egovframework.sys.main.create.CampaignCreateService;
import egovframework.sys.sec.handler.SundoUserDetails;

import javax.annotation.Resource;

import org.apache.commons.collections.MapUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@EnableScheduling
@Component
public class SchedulerApplication {
	
	@Resource(name = "schedulerService")
	private SchedulerApplicationService schedulerService;
	
	@Scheduled(cron = "0 0 0 * * *") //  매일 00시
//	@Scheduled(fixedRate = 5000)
	public void demoServiceMethod() {
		String python= "/usr/local/bin/python3.7";
		String yonseicrawling="/yonsei/main.py";


        List<List<String>> ret = new ArrayList<>();
        // 입력 스트림 오브젝트 생성
        BufferedReader br = null;

        try{
        	System.out.println("Crawling Start...");
        	ProcessBuilder processBuilder = new ProcessBuilder(python, yonseicrawling);
            Process process = processBuilder.start();
            InputStream inputStream = process.getInputStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));

            String line;
            while ((line = reader.readLine()) != null) {
                // 실행 결과 처리
                //System.out.println(line);
            }
            process.waitFor();
            System.out.println("Crawling Finish!");
            System.out.println("Save Data...");
            LocalDate now= LocalDate.now();
            DateTimeFormatter formatter= DateTimeFormatter.ofPattern("yyyyMMdd");

            String formatedNow=now.format(formatter);

            // 대상 CSV 파일의 경로 설정
            br = Files.newBufferedReader(Paths.get("/yonsei/"+formatedNow+".csv"), Charset.forName("UTF-8"));
            // CSV파일에서 읽어들인 1행분의 데이터
            String csvline = "";
            
            List<String> links= schedulerService.DupNotice();

            while((csvline = br.readLine()) != null) {
                // CSV 파일의 1행을 저장하는 리스트 변수
                List<String> tmpList = new ArrayList<>();
                String[] array = csvline.split(",");

                if(array.length>5){
                    int alength=array.length;
                    int overcnt=alength-5;
                    String[] tmp = new String[5];
                    tmp[0]=array[0];
                    tmp[1]=array[1];
                    tmp[2]=array[2];
                    for(int i=0; i<overcnt; i++){
                        tmp[2]=tmp[2]+','+array[3+i];
                    }
                    tmp[3]=array[alength-2];
                    tmp[4]=array[alength-1];
                    array=tmp;
                }
                // 배열에서 리스트로 변환
                tmpList = Arrays.asList(array);
                if(tmpList.get(0).equals("category")){
                    continue;
                }
                // 리스트 내용 출력
                // 반환용 리스트에 1행의 데이터를 저장
                boolean DupResult=links.contains(tmpList.get(1));
                if(DupResult==false) {
                	schedulerService.insertNotice(tmpList);
                }
                
                ret.add(tmpList);
                System.out.println("Done!");
            }

        } catch(Exception e){
            e.printStackTrace();
        } finally {
            try{
                if(br != null) {
                    br.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
	}
	
	
	//진행중인거 중에 종료날짜 -> 캠페인 종료 + 종료 알람
	//@Scheduled(cron = "0 0 0 * * *") //  매일 00시
//	@Scheduled(fixedRate = 5000)
//	public void updateToEndCampaign() {
//		
//		
//		
//	}
	
	
}
package org.zerock.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class FileCheckTask {

	@Scheduled(cron = "0/2 * * * * *") // 초(0~59) 분(0~59) 시(0~23) 날짜(1~31) 월(1~12) 요일(1~7) (년)
	public void checkFiles() throws Exception {
		log.warn("file check task run");
		
		log.warn("=====================================");
	}
}

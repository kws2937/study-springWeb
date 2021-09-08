package org.zerock.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class FileCheckTask {

	@Scheduled(cron = "0/2 * * * * *") // ��(0~59) ��(0~59) ��(0~23) ��¥(1~31) ��(1~12) ����(1~7) (��)
	public void checkFiles() throws Exception {
		log.warn("file check task run");
		
		log.warn("=====================================");
	}
}

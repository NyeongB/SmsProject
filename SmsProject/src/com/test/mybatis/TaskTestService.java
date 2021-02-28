package com.test.mybatis;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

@Service 
public class TaskTestService {
 
    @Scheduled(cron = "0/4 * * * * ?")
    public void TestScheduler(){
        System.out.println("스케줄링 테스트");
    }
} 
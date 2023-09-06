package sac.mall;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("sac.mall.dao")
@SpringBootApplication
public class SchoolMallApplication {
    public static void main(String[] args) {
        SpringApplication.run(SchoolMallApplication.class, args);
    }
}

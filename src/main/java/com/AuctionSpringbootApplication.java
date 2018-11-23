package com;

import com.google.code.kaptcha.Producer;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.util.Config;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.util.Properties;

@MapperScan("com.dao")
@SpringBootApplication
//@ServletComponentScan
public class AuctionSpringbootApplication {

    public static void main(String[] args) {
        SpringApplication.run(AuctionSpringbootApplication.class, args);
    }


    @Bean
    public Producer getProducer() {
        Properties properties = new Properties();
        properties.setProperty("kaptcha.textproducer.char.length", "4");
        properties.setProperty("kaptcha.image.width", "180");
        Config config = new Config(properties);
        DefaultKaptcha producer = new DefaultKaptcha();
        producer.setConfig(config);
        return producer;
    }


}

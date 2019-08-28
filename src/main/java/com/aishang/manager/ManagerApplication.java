package com.aishang.manager;

import com.ckfinder.connector.ConnectorServlet;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
@ServletComponentScan
public class ManagerApplication {

    @Bean
    public ServletRegistrationBean servletRegistrationBean(){
        ServletRegistrationBean<ConnectorServlet> connectorServletServletRegistrationBean = new ServletRegistrationBean<>(new ConnectorServlet(), "/ckfinder2.3.1/core/connector/java/connector.java");
        connectorServletServletRegistrationBean.addInitParameter("XMLConfig","/WEB-INF/ckfinder.xml");
        connectorServletServletRegistrationBean.addInitParameter("debug","false");
        connectorServletServletRegistrationBean.setLoadOnStartup(1);
        return connectorServletServletRegistrationBean;
    }

    public static void main(String[] args) {
        SpringApplication.run(ManagerApplication.class, args);
    }

}

package test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ApplicationTest {
    @Test
    public void  t1(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        int count = ac.getBeanDefinitionCount();
        String[] beanDefinitionNames = ac.getBeanDefinitionNames();
        for (String beanDefinitionName : beanDefinitionNames) {
            System.out.println(beanDefinitionName);
        }
    }
}

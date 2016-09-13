/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itn.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/**
 *
 * @author Hp
 */
@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "com.itn")
public class ProjectConfiguration extends WebMvcConfigurerAdapter {
    //    a converter who will be responsible for converting an id into an Object.This is required to handle one-to-many relationship in JSP. 
//    During User creation, A User can be allocated multiple roles/userProfiles, and so we need a converter to map a particular role/userProfile 
    //to a user based on profile id. Below provided is the converter class.
    @Autowired
   RoleToUserProfileConverter roleToUserProfileConverter;
    
    //Converter is required while you have a enum class and where you want to convert an object to string
    //and then to Long or int
    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(roleToUserProfileConverter);
    }
    
    
    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setSuffix(".jsp");
        viewResolver.setPrefix("/WEB-INF/views/");
        viewResolver.setViewClass(JstlView.class);
        viewResolver.setOrder(1);//we need this when there is more than one resolver
        registry.viewResolver(viewResolver);

    }
    //    This is used to activate bootstrap or any extra resources such as css, bootstrap images etc
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/static/**").addResourceLocations("/static/");
    }

}

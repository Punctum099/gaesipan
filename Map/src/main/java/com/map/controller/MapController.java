package com.map.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.map.VO.MarkerVO;
import com.map.mapper.MarkerMapper;

@RestController
public class MapController {
	
	@Autowired
    private MarkerMapper markerMapper;
	
	@RequestMapping("/map")
    public ModelAndView list() throws Exception{	
		 
		List<MarkerVO> marker = markerMapper.markerList();
		
        return new ModelAndView("map","markerList",marker);
    }
	
	@RequestMapping(value="/markerInsert",method=RequestMethod.POST)
    public String markerInsert(@ModelAttribute("MarkerVO") @Valid MarkerVO marker, BindingResult result) throws Exception{
		
		System.out.println(marker);
		System.out.println(marker.getAddress());
		System.out.println(marker.getX_coordinate());
		System.out.println(marker.getY_coordinate());
		System.out.println(marker.getCategory());
		System.out.println(marker.getContents());
		System.out.println(marker.getTitle());
		
		markerMapper.markerInsert(marker);
		
		 return "redirect://localhost:8080/map";
    }
}
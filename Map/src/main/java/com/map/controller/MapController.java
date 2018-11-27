package com.map.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
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
}
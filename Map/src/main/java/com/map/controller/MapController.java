package com.map.controller;

import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	private static Logger logger = LoggerFactory.getLogger(MapController.class);
	
	@Autowired
    private MarkerMapper markerMapper;
	
	@RequestMapping(value= {"/map","/"})
    public ModelAndView list() throws Exception{	
		logger.info("★-★-★-★-★-★-★> 마커가 호출되었습니다. <★-★-★-★-★-★-★");
		 
		List<MarkerVO> marker = markerMapper.markerList();
		List<MarkerVO> category = markerMapper.categoryList();

		//ModelAndView view = new ModelAndView("map","markerList",marker);
		//↑이것과 ↓이것은 동일하다
		ModelAndView view = new ModelAndView();
		view.setViewName("map");
		view.addObject("markerList", marker);
		view.addObject("categoryList", category);
		
        return view;
    }
	
	@RequestMapping(value="/markerInsert",method=RequestMethod.POST)
    public ModelAndView markerInsert(@ModelAttribute("MarkerVO") @Valid MarkerVO marker, BindingResult result) throws Exception{
		
		logger.info("★-★-★-★-★-★-★> marker_title : " + marker.getTitle() + " <★-★-★-★-★-★-★");
		logger.info("★-★-★-★-★-★-★> marker_contents : " + marker.getContents() + " <★-★-★-★-★-★-★");
		logger.info("★-★-★-★-★-★-★> marker_category_seq : " + marker.getCategory_seq() + " <★-★-★-★-★-★-★");
		
		markerMapper.markerInsert(marker);
		
		return list();
    }
	
	@RequestMapping(value="/categoryInsert",method=RequestMethod.POST)
    public ModelAndView categoryInsert(@ModelAttribute("MarkerVO") @Valid MarkerVO category, BindingResult result) throws Exception{
		
		logger.info("★-★-★-★-★-★-★> category_seq : " + category.getSeq() + " <★-★-★-★-★-★-★");
		logger.info("★-★-★-★-★-★-★> category_name : " + category.getName() + " <★-★-★-★-★-★-★");
		logger.info("★-★-★-★-★-★-★> category_kind : " + category.getKind() + " <★-★-★-★-★-★-★");
		
		markerMapper.categoryInsert(category);
		
		return list();
    }
}
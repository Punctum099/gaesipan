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
		logger.info("★-★-★-★-★-★-★> 페이지가 호출되었습니다. <★-★-★-★-★-★-★");
		 
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
    public String markerInsert(@ModelAttribute("MarkerVO") @Valid MarkerVO marker_1, BindingResult result) throws Exception{

		logger.info("★-★-★-★-★-★-★> 마커가 입력되었습니다. <★-★-★-★-★-★-★");
		logger.info("★-★-★-★-★-★-★> marker_title : " + marker_1.getTitle() + " <★-★-★-★-★-★-★");
		logger.info("★-★-★-★-★-★-★> marker_contents : " + marker_1.getContents() + " <★-★-★-★-★-★-★");
		logger.info("★-★-★-★-★-★-★> marker_category_seq : " + marker_1.getCategory_seq() + " <★-★-★-★-★-★-★");
		
		String check = "none";
		int count = 0;
		
		count = markerMapper.markerInsert(marker_1);
		MarkerVO marker_2 = markerMapper.lastMarker();
		
		if(count > 0) {
			check = "true";
		} else {
			check = "false";
		}
		
		String personJson;
		
		personJson = "{\"seq\":\""+marker_2.getSeq()
        			+"\",\"x_coordinate\":\""+marker_2.getX_coordinate()
			        +"\",\"y_coordinate\":\""+marker_2.getY_coordinate()
			        +"\",\"road_address\":\""+marker_2.getRoad_address()
			        +"\",\"address\":\""+marker_2.getAddress()
			        +"\",\"name\":\""+marker_2.getName()
			        +"\",\"title\":\""+marker_2.getTitle()
			        +"\",\"contents\":\""+marker_2.getContents()
			        +"\",\"tel\":\""+marker_2.getTel()
			        +"\",\"check\":\""+check+"\"}";
		
		return personJson;
    }
	
	@RequestMapping(value="/markerUpdate",method=RequestMethod.POST)
    public String markerUpdate(@ModelAttribute("MarkerVO") @Valid MarkerVO marker_1, BindingResult result) throws Exception{
		
		String check = "none";
		int count = 0;
		
		count = markerMapper.markerUpdate(marker_1);
		MarkerVO marker_2 = markerMapper.selectMarker(marker_1.getSeq());
		
		if(count > 0) {
			check = "true";
		} else {
			check = "false";
		}
		
		String personJson;
		
		personJson = "{\"seq\":\""+marker_2.getSeq()
        			+"\",\"x_coordinate\":\""+marker_2.getX_coordinate()
			        +"\",\"y_coordinate\":\""+marker_2.getY_coordinate()
			        +"\",\"road_address\":\""+marker_2.getRoad_address()
			        +"\",\"address\":\""+marker_2.getAddress()
			        +"\",\"category_seq\":\""+marker_2.getCategory_seq()
			        +"\",\"name\":\""+marker_2.getName()
			        +"\",\"title\":\""+marker_2.getTitle()
			        +"\",\"contents\":\""+marker_2.getContents()
			        +"\",\"tel\":\""+marker_2.getTel()
			        +"\",\"check\":\""+check+"\"}";

		logger.info("★-★-★-★-★-★-★> 마커가 수정되었습니다. <★-★-★-★-★-★-★");
		logger.info("★-★-★-★-★-★-★> marker_title : " + marker_2.getTitle() + " <★-★-★-★-★-★-★");
		logger.info("★-★-★-★-★-★-★> marker_contents : " + marker_2.getContents() + " <★-★-★-★-★-★-★");
		logger.info("★-★-★-★-★-★-★> marker_category_seq : " +marker_2.getCategory_seq() + " <★-★-★-★-★-★-★");
		logger.info("★-★-★-★-★-★-★> marker_Tel : " + marker_2.getTel() + " <★-★-★-★-★-★-★");
		
		return personJson;
    }
	
	@RequestMapping(value="/categoryInsert",method=RequestMethod.POST)
    public String categoryInsert(@ModelAttribute("MarkerVO") @Valid MarkerVO category, BindingResult result) throws Exception{
		
		String check = "none";
		int count = 0;
		count = markerMapper.categoryInsert(category);
		MarkerVO lastCategory = markerMapper.lastCategory();	//카테고리 테이블에서만 검색
		
		if(count > 0) {
			check = "true";
		} else {
			check = "false";
		}

		logger.info("★-★-★-★-★-★-★> category_seq : " + lastCategory.getSeq() + " <★-★-★-★-★-★-★");
		logger.info("★-★-★-★-★-★-★> category_name : " + lastCategory.getName() + " <★-★-★-★-★-★-★");
		logger.info("★-★-★-★-★-★-★> category_kind : " + lastCategory.getKind() + " <★-★-★-★-★-★-★");
		
		String personJson;
		
		personJson = "{\"category_seq\":\""+lastCategory.getSeq()
			        +"\",\"name\":\""+lastCategory.getName()
			        +"\",\"check\":\""+check+"\"}";
		
		logger.info("★-★-★-★-★-★-★> 입력된 카테고리의 개수 : " + count + " <★-★-★-★-★-★-★");
		
		return personJson;
    }
	
	@RequestMapping(value="/markerDelete",method=RequestMethod.POST)
	public String markerDelete(@ModelAttribute("MarkerVO") @Valid MarkerVO Marker, BindingResult result) throws Exception{
		
		logger.info("★-★-★-★-★-★-★> " + Marker.getSeq() + "번 마커가 삭제되었습니다. <★-★-★-★-★-★-★");
		
		String check = "none";
		int count = 0;
		
		count = markerMapper.markerDelete(Marker.getSeq());
		
		if(count > 0) {
			check = "true";
		} else {
			check = "false";
		}
		
		String personJson;
		
		personJson = "{\"seq\":\""+Marker.getSeq()
			        +"\",\"check\":\""+check+"\"}";
		
		return personJson;
	}

	@RequestMapping(value="/markerSelect",method=RequestMethod.POST)
	public String markerSelect(@ModelAttribute("MarkerVO") @Valid MarkerVO marker_1, BindingResult result) throws Exception{
		
		String check = "none";
		
		MarkerVO marker_2 = markerMapper.selectMarker(marker_1.getSeq());
		
		if(marker_2.getSeq() > 0) {
			check = "true";
		} else {
			check = "false";
		}
		
		String personJson;
		
		personJson = "{\"seq\":\""+marker_2.getSeq()
	    			+"\",\"x_coordinate\":\""+marker_2.getX_coordinate()
			        +"\",\"y_coordinate\":\""+marker_2.getY_coordinate()
			        +"\",\"road_address\":\""+marker_2.getRoad_address()
			        +"\",\"address\":\""+marker_2.getAddress()
			        +"\",\"category_seq\":\""+marker_2.getCategory_seq()
			        +"\",\"name\":\""+marker_2.getName()
			        +"\",\"title\":\""+marker_2.getTitle()
			        +"\",\"contents\":\""+marker_2.getContents()
			        +"\",\"tel\":\""+marker_2.getTel()
			        +"\",\"check\":\""+check+"\"}";
	
		logger.info("★-★-★-★-★-★-★> 마커를 가져옵니다. <★-★-★-★-★-★-★");
		
		return personJson;
	}
}
















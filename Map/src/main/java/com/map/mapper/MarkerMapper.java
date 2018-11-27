package com.map.mapper;

import java.util.List;

import com.map.VO.MarkerVO;

public interface MarkerMapper {
	   public void boardInsert(MarkerVO marker) throws Exception;
	   
	   public List<MarkerVO> markerList(MarkerVO marker)throws Exception; 
	   
	   public List<MarkerVO> markerList()throws Exception; 
}

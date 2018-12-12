package com.map.mapper;

import java.util.List;

import com.map.VO.MarkerVO;

public interface MarkerMapper {
	
	   public int markerInsert(MarkerVO marker) throws Exception;

	   public int categoryInsert(MarkerVO marker) throws Exception;
	   
	   //public List<MarkerVO> markerList(MarkerVO marker)throws Exception; 
	
	   public int markerUpdate(MarkerVO marker) throws Exception;
	
	   public MarkerVO selectMarker(int seq) throws Exception;
	   
	   public List<MarkerVO> markerList()throws Exception; 
	   
	   public List<MarkerVO> categoryList()throws Exception;
	
	   public int markerDelete(int seq) throws Exception;
	   
	   public MarkerVO lastCategory()throws Exception;

	   public MarkerVO lastMarker()throws Exception;
}

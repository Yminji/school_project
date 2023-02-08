package com.myspring.capstone.fstvl.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.capstone.fstvl.dao.FstvlDAO;
import com.myspring.capstone.fstvl.vo.FstvlVO;

@Service("fstvlService")
@Transactional(propagation = Propagation.REQUIRED)
public class FstvlServiceImpl implements FstvlService{
	@Autowired
	private FstvlDAO fstvlDAO;
	
	public Map fstvlDetail(int fstvl_id) throws Exception{
		Map fstvlMap = new HashMap();
		FstvlVO fstvlVO = fstvlDAO.selectFstvlDetail(fstvl_id);
		fstvlMap.put("fstvlVO", fstvlVO);
		List imgeList = fstvlDAO.selectFstvlDetailImage(fstvl_id);
		return fstvlMap;
	}
}

package com.eastteam.myprogram.service.cases;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.eastteam.myprogram.dao.CaseMybatisDao;
import com.eastteam.myprogram.entity.Case;
import com.eastteam.myprogram.service.PageableService;

@Component
@Transactional
public class CaseService extends PageableService {
	
	@Autowired
	private CaseMybatisDao CaseDao;
	
	
	public List<Case> search(Map parameters, Pageable pageRequest) {
		// TODO
		return null;
	}

	
	public Long getCount(Map parameters) {
		// TODO
		return 0L;
	}
	
	public Case get(Long caseId) {
		return this.CaseDao.get(caseId);
	}

}

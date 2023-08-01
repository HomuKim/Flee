package com.flee.myPage.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.flee.myPage.dao.MyInfoDAO;

import lombok.AllArgsConstructor;

@Service("myInfoService")
@AllArgsConstructor
public class MyInfoServiceImpl implements MyInfoService {

	private MyInfoDAO myInfoDAO;

	@Override
	public Map<String, Object> getMember(Map<String, Object> map) throws Exception {
		return myInfoDAO.getMember(map);
	}

	@Override
	public Map<String, Object> getCategory(Map<String, Object> map) throws Exception {
		return myInfoDAO.getCategory(map);
	}

	@Override
	public void updateMember(Map<String, Object> map) throws Exception {
		myInfoDAO.updateMember(map);
	}

	@Override
	public void updateMemberCategory(Map<String, Object> map) throws Exception {
		myInfoDAO.updateMemberCategory(map);
	}

	@Override
	public void updateProfile(Map<String, Object> map) throws Exception {
		myInfoDAO.updateProfile(map);
	}

	@Override
	public void deleteMember(Map<String, Object> map) throws Exception {
		myInfoDAO.deleteMember(map);

	}

	@Override
	public List<Map<String, Object>> getMyProductList(Map<String, Object> map) throws Exception {
		return myInfoDAO.myProductList(map);
	}

}
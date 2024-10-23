package com.withJo.member.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.withJo.member.domain.MemberVo;
import com.withJo.member.service.MemberService;
import com.withJo.util.Paging;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/member")
@Controller
public class MemberController {
	
	private Logger log = LoggerFactory.getLogger(MemberController.class);
	private final String logTitleMsg = "==MemberController==";
	
	@Autowired
	private MemberService memberService;
	
	// 회원 리스트
	@GetMapping("/list")
	public String getMemberList(@RequestParam(defaultValue = "all") String searchField, 
			@RequestParam(defaultValue = "") String searchKeyword,
			@RequestParam(defaultValue = "1") int curPage, Model model) {
		
		log.info(logTitleMsg);
		log.info("getMemberList");
		log.info("searchField: {}", searchField);
		log.info("searchKeyword: {}", searchKeyword);
		
		int totalCount = memberService.memberTotalCount(searchField, searchKeyword);
		
		log.info("totalCount: {}", totalCount);
		Paging pagingVo = new Paging(totalCount, curPage);
		
		int start = pagingVo.getPageBegin();
		int end = pagingVo.getPageEnd();
		
		List<MemberVo> memberList = memberService.memberSelectList(start, end, searchField, searchKeyword);
		System.out.println(memberList);
		model.addAttribute("memberList", memberList);
		
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("pagingVo", pagingVo);
		
		Map<String, Object> searchMap = new HashMap<>();
		searchMap.put("searchField", searchField);
		searchMap.put("searchKeyword", searchKeyword);
		
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("searchMap", searchMap);
		
		log.info("searchMap: {}", searchMap);
		return "member/MemberListView";					
	}
	
	// 로그인 화면
	@GetMapping("/login")
	public String login(HttpSession session, Model model) {
		log.info(logTitleMsg);
		log.info("login");
		
		return "member/MemberLoginView";		
	}	
	
	// 로그인 회원정보 조회 및 검증
	@PostMapping("/login")
	public String getLogin(MemberVo membervo, HttpSession session, Model model) {
		log.info("MemberController getLogin" + membervo);		
		
		MemberVo memberVo = memberService.memberExist(membervo);
		
		String viewUrl = "";
		
		if(memberVo != null) {
			session.setAttribute("memberVo", memberVo);
			viewUrl = "redirect:/";
		}else {
			viewUrl = "/member/MemberLoginView";
		}		
		
		return viewUrl;
	}
	
	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session, Model model) {
		log.info(logTitleMsg);
		log.info("logout");
		
		session.invalidate();
		
		String viewUrl = "redirect:/";
		
		return viewUrl;
		
	}
	
	// 회원가입 페이지
	@GetMapping("/add")
	public String memberAdd(Model model) {
		log.info(logTitleMsg);
		log.info("@GetMapping memberAdd");
		
		return "member/MemberAddView";
	}
	
	
	// 회원가입 DB 연동
	@PostMapping("/add")
	public String memberAdd(MemberVo memberVo, Model model) {
		log.info(logTitleMsg);
		log.info("@PostMapping memberAdd: {}", memberVo);
		
		memberService.memberInsertOne(memberVo);
		
		return "/member/MemberLoginView";
	}
	
	// ID 중복검사
	@PostMapping("/checkId")
	@ResponseBody
	public Map<String, Boolean> checkId(@RequestParam String memberId) {
	    boolean isDuplicate = memberService.isDuplicateId(memberId); // 서비스에서 중복 검사 로직 수행
	    Map<String, Boolean> response = new HashMap<>();
	    response.put("isDuplicate", isDuplicate);
	    return response;
	}
	
	// 마이페이지 수정
	@GetMapping("/update")
	public String showUpdateForm(@RequestParam("memberNo") int memberNo, Model model) {
	    log.info(logTitleMsg);
	    log.info("GetMapping showUpdateForm memberNo: {}", memberNo);
	    
	    if (memberNo != 0) {
	        MemberVo memberVo = memberService.memberSelectOne(memberNo);
	        if (memberVo != null) {
	            model.addAttribute("memberVo", memberVo);
	        } else {
	            log.error("Member not found for memberNo: {}", memberNo);
	            return "redirect:/error";
	        }
	    } else {
	        log.error("Invalid memberNo: 0");
	        return "redirect:/error";
	    }
	    
	    return "member/MemberUpdateView";
	}
	
	// 마에페이지 수정
	@PostMapping(value = "/update")
	public String memberMyPage(MemberVo memberVo, RedirectAttributes redirectAttributes) {
	    log.info(logTitleMsg);
	    log.info("@PostMapping memberMyPage memberVo: {}", memberVo);
	    log.info("memberNo: {}", memberVo.getMemberNo());  // 추가된 로그
	    
	    if (memberVo.getMemberNo() != 0) {
	        memberService.memberUpdateOne(memberVo);
	        redirectAttributes.addAttribute("memberNo", memberVo.getMemberNo());
	        return "redirect:/member/update";
	    } else {
	        // memberNo가 0인 경우 처리
	        log.error("Invalid memberNo: 0");
	        return "redirect:/error";  // 또는 적절한 에러 페이지로 리다이렉트
	    }
	}
	
	
	

}

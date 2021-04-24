package com.mju.groupware.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mju.groupware.dto.UserList;
import com.mju.groupware.service.AdminService;
import com.mju.groupware.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdministratorController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private UserService userService;


	/* 관리자 메뉴 메인화면 */
	@RequestMapping(value = "/manageList", method = RequestMethod.GET)
	public String manageList(Model model) {

		try {
			List<UserList> SelectUserList = adminService.SelectUserlist();

			model.addAttribute("list", SelectUserList);
		} catch (Exception e) {

			e.printStackTrace();
		}
		return "/admin/manageList";

	}

	// 관리자 메뉴 - 관리자 권한으로 user 탈퇴
	@ResponseBody
	@RequestMapping(value = "/withdrawal.do")
	public String DoWithdrawlByAdmin(HttpServletRequest request) {

		String[] ajaxMsg = request.getParameterValues("checkArr");
		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
			userService.UpdateWithdrawlUser(ajaxMsg[i]);
			System.out.println(ajaxMsg[i]);
		}
		return "redirect:manageList";
	}

	// 관리자메뉴 - 관리자 권한으로 user 권한 변경
	@ResponseBody
	@RequestMapping(value = "/manageList.do")
	public String changeAuth(RedirectAttributes redirectAttributes, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		
		String OptionValue = request.getParameter("OptionValue");
		System.out.println(OptionValue);
		String[] ajaxMsg = request.getParameterValues("checkArr");
		System.out.println(ajaxMsg[0]);
		
		return "/admin/manageList";
	}

	/* 관리자 메뉴-휴면 계정 관리 화면 */
	@RequestMapping(value = "/manageSleep", method = RequestMethod.GET)
	public String manageSleep(Model model) {

		try {
			List<UserList> SelectDormantUserList = adminService.SelectDormantUserList();

			model.addAttribute("DormantList", SelectDormantUserList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/admin/manageSleep";
	}

	// 관리자 휴면 메뉴 - 관리자 권한으로 휴면 계정 복구
	@ResponseBody
	@RequestMapping(value = "/dormantRecovery.do")
	public String DoDormantRecoveryByAdmin(HttpServletRequest request) {

		String[] ajaxMsg = request.getParameterValues("checkArr");
		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
		}
		return "redirect:manageSleep";
	}

	// 관리자 휴면 메뉴 - 관리자 권한으로 휴면 계정 탈퇴
	@ResponseBody
	@RequestMapping(value = "/dormantWithdrawal.do")
	public String DoDormantWithdrawalByAdmin(HttpServletRequest request) {

		String[] ajaxMsg = request.getParameterValues("checkArr");
		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
		}
		return "redirect:manageSleep";
	}


	/* 관리자 메뉴-탈퇴 계정 관리 화면 */
	@RequestMapping(value = "/manageSecession", method = RequestMethod.GET)
	public String manageSecession(Model model) {
		try {
			List<UserList> SelectWithdrawalUserList = adminService.SelectWithdrawalUserList();

			model.addAttribute("WithdrawalList", SelectWithdrawalUserList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/admin/manageSecession";
	}

	// 관리자 탈퇴 메뉴 - 관리자 권한으로 탈퇴 계정 복구
	@ResponseBody
	@RequestMapping(value = "/withdrawalRecovery.do")
	public String DoWithdrawalRecoveryByAdmin(HttpServletRequest request) {

		String[] ajaxMsg = request.getParameterValues("checkArr");
		int size = ajaxMsg.length;
		for (int i = 0; i < size; i++) {
		}
		return "redirect:manageSecession";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail() {
		return "/admin/detail";
	}

	/* 관리자 메뉴-회원 목록 클릭 시 정보 출력 화면 */
	@RequestMapping(value = "/manageStudent", method = RequestMethod.GET)
	public String manageStudent() {
		return "/admin/manageStudent";
	}

	@RequestMapping(value = "/manageProfessor", method = RequestMethod.GET)
	public String manageProfessor() {
		return "manageProfessor";
	}

	@RequestMapping(value = "/manageModifyStudent", method = RequestMethod.GET)
	public String manageModifyStudent() {
		return "manageModifyStudent";

	}

	@RequestMapping(value = "/manageModifyProfessor", method = RequestMethod.GET)
	public String manageModifyProfessor() {
		return "manageModifyProfessor";

	}


	@RequestMapping(value = "/homeAdmin", method = RequestMethod.GET)
	public String homeAdmin() {
		return "homeAdmin";

	}

}
/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/codegen/cody">Cody</a> All rights reserved.
 */
package com.codegen.cody.modules.sysuser.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codegen.cody.common.config.Global;
import com.codegen.cody.common.persistence.Page;
import com.codegen.cody.common.web.BaseController;
import com.codegen.cody.common.utils.StringUtils;
import com.codegen.cody.modules.sysuser.entity.SysUser;
import com.codegen.cody.modules.sysuser.service.SysUserService;

/**
 * 系统用户Controller
 * @author liuyunjie
 * @version 2017-10-18
 */
@Controller
@RequestMapping(value = "${adminPath}/sysuser/sysUser")
public class SysUserController extends BaseController {

	@Autowired
	private SysUserService sysUserService;
	
	@ModelAttribute
	public SysUser get(@RequestParam(required=false) String id) {
		SysUser entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = sysUserService.get(id);
		}
		if (entity == null){
			entity = new SysUser();
		}
		return entity;
	}
	
	@RequiresPermissions("sysuser:sysUser:view")
	@RequestMapping(value = {"list", ""})
	public String list(SysUser sysUser, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SysUser> page = sysUserService.findPage(new Page<SysUser>(request, response), sysUser); 
		model.addAttribute("page", page);
		return "modules/sysuser/sysUserList";
	}

	@RequiresPermissions("sysuser:sysUser:view")
	@RequestMapping(value = "form")
	public String form(SysUser sysUser, Model model) {
		model.addAttribute("sysUser", sysUser);
		return "modules/sysuser/sysUserForm";
	}

	@RequiresPermissions("sysuser:sysUser:edit")
	@RequestMapping(value = "save")
	public String save(SysUser sysUser, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, sysUser)){
			return form(sysUser, model);
		}
		sysUserService.save(sysUser);
		addMessage(redirectAttributes, "保存系统用户成功");
		return "redirect:"+Global.getAdminPath()+"/sysuser/sysUser/?repage";
	}
	
	@RequiresPermissions("sysuser:sysUser:edit")
	@RequestMapping(value = "delete")
	public String delete(SysUser sysUser, RedirectAttributes redirectAttributes) {
		sysUserService.delete(sysUser);
		addMessage(redirectAttributes, "删除系统用户成功");
		return "redirect:"+Global.getAdminPath()+"/sysuser/sysUser/?repage";
	}

}
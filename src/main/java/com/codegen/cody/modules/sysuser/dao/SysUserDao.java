/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/codegen/cody">Cody</a> All rights reserved.
 */
package com.codegen.cody.modules.sysuser.dao;

import com.codegen.cody.common.persistence.CrudDao;
import com.codegen.cody.common.persistence.annotation.MyBatisDao;
import com.codegen.cody.modules.sysuser.entity.SysUser;

/**
 * 系统用户DAO接口
 * @author liuyunjie
 * @version 2017-10-18
 */
@MyBatisDao
public interface SysUserDao extends CrudDao<SysUser> {
	
}
/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/codegen/cody">Cody</a> All rights reserved.
 */
package com.codegen.cody.modules.gen.dao;

import com.codegen.cody.common.persistence.CrudDao;
import com.codegen.cody.common.persistence.annotation.MyBatisDao;
import com.codegen.cody.modules.gen.entity.GenTable;

/**
 * 业务表DAO接口
 * @author Codegen
 * @version 2013-10-15
 */
@MyBatisDao
public interface GenTableDao extends CrudDao<GenTable> {
	
}

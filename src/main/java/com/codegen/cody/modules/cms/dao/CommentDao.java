/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/codegen/cody">Cody</a> All rights reserved.
 */
package com.codegen.cody.modules.cms.dao;

import com.codegen.cody.common.persistence.CrudDao;
import com.codegen.cody.common.persistence.annotation.MyBatisDao;
import com.codegen.cody.modules.cms.entity.Comment;

/**
 * 评论DAO接口
 * @author Codegen
 * @version 2013-8-23
 */
@MyBatisDao
public interface CommentDao extends CrudDao<Comment> {

}

/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/codegen/cody">Cody</a> All rights reserved.
 */
package com.codegen.cody.modules.cms.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.codegen.cody.common.service.CrudService;
import com.codegen.cody.modules.cms.dao.ArticleDataDao;
import com.codegen.cody.modules.cms.entity.ArticleData;

/**
 * 站点Service
 * @author Codegen
 * @version 2013-01-15
 */
@Service
@Transactional(readOnly = true)
public class ArticleDataService extends CrudService<ArticleDataDao, ArticleData> {

}

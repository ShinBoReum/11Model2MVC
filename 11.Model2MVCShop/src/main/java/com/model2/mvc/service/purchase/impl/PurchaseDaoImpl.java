package com.model2.mvc.service.purchase.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

import com.model2.mvc.service.purchase.PurchaseDao;


@Repository("purchaseDaoImpl")
public class PurchaseDaoImpl implements PurchaseDao{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public PurchaseDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void insertPurchase(Purchase purchase) throws Exception {
		sqlSession.insert("PurchaseMapper.insertPurchase", purchase);
	}

	@Override
	public Purchase findPurchase(int tranNo) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.findPurchase", tranNo);
	}

	@Override
	public List<Purchase> getPurchaseList(Search search) throws Exception {
		return sqlSession.selectList("PurchaseMapper.getPurchaseList", search);
	}

	@Override
	public void updatePurchase(Purchase purchase) throws Exception {
		System.out.println("??here???");
		sqlSession.update("PurchaseMapper.updatePurchase", purchase);
		
	}

	@Override
	public void updateTranCode(Purchase purchase) throws Exception {
		sqlSession.update("PurchaseMapper.updateTranCode", purchase);
		
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("PurchaseMapper.getTotalCount", search);

	}
	

}

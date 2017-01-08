package com.qnu.thesis.serviceImpl;

import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.qnu.thesis.daoImpl.QuerysImpl;
import com.qnu.thesis.model.thesis;
import com.qnu.thesis.model.thesisAuthor;
import com.qnu.thesis.model.thesisManager;
public class serviceImpl{
	private QuerysImpl query;
	public QuerysImpl getQuery() {
		return query;
	}
	public void setQuery(QuerysImpl query) {
		this.query = query;
	}
	public List<thesisAuthor> userLogin(String account,String password){
		query=new QuerysImpl();
		List<thesisAuthor> author=(List<thesisAuthor>) query.getUserInfo(account);
		Iterator it=author.iterator();
		while(it.hasNext()){
			thesisAuthor theAu=(thesisAuthor) it.next();
			if(theAu.getAuthor_password().equals(password))
				return author;
		}
		return null;
	}
	public List<thesisManager> ManaLogin(String account,String password){
		query=new QuerysImpl();
		List<thesisManager> author=(List<thesisManager>) query.getManaInfo(account);
		Iterator it=author.iterator();
		while(it.hasNext()){
			thesisManager theAu=(thesisManager) it.next();
			if(theAu.getMana_password().equals(password))
				return author;
		}
		return null;
	}
	public boolean userRegist(String account, String password, String name,
			String phone, String position) {
		query=new QuerysImpl();
		if(query.addAuthor(account, password,name,phone,position)){
			return true;
		}
		return false;
	}
	public List search(String keyWord, String type) {
		// TODO Auto-generated method stub
		query=new QuerysImpl();
		List<thesis> list=null;
		if(keyWord.equals(null)||keyWord.equals("")){
			list=query.search(keyWord,type);
		}
		return list;
	}
	public boolean addThesis(String brief,String name,String type,String athor){
		query=new QuerysImpl();
		if(query.addThesis(brief,name,type,athor)){
			return true;
		}
		return false;
	}
	public List userSearch(String account, String phone) {
		// TODO Auto-generated method stub
		query=new QuerysImpl();
		List<thesisAuthor> list=null;
		
			list=query.userSearch(account,phone);
		
		return list;
	}
}

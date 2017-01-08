package com.qnu.thesis.daoImpl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.cn.smart.SmartChineseAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriter.MaxFieldLength;
import org.apache.lucene.index.Term;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.Searcher;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.qnu.thesis.model.thesis;
import com.qnu.thesis.model.thesisAuthor;
import com.qnu.thesis.model.thesisManager;
public class QuerysImpl{
	public List<thesisAuthor> getUserInfo(String account)
	{
		List<thesisAuthor> list=null;
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		String hql = "from thesisAuthor where author_account='"+ account +"'";
		Query query = session.createQuery(hql);
		list= query.list();
		session.close();
		return list;
	}
	public List<thesisManager> getManaInfo(String account)
	{
		List<thesisManager> list=null;
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		String hql = "from thesisManager where mana_account='"+ account +"'";
		Query query = session.createQuery(hql);
		list= query.list();
		session.close();
		return list;
	}
	public boolean addNewThesis(String title,String author,String brief,Date create_date,int author_id,String type){
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			thesis thesis=new thesis();
			thesis.setThesis_author(author);
			thesis.setThesis_brief(brief);
			thesis.setThesis_name(title);
			thesis.setCreate_date(new Date());
			thesis.setThesis_type(type);;
			session.save(thesis);
			tx.commit();
		}catch(Exception e){
			if(tx!=null){
				tx.rollback();
			}
			e.printStackTrace();
		}finally{
			session.close();
		}
		return true;
	}

//	public boolean createIndex(){
//		try {
//			Directory dir=FSDirectory.open(new File("G:/wangbo/PapperMana/WebRoot/index"));
//			File[] fileLsit=new File("G:/wangbo/PapperMana/WebRoot/file").listFiles();
//			StringBuilder sb=new StringBuilder();
//			String temp;
//			Analyzer analyzer=new SmartChineseAnalyzer(Version.LUCENE_30);
//			IndexWriter writer=new IndexWriter(dir,analyzer,true,MaxFieldLength.UNLIMITED);
//			Document doc=new Document();
//			for (File file : fileLsit) {
//				doc=new Document();
//				doc.add(new Field("fileName",file.getName().toString(),Field.Store.YES,Field.Index.NOT_ANALYZED));
//				BufferedReader reader=new BufferedReader(new FileReader(file));
//				while(null!=(temp=reader.readLine()))sb.append(temp);
//				doc.add(new Field("content",sb.toString(),Field.Store.YES,Field.Index.ANALYZED));
//				doc.add(new Field("path",file.getAbsolutePath(),Field.Store.YES,Field.Index.NOT_ANALYZED));
//				System.out.println(file.getName());
//				
//			}writer.addDocument(doc);
//			writer.optimize();
//			writer.close();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return true;
//	}
	
	public boolean addAuthor(String account, String password, String name,
			String phone, String position) {
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			thesisAuthor author=new thesisAuthor();
			author.setAuthor_account(account);
			author.setAuthor_password(password);
			author.setAuthor_position(position);
			author.setCreate_date(new Date());
			author.setPhone(phone);
			author.setName(name);
			session.save(author);
			tx.commit();
		}catch(Exception e){
			if(tx!=null){
				tx.rollback();
			}
			e.printStackTrace();
		}finally{
			session.close();
		}
		return true;
	}

	public List<thesis> search(String keyWord ,String type) {
		List<thesis> list=null;
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		StringBuilder hql=new StringBuilder();
		if(keyWord.equals(null)||keyWord.equals("")){
			hql = hql.append("from thesis where thesis_type='"+ type +"'");
		}else if(type.equals("")||type.equals(null)){
			hql=hql.append("from thesis where thesis_brief='"+ keyWord +"'");
		}
		Query query = session.createQuery(hql.toString());
		list= query.list();
		session.close();
		return list;
	}
	
	
//	public List<thesis> searchByKey(String keyWord){
//		List name=getQuery(keyWord);
//		List<thesis> list=null;
//		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
//		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
//		Session session=sessionFactory.openSession();
//		Iterator it=name.iterator();
//		StringBuilder hql = new StringBuilder("from thesis where thesis_name in('"+it.next()+"'");
//		while(it.hasNext()){
//			hql.append(",'"+it.next()+"'");
//		}
//		String hqltemp = hql.toString();
//		Query query = session.createQuery(hqltemp);
//		list= query.list();
//		session.close();
//		return list;
//	}

//	public List<String> getQuery(String keyWord){
//		List<String> list=null;
//		Searcher searcher;
//		Document doc;
//		try {
//			Directory dir=FSDirectory.open(new File("G:/wangbo/PapperMana/WebRoot/index"));
//			Analyzer analyzer=new SmartChineseAnalyzer(Version.LUCENE_30);
//			searcher=new IndexSearcher(dir);
//			Term term=new Term("keyWord",keyWord);
//			TermQuery query=new TermQuery(term);
//			TopDocs top=searcher.search(query, 10);
//			int sum=top.totalHits;
//			list=new ArrayList<String>();
//			for (ScoreDoc score : top.scoreDocs) {
//				doc=new Document();
//				doc=searcher.doc(score.doc);
//				list.add(doc.get("fileName").toString());
//			}
//		} catch (IOException e) {
//			e.printStackTrace();
//		}finally{
//			return list;
//		}
//	}

	public boolean addThesis(String brief, String name, String type,String author) {
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			thesis thesis=new thesis();
			thesis.setThesis_author(author);
			thesis.setCreate_date(new Date());
			thesis.setThesis_brief(brief);
			thesis.setThesis_name(name);
			thesis.setThesis_type(type);
			session.save(thesis);
			tx.commit();
		}catch(Exception e){
			if(tx!=null){
				tx.rollback();
			}
			e.printStackTrace();
		}finally{
			session.close();
		}
		return true;
	}
	public List<thesisAuthor> userSearch(String account, String phone) {
		List<thesisAuthor> list=null;
		ClassPathXmlApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
		SessionFactory sessionFactory=(SessionFactory) resource.getBean("sessionFactory");
		Session session=sessionFactory.openSession();
		StringBuilder hql=new StringBuilder();
		if(!account.equals(null)&&!account.equals("")){
			hql = hql.append("from thesisAuthor where author_account='"+ account +"'");
		}else {
			hql=hql.append("from thesisAuthor where phone='"+ phone +"'");
		}
		Query query = session.createQuery(hql.toString());
		list= query.list();
		session.close();
		return list;
	}
}

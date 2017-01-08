package com.qnu.thesis.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.opensymphony.xwork2.ActionSupport;
import com.qnu.thesis.model.thesis;
import com.qnu.thesis.model.thesisAuthor;
import com.qnu.thesis.model.thesisManager;
import com.qnu.thesis.serviceImpl.serviceImpl;

public class ThesisAction extends ActionSupport implements ServletRequestAware{
	private serviceImpl service;
	private  ApplicationContext resource  = new  ClassPathXmlApplicationContext("applicationContext.xml");
	private String account;
	private String password;
	private String name;
	private String phone;
	private String position;
	private String keyWord;
	private String type;
	private HttpServletRequest request;
	private File image; //上传的文件
	private String imageContentType;
	private String imageFileName;
	private String fileName;
	private String brief;
	private String author;
	private List<thesis> list=new ArrayList<thesis>();
	private List<thesisAuthor> list1=new ArrayList<thesisAuthor>();
	public serviceImpl getService() {
		return service;
	}
	public void setService(serviceImpl service) {
		this.service = service;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}
	public ApplicationContext getResource() {
		return resource;
	}
	public void setResource(ApplicationContext resource) {
		this.resource = resource;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getBrief() {
		return brief;
	}
	public void setBrief(String brief) {
		this.brief = brief;
	}
	public File getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image = image;
	}

	public String getFileContentType() {
		return imageContentType;
	}
	public void setFileContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}
	public String getFileFileName() {
		return imageFileName;
	}
	public void setFileFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	
	public String getImageContentType() {
		return imageContentType;
	}
	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	

	public List<thesis> getList() {
		return list;
	}
	public void setList(List<thesis> list) {
		this.list = list;
	}
	
	public List<thesisAuthor> getList1() {
		return list1;
	}
	public void setList1(List<thesisAuthor> list1) {
		this.list1 = list1;
	}
	//-----------------------------------------------------------------------
	public String userLogin(){
		HttpServletRequest req = this.request;  
	    HttpSession session = req.getSession(); 
		service=new serviceImpl();
		List<thesisAuthor> mana=service.userLogin(account, password);
		Iterator<thesisAuthor> it =mana.iterator();
		thesisAuthor object = (thesisAuthor) it.next();
		session.setAttribute("user", object.getAuthor_account());
		session.setAttribute("password",object.getAuthor_password() );
		return "success";

	}
	public String ManauserLogin(){
		HttpServletRequest req = this.request;  
	    HttpSession session = req.getSession(); 

		service=new serviceImpl();
		List<thesisManager> mana=service.ManaLogin(account, password);
		Iterator<thesisManager> it =mana.iterator();
		thesisManager object = (thesisManager) it.next();
		session.setAttribute("user", object.getMana_account());
		session.setAttribute("password",object.getMana_password() );
		return "success";
	}
	public String userRegister(){
		service=new serviceImpl();
		if(service.userRegist(account, password,name,phone,position)){
			return "success";
		}
		return "error";
	}
	public String search(){
		HttpServletRequest req = this.request;  
	    HttpSession session = req.getSession(); 
		System.out.println(keyWord+"  "+type   );
		service=new serviceImpl();
		List listThesis=service.search(keyWord,type);
		Iterator<thesis> it=listThesis.iterator();
		while(it.hasNext()){
			thesis thesis=it.next();
			thesis temp=new thesis();
			temp.setCreate_date(thesis.getCreate_date());
			temp.setId(thesis.getId());
			temp.setThesis_author(thesis.getThesis_author());
			temp.setThesis_brief(thesis.getThesis_brief());
			temp.setThesis_name(thesis.getThesis_name());
			temp.setThesis_type(thesis.getThesis_type());
			list.add(temp);
		}
		ServletActionContext.getRequest().getSession().setAttribute("list", list);
		return "success";
		//return "error";
	}
	public String addPapper(){
		
		return "success";
	}
	public String upload() throws IOException{
		String realpath = "G:/wangbo/PapperMana/WebRoot/file";
        System.out.println("realpath: "+imageFileName);
        if(image!=null){
            File savefile = new File(realpath,imageFileName);
            System.out.println(imageFileName);
            if (!savefile.getParentFile().exists())
                savefile.getParentFile().mkdirs();
            FileUtils.copyFile(image, savefile);
        }
        service=new serviceImpl();
        if(service.addThesis(brief, imageFileName, type,author))
        	return "success";
        else 
        	return "error";
	}
	
	public String userSearch(){
		HttpServletRequest req = this.request;  
	    HttpSession session = req.getSession(); 
		System.out.println(keyWord+"  "+type   );
		service=new serviceImpl();
		List listThesis=service.userSearch(account,phone);
		Iterator<thesisAuthor> it=listThesis.iterator();
		while(it.hasNext()){
			thesisAuthor thesis=it.next();
			thesisAuthor temp=new thesisAuthor();
			temp.setCreate_date(thesis.getCreate_date());
			temp.setId(thesis.getId());
			temp.setAuthor_account(thesis.getAuthor_account());
			temp.setAuthor_position(thesis.getAuthor_position());
			temp.setName(thesis.getName());
			temp.setPhone(thesis.getPhone());
			temp.setModify_date(thesis.getModify_date());
			list1.add(temp);
		}
		ServletActionContext.getRequest().getSession().setAttribute("list1", list1);
		return "success";
	}
}

/*========================
	MemberController.java
	- 사용자 정의 컨트롤러
==========================*/

package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController
{
	// mybatis 객체 의존성 (자동) 주입을 위한 준비
	@Autowired
	private SqlSession SqlSession;
	
	@Scheduled(fixedRate=1000)
    public void TestScheduler(){
        System.out.println("스케줄링 테스트");
    }
	
	@RequestMapping(value = "/main.action", method =RequestMethod.GET)
	public String main(Model model)
	{
		String view = null; 
		
		IMemberDAO dao = SqlSession.getMapper(IMemberDAO.class);
		
		//model.addAttribute("count", 인원수);
		model.addAttribute("id", dao.getName(1));
		
		view = "/WEB-INF/views/main.jsp";
		
		
		return view;
	}
	
	
	@RequestMapping(value = "/memberlist.action", method =RequestMethod.GET)
	public String memberList(Model model)
	{
		String view = null; 
		
		IMemberDAO dao = SqlSession.getMapper(IMemberDAO.class);
		
		//model.addAttribute("count", 인원수);
		model.addAttribute("count", dao.count());
		
		//model.addAttribute("list", 명단);
		model.addAttribute("list", dao.list());
		
		view = "/WEB-INF/views/MemberList.jsp";
		
		
		return view;
	}
	
	
	@RequestMapping(value = "/memberinsert.action", method =RequestMethod.POST)
	public String memberInsert(MemberDTO m)
	{
		String view = "redirect:memberlist.action";
		
		IMemberDAO dao = SqlSession.getMapper(IMemberDAO.class);
		
		dao.add(m);
		
		return view;
	}
	
	@RequestMapping(value = "/memberdelete.action", method =RequestMethod.GET)
	public String memberDelete(int mid)
	{
		String view = "redirect:memberlist.action";
		
		IMemberDAO dao = SqlSession.getMapper(IMemberDAO.class);
		
		dao.remove(mid);
		
		return view;		
	}
	
	@RequestMapping(value = "/memberupdate.action", method =RequestMethod.POST)
	public String memberUpdate(MemberDTO m)
	{
		String view = "redirect:memberlist.action";
		
		IMemberDAO dao = SqlSession.getMapper(IMemberDAO.class);
		
		dao.modify(m);
		
		return view;	
	}
	
}

package com.together.semiprj.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.together.semiprj.board.model.service.NboardService;
import com.together.semiprj.board.model.vo.Nboard;
import com.together.semiprj.member.model.vo.Member;

@WebServlet("/nboard/view")
public class NormalBoardController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//필요한 정보 set 후 foward
		int boardNo= Integer.parseInt(req.getParameter("boardNo"));
		HttpSession session = req.getSession();
		Member loginmember = (Member)session.getAttribute("loginMember");
		int memberNo;
		if(loginmember != null) {
			memberNo = loginmember.getMemberNo();
		}
		else {
			memberNo = 1;
		}
		try {
			
			//2. 뷰 정보 모두 가져오기(조회수 증가)
			NboardService service = new NboardService();
			Nboard nboard = service.selectBoardView(boardNo,memberNo);
			
			//3. 사진 가져오기
			
			//4. 댓글정보 가져오기
			
			System.out.println(nboard);
			
			req.setAttribute("nboard", nboard);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String path = "/WEB-INF/views/board/nboard-content.jsp";
		RequestDispatcher dispatcher = req.getRequestDispatcher(path);
		dispatcher.forward(req, resp);
	}
}

package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gaesipanDAO.bDAO;
import gaesipanDTO.bDTO;

public class BNoticeListCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String pageNumber = request.getParameter("pageNumber");
		String option = request.getParameter("option");
		String search = request.getParameter("search");
			
		if(request.getParameter("pageNumber") == null) {
			pageNumber = "1";
		}
		if(request.getParameter("option") == null) {
			option = "";
		}
		if(request.getParameter("search") == null) {
			search = "";
		}
		
		bDAO dao = new bDAO();
		ArrayList<bDTO> dtos = dao.NoticeList(pageNumber, option, search);
		request.setAttribute("list", dtos);
	}
}

package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gaesipanDAO.bDAO;

public class BModifyCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String seq = request.getParameter("seq");
		
		bDAO  dao = new bDAO();
		dao.modify(title, contents, seq);
			
	}

}
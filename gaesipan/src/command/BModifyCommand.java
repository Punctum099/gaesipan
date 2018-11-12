package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gaesipanDAO.gDAO;

public class BModifyCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String seq = request.getParameter("seq");
		
		gDAO  dao = new gDAO();
		dao.modify(title, contents, seq);
			
	}

}
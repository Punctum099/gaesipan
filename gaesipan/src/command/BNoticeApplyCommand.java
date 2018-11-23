package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gaesipanDAO.bDAO;

public class BNoticeApplyCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String see = request.getParameter("see");
		String seq = request.getParameter("seq");
		
		bDAO dao = new bDAO();
		dao.NoticSee(see, seq);
			
	}
}

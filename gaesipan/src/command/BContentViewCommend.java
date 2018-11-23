package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gaesipanDAO.bDAO;
import gaesipanDTO.bDTO;

public class BContentViewCommend implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String seq = request.getParameter("seq");
		String modify = request.getParameter("modify");
		bDAO dao = new bDAO();
		bDTO dto = dao.contentView(seq, modify);
		
		request.setAttribute("content_view", dto);
	}
}

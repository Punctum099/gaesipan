package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gaesipanDAO.gDAO;
import gaesipanDTO.gDTO;

public class BContentCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String seq = request.getParameter("seq");
		gDAO dao = new gDAO();
		gDTO dto = dao.contentView(seq);
		
		request.setAttribute("content_view", dto);
	}
}

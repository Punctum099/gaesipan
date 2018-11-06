package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gaesipanDAO.gDAO;
import gaesipanDTO.gDTO;

public class BContentCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String siq = request.getParameter("siq");
		gDAO dao = new gDAO();
		gDTO dto = dao.contentView(siq);
		
		request.setAttribute("content_view", dto);
	}
}

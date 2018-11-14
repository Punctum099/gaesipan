package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gaesipanDAO.gDAO;
import gaesipanDTO.gDTO;

public class BListCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String pageNumber = request.getParameter("pageNumber");
		
		if(request.getParameter("pageNumber") == null) {
			pageNumber = "1";
		}

		gDAO dao = new gDAO();
		ArrayList<gDTO> dtos = dao.list(pageNumber);
		request.setAttribute("list", dtos);
	}
}
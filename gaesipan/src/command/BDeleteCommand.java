package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gaesipanDAO.bDAO;

public class BDeleteCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String seq = request.getParameter("seq");
		bDAO dao = new bDAO();
		dao.delete(seq);
	}
}
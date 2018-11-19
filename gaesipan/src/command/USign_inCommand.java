package command;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gaesipanDAO.bDAO;
import gaesipanDAO.uDAO;
import gaesipanDTO.bDTO;

public class USign_inCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String author = request.getParameter("author");
		
		uDAO dao = new uDAO();
		dao.write(title, contents, author);
	}
}
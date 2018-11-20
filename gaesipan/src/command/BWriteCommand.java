package command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gaesipanDAO.bDAO;

public class BWriteCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String author = request.getParameter("author");
		String listType = request.getParameter("listType");
		
		bDAO dao = new bDAO();
		dao.write(title, contents, author, listType);
	}
}

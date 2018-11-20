package frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.BCommand;
import command.BModify_viewCommend;
import command.BDeleteCommand;
import command.BListCommand;
import command.BModifyCommand;
import command.BNoticeListCommand;
import command.BWriteCommand;
import command.USign_inCommand;

/**
 * Servlet implementation class BFrontController
 */
@WebServlet("*.do")
public class BFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGet");
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doPost");
		actionDo(request, response);
	}
    
    private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("actionDo");
		
		request.setCharacterEncoding("UTF-8");
		
		String viewPage = null;
		BCommand command = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		if(com.equals("/list.do")) {		//리스트를 보여준다 (글 목록)
			command = new BListCommand();
			command.execute(request, response);
			viewPage = "list.jsp";
		}else if(com.equals("/content_view.do")){	//내용을 보여준다 (글 내용)
			command = new BModify_viewCommend();
			command.execute(request, response);
			viewPage = "content_view.jsp";
		}else if(com.equals("/delete.do")) {		//글삭제를 한 뒤 글목록으로 돌아간다 (글 삭제)
			command = new BDeleteCommand();
			command.execute(request, response);
			viewPage = "list.do";
		}else if(com.equals("/write_view.do")) {	//글쓰기 화면으로 들어간다 (글 작성)
			viewPage = "write_view.jsp";
		}else if(com.equals("/write.do")) {			//작성된 글을 DB에 입력하고 글목록으로 돌아간다 (글 입력)
			command = new BWriteCommand();
			command.execute(request, response);
			viewPage = "list.do";
		}else if(com.equals("/modify_view.do")) {	//글수정 화면으로 들어간다 (글 수정)
			command = new BModify_viewCommend();
			command.execute(request, response);
			viewPage = "modify_view.jsp";
		}else if(com.equals("/modify.do")) {		//수정된 글을 DB에 업데이트하고 글목록으로 돌아간다 (글 수정)
			command = new BModifyCommand();
			command.execute(request, response);
			viewPage = "list.do";
		}else if(com.equals("/sign_in.do")) {
			command = new USign_inCommand();
			command.execute(request, response);
			viewPage = "list.do";
		}else if(com.equals("/NoticeList.do")) {
			command = new BNoticeListCommand();
			command.execute(request, response);
			viewPage = "NoticeList.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}

}

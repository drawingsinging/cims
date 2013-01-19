package source;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String fileId = req.getParameter("fileid");
		String filetype = req.getParameter("filetype");
		if (fileId != null) {
			FileDbQuery db = new FileDbQuery(this.getServletContext());
			String[] file = null;
			try {
				file = db.getFile(fileId);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (file != null) {
				String type = "text/html";
				if (filetype != null) {
					if (filetype.equalsIgnoreCase("doc")) {
						type = "application/msword";
					}
					resp.setHeader(
							"Content-Disposition",
							"attachment;filename="
									+ URLEncoder.encode(file[1], "utf-8"));
				}
				resp.setContentType(type);
				req.getRequestDispatcher("data\\" + file[2]).forward(req, resp);
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(request.getHeader("Content-Type"));
		System.out.println(request.getParameter("apply-apartment"));
		Enumeration<String> enums = request.getParameterNames();
		while (enums.hasMoreElements())
			System.out.println(enums.nextElement());
		resp.getWriter().println("sszzzzzzzzs");
		System.out.println(ServletFileUpload.isMultipartContent(request));
		
	}
	
}

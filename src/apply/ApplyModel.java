package apply;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.TransformerException;

import source.FileDbQuery;

public class ApplyModel {
	public void saveApply(String applyname, String applycategory,
			String userId, String applyyiju, String docfilename,
			String hesuanfilename, String dataRealPath, ServletContext context)
			throws TransformerException, IOException,
			ParserConfigurationException, SQLException {

		String docid = savedbFile(docfilename, dataRealPath, context);
		String hesuanid = savedbFile(hesuanfilename, dataRealPath, context);
		ApplyDbQuery db = new ApplyDbQuery(context);
		db.createNewApply(applyname, applycategory, userId, docid, hesuanid,
				applyyiju);
		db.close();
	}

	private String savedbFile(String docfilename, String dataRealPath,
			ServletContext context) throws TransformerException, IOException,
			ParserConfigurationException, SQLException {
		ApplyDbQuery db = new ApplyDbQuery(context);
		String filenameWithoutSuffix = docfilename.substring(0,
				docfilename.lastIndexOf('.'));

		String htmlName = filenameWithoutSuffix + ".html";
		String docpath = "doc/" + docfilename;
		String htmlpath = "html/" + filenameWithoutSuffix + "/" + htmlName;

		db.convertDocFile(docfilename, dataRealPath + "\\doc", dataRealPath
				+ "\\html");

		FileDbQuery fdb = new FileDbQuery(context);
		String docid = fdb.saveFile(docfilename, docpath);
		fdb.saveFile(htmlName, htmlpath);
		db.close();
		fdb.close();
		return docid;
	}
}

/*    package com.actions;  
      import java.io.File;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
      
    @SuppressWarnings("serial")
	public class FileUploadAction extends ActionSupport{  
		private File userImage;  
        private String userImageContentType;  
        private String userImageFileName;  
      
   
       @Override
		public String execute() {  
            try {  
String filePath = ServletActionContext.getServletContext().getRealPath("/").concat("userimages");  
            System.out.println("Image Location:" + filePath);//see the server console for actual location  
            File fileToCreate = new File(filePath,userImageFileName);  
            FileUtils.copyFile(userImage, fileToCreate);//copying source file to new file  
                 
        }  
            catch(Exception e)
            {
            	System.out.println("jhjhjhj");
            }
			return SUCCESS;
     
       
    }


	public File getUserImage() {
		return userImage;
	}


	public void setUserImage(File userImage) {
		this.userImage = userImage;
	}


	public String getUserImageFileName() {
		return userImageFileName;
	}


	public void setUserImageFileName(String userImageFileName) {
		this.userImageFileName = userImageFileName;
	}


	public String getUserImageContentType() {
		return userImageContentType;
	}


	public void setUserImageContentType(String userImageContentType) {
		this.userImageContentType = userImageContentType;
	}
	
	
    }



import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;



*//**
 * Servlet implementation class AshareAccountOpenServlet
 *//*
@WebServlet("/FileUploadAction")
public class FileUploadAction extends HttpServlet {
	
	

	private static final long serialVersionUID = 1L;

	// location to store file uploaded
	private static final String UPLOAD_DIRECTORY = "upload";

	// upload settings
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

	*//**
	 * Upon receiving file upload submission, parses the request to read upload
	 * data and saves the file on disk.
	 *//*
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		//PrintWriter out = response.getWriter();
		try {
			String images[] = new String[4];
			String s[] = new String[33];
			
			

			
			// checks if the request actually contains upload file
			if (!ServletFileUpload.isMultipartContent(request)) {
				// if not, we stop here
				PrintWriter writer = response.getWriter();
				writer.println("Error: Form must has enctype=multipart/form-data.");
				writer.flush();
				return;
			}

			// configures upload settings
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// sets memory threshold - beyond which files are stored in disk
			factory.setSizeThreshold(MEMORY_THRESHOLD);
			// sets temporary location to store files
			factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

			ServletFileUpload upload = new ServletFileUpload(factory);

			// sets maximum size of upload file
			upload.setFileSizeMax(MAX_FILE_SIZE);
 
			// sets maximum size of request (include file + form data)
			upload.setSizeMax(MAX_REQUEST_SIZE);

			// constructs the directory path to store upload file
			// this path is relative to application's directory
			String uploadPath = getServletContext().getRealPath("")
					+ File.separator + UPLOAD_DIRECTORY;

			// creates the directory if it does not exist
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}

			try {
				// parses the request's content to extract file data
				
				List<FileItem> formItems = upload.parseRequest(request);

				if (formItems != null && formItems.size() > 0) {
					// iterates over form's fields
					
					int j = 0;
					for (FileItem item : formItems) {
						// processes only fields that are not form fields
						
						if (!item.isFormField()) {
							
							
							String fileName = new File(item.getName())
									.getName();
							String filePath = uploadPath + File.separator
									+ fileName;
							// System.out.println(filePath);
							File storeFile = new File(filePath);
							// System.out.println(storeFile.getAbsolutePath());
							// saves the file on disk
							item.write(storeFile);
							images[i] = storeFile.getAbsolutePath();
							System.out.println(images[i]);
							i++;
							
						}

						else {

							s[j] = item.getString();
							System.out.println(s[j]);
							j++;
						}

					}
				}

			
				
			
			}

			catch (Exception ex) {
				System.out.println("exception");
				ex.printStackTrace();
			}

			// sends the statement to the database server
			System.out.println("update execute");
			
			
			
		} catch (Exception ex) {
			//out.println("<h3>details not correct try again</h3>");
			
			ex.printStackTrace();
		} finally {
			
				try {
					
				} catch (Exception ex) {
					ex.printStackTrace();
				}

			

		}
	}
}
*/
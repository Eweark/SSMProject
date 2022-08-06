package com.cykj.servlet;

import com.cykj.bean.User;
import com.cykj.service.StuUserService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.Iterator;
import java.util.List;

@WebServlet("/studentLogin")
public class StuServlet extends BaseServlet {
    @Autowired
    private StuUserService stuUserService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        PrintWriter writer = resp.getWriter();
        switch (action){
            case "stuLogin":
                stuLogin(req,resp,writer);
                break;
            case "updatePwd":
                updatePwd(req,resp,writer);
                break;
            case "logout":
                logout(req,resp,writer);
                break;
            case "uploadHead":
                uploadHead(req,resp,writer);
                break;
        }
        writer.flush();
        writer.close();
    }

    private void uploadHead(HttpServletRequest req, HttpServletResponse resp, PrintWriter writer) {
        String filename = null;
        try {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            // 设置上传文件的大小限制为10M
            factory.setSizeThreshold(10 * 1024 * 1024);
            List items = null;
            try {
                items = upload.parseRequest(req);
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                if (!item.isFormField()) {
                    // 根据时间戳创建头像文件
                    filename = System.currentTimeMillis() + ".jpg";
                    String photoFolder =
                            getServletContext().getRealPath(File.separator + "picture");
                    File f = new File(photoFolder, filename);
                    f.getParentFile().mkdirs();
                    // 通过item.getInputStream()获取浏览器上传的文件的输入流
                    InputStream is = item.getInputStream();
                    // 复制文件
                    FileOutputStream fos = new FileOutputStream(f);
                    byte b[] = new byte[10 * 1024 * 1024];
                    int length = 0;
                    while (-1 != (length = is.read(b))) {
                        fos.write(b, 0, length);
                    }
                    fos.close();
                    PrintWriter pw = resp.getWriter();
                    String path = f.getPath();
                    path = path.substring(path.indexOf("picture")).replaceAll("\\\\", "/");
                    pw.print(path);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void logout(HttpServletRequest req, HttpServletResponse resp, PrintWriter writer) {
        req.getSession().removeAttribute("user");
        writer.println(1);
    }

    private void updatePwd(HttpServletRequest req, HttpServletResponse resp, PrintWriter writer) {
        String newPwd = req.getParameter("newPwd");
        User user = (User) req.getSession().getAttribute("user");
        int id = user.getId();
        int i = stuUserService.updatePwd(id, newPwd);
        if (i == 0){
            writer.println(0);
        }else {
            writer.println(1);
        }
    }

    private void stuLogin(HttpServletRequest req, HttpServletResponse resp, PrintWriter writer) {
        String accept = req.getParameter("accept");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();
        int i = stuUserService.stuLogin(accept, password,session);
        if (i == 0){
            writer.println(0);
        }else {
            writer.println(1);
        }

    }
}

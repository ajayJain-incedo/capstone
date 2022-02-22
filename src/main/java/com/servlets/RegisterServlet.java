package com.servlets;
import com.dao.UserDao;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import com.model.User;
import com.service.ConnectionProvider;
import java.util.Base64;


public class RegisterServlet extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        PrintWriter out = res.getWriter();
        String firstName = req.getParameter("first_name");
        String lastName = req.getParameter("last_name");
        String email = req.getParameter("email");
        String mobile = req.getParameter("mobile");
        String address = req.getParameter("address");
        String password1 = req.getParameter("password1");
        String password2 = req.getParameter("password2");

        // Encrypt password
        Base64.Encoder encoder = Base64.getEncoder();
        String encryptedPassword = encoder.encodeToString(password1.getBytes());
        password2 = encoder.encodeToString(password2.getBytes());

        // creating user object and setting these fields to it.
        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setAddress(address);
        user.setPassword(encryptedPassword);
        user.setMobile(mobile);

        // creating a user dao object
        UserDao dao = new UserDao(ConnectionProvider.getConnection());
        if(dao.insertUser(user, password2).equals("allFine")){
            out.println("done");
        }else if(dao.insertUser(user, password2).equals("wrongMobile")){
            out.println("mobileError");
        }else if(dao.insertUser(user, password2).equals("emailDuplicate")){
            out.println("emailDuplicate");
        }else if(dao.insertUser(user, password2).equals("passwordNotMatching")){
            out.println("passwordNotMatching");
        }else if(dao.insertUser(user, password2).equals("tooLong")){
            out.println("tooLong");
        }
        else{
            out.println("error");
        }
    }

}

package fitralpark.diet.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//식단 목록 및 캘린더 관리 컨트롤러
@WebServlet("/name.do")
public class DietController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //DietController.java
        

        req.getRequestDispatcher("/WEB-INF/views/name.jsp").forward(req, resp);
    }

}

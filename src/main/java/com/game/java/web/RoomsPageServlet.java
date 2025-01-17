package com.game.java.web;

import com.game.java.model.jdbc.Room;
import com.game.java.model.jdbc.RoomDao;
import com.game.java.model.jdbc.RoomDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static java.util.Objects.isNull;

public class RoomsPageServlet extends HttpServlet {
    private RoomDao roomDao;

    @Override
    public void init() {
        this.roomDao = RoomDaoImpl.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (isNull(req.getSession().getAttribute("user"))) {
            resp.sendRedirect(req.getContextPath() + "/homePage");
        } else {
            List<Room> rooms = roomDao.getAllRooms();
            req.setAttribute("rooms", rooms);
            req.getRequestDispatcher("/WEB-INF/pages/rooms.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.sendRedirect(req.getContextPath() + "/rooms");
    }
}

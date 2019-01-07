package controller;

import business.ApplicationContext;
import business.book.Book;
import business.cart.ShoppingCart;
import viewmodel.BaseViewModel;
import viewmodel.HomepageViewModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "HomepageServlet", urlPatterns = {"/homepage"},loadOnStartup = 1)
@ServletSecurity(@HttpConstraint(transportGuarantee = ServletSecurity.TransportGuarantee.CONFIDENTIAL))
public class HomepageServlet extends BookstoreServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        ShoppingCart result = (ShoppingCart) request.getSession().getAttribute("cart");
        if (result == null) {
            new BaseViewModel(request);
        }
        if ("add".equals(action)) {
            ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
            String bookIdString = request.getParameter("bookId");
            long bookId = Long.parseLong(bookIdString);
            Book book = ApplicationContext.INSTANCE.getBookDao().findByBookId(bookId);
            cart.addItem(book);
            boolean isAjaxRequest =
                    "XMLHttpRequest".equalsIgnoreCase(request.getHeader("X-Requested-With"));
            if (isAjaxRequest) {
                String jsonString = "{\"cartCount\": " + cart.getNumberOfItems() + "}";
                response.setContentType("application/json");
                response.getWriter().write(jsonString);
                response.flushBuffer();
                return;
            }
        }
        response.sendRedirect(request.getContextPath() + "/homepage");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryURL = "/homepage";
        request.setAttribute("p", new HomepageViewModel(request));
        forwardToJsp(request, response, categoryURL);
    }
}

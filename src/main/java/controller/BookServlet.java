package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import business.ApplicationContext;
import business.book.Book;
import business.cart.ShoppingCart;
import viewmodel.BookViewModel;

@WebServlet(name = "BookServlet", urlPatterns = {"/book"})
@ServletSecurity(@HttpConstraint(transportGuarantee = ServletSecurity.TransportGuarantee.CONFIDENTIAL))
public class BookServlet extends BookstoreServlet {
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
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
            response.sendRedirect(request.getRequestURI());
        }
        else if("search".equals(action)){
            response.sendRedirect(request.getContextPath() + "/book?book=" + request.getParameter("q"));
        }
        else{
            response.sendRedirect(request.getRequestURI());
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryURL = "/book";
        request.setAttribute("p", new BookViewModel(request));
        forwardToJsp(request, response, categoryURL);
    }



}

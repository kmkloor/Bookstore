package controller;


import business.ApplicationContext;
import business.book.Book;
import business.cart.ShoppingCart;
import viewmodel.CartViewModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CartServlet", urlPatterns = {"/cart"})
@ServletSecurity(@HttpConstraint(transportGuarantee = ServletSecurity.TransportGuarantee.CONFIDENTIAL))
public class CartServlet extends BookstoreServlet {

        @Override
        protected void doPost(HttpServletRequest request,
                HttpServletResponse response) throws ServletException, IOException {
            String action = request.getParameter("action");
            if ("increment".equals(action)) {
                ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
                String bookIdString = request.getParameter("bookId");
                long bookId = Long.parseLong(bookIdString);
                Book book = ApplicationContext.INSTANCE.getBookDao().findByBookId(bookId);
                cart.increment(book);
            }
            else if ("decrement".equals(action)){
                ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
                String bookIdString = request.getParameter("bookId");
                long bookId = Long.parseLong(bookIdString);
                Book book = ApplicationContext.INSTANCE.getBookDao().findByBookId(bookId);
                cart.decrement(book);
            }
            response.sendRedirect(request.getContextPath() + "/cart");
        }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryURL = "/cart";
        request.setAttribute("p", new CartViewModel(request));
        forwardToJsp(request, response, categoryURL);
    }


}

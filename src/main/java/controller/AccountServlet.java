package controller;

import business.ApplicationContext;
import business.book.Book;
import business.cart.ShoppingCart;
import business.customer.Customer;
import business.order.OrderDetails;
import viewmodel.AccountViewModel;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Account", urlPatterns = {"/account"})
@ServletSecurity(@HttpConstraint(transportGuarantee = ServletSecurity.TransportGuarantee.CONFIDENTIAL))
public class AccountServlet extends BookstoreServlet{

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if ("logout".equals(action)) {
           session.removeAttribute("accountOrders");
            session.removeAttribute("customer");
            session.removeAttribute("customerForm");
            response.sendRedirect(request.getContextPath() + "/login");
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryURL = "/account";
        request.setAttribute("p", new AccountViewModel(request));
        forwardToJsp(request, response, categoryURL);
    }
}

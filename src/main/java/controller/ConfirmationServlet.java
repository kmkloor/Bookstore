package controller;


import business.ApplicationContext;
import business.cart.ShoppingCart;
import business.order.Order;
import viewmodel.ConfirmationViewModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Confirmation",
        urlPatterns = {"/confirmation"})
@ServletSecurity(@HttpConstraint(transportGuarantee = ServletSecurity.TransportGuarantee.CONFIDENTIAL))
public class ConfirmationServlet extends BookstoreServlet{

    protected boolean allowBrowserCaching() {
        return false;
    }
    /**
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // use RequestDispatcher to forward request internally
        request.setAttribute("p", new ConfirmationViewModel(request));
        forwardToJsp(request, response, "/confirmation");
    }

}

package controller;

import business.ApplicationContext;
import business.cart.ShoppingCart;
import business.customer.CustomerForm;
import business.order.OrderDetails;
import business.order.OrderService;
import viewmodel.CheckoutViewModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Checkout",
        urlPatterns = {"/checkout"})
@ServletSecurity(@HttpConstraint(transportGuarantee = ServletSecurity.TransportGuarantee.CONFIDENTIAL))
public class CheckoutServlet extends BookstoreServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("p", new CheckoutViewModel(request));
        forwardToJsp(request, response, "/checkout");
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");

        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String ccNumber = request.getParameter("ccNumber");
        String ccMonth = request.getParameter("ccMonth");
        String ccYear = request.getParameter("ccYear");

        CustomerForm customerForm = new CustomerForm(name, address, phone, email, ccNumber, ccMonth, ccYear);
        session.setAttribute("customerForm", customerForm);

        // this should never happen...
        if (cart.getItems().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        if (customerForm.getHasFieldError()) {
            session.setAttribute("validationError", Boolean.TRUE);
            response.sendRedirect(request.getContextPath() + "/checkout");
            return;
        }

        OrderService orderService = ApplicationContext.INSTANCE.getOrderService();

        long orderId = orderService.placeOrder(customerForm, cart);
        if (orderId == 0) {
            session.setAttribute("transactionError", Boolean.TRUE);
            response.sendRedirect(request.getContextPath() + "/checkout");
        } else {
            cart.clear();
            OrderDetails orderDetails = orderService.getOrderDetails(orderId);
            if((Boolean) session.getAttribute("loggedIn")){
                List<OrderDetails> accountOrders = (List<OrderDetails>) session.getAttribute("accountOrders");
                accountOrders.add(orderDetails);
                session.setAttribute("accountOrders", accountOrders);
            }

            session.setAttribute("orderDetails", orderDetails);
            response.sendRedirect(request.getContextPath() + "/confirmation");
        }
    }
}

package controller;

import business.ApplicationContext;
import business.customer.Customer;
import business.customer.CustomerDao;
import business.order.*;
import viewmodel.LogInViewModel;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpConstraint;
import javax.servlet.annotation.ServletSecurity;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LogIn",
        urlPatterns = {"/login"})
@ServletSecurity(@HttpConstraint(transportGuarantee = ServletSecurity.TransportGuarantee.CONFIDENTIAL))
public class LogInServlet extends BookstoreServlet{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // use RequestDispatcher to forward request internally
        request.setAttribute("p", new LogInViewModel(request));
        forwardToJsp(request, response, "/login");
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String ccNumber = request.getParameter("ccNumber");
        List<OrderDetails> accountOrders = new ArrayList<>();
        CustomerDao customerDao = ApplicationContext.INSTANCE.getCustomerDao();
        List<Customer> customers = new ArrayList<>();
        for (Customer customer: customerDao.findAll()) {
            if (customer.getEmail().equalsIgnoreCase(email) && customer.getCcNumber()
                    .substring(customer.getCcNumber().length()-4, customer.getCcNumber().length()).equals(ccNumber)) {
                customers.add(customer);
                findOrders(customer.getCustomerId(), accountOrders);
            }
        }
        if(customers.size() == 0) {
        session.setAttribute("noCustomer", Boolean.TRUE);
        response.sendRedirect(request.getContextPath() + "/login");
        return;
         }
                session.setAttribute("customer", customers);
                session.setAttribute("accountOrders", accountOrders);
        response.sendRedirect(request.getContextPath() + "/account");
    }

    private void findOrders(long customerId,  List<OrderDetails> accountOrders){
        OrderDao orderDao =  ApplicationContext.INSTANCE.getOrderDao();
        OrderService orderService = ApplicationContext.INSTANCE.getOrderService();
        for (Order order: orderDao.findAll()) {
            if (order.getCustomerId() == customerId){
                long customerOrderId = order.getCustomerOrderId();
                accountOrders.add(orderService.getOrderDetails(customerOrderId));
            }
        }
    }

}

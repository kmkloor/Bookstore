package viewmodel;

import business.customer.Customer;
import business.order.*;

import javax.servlet.http.HttpServletRequest;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class AccountViewModel extends BaseViewModel{

    private List<OrderDetails> accountOrders;
    private List<Customer> customer;

    public AccountViewModel(HttpServletRequest request) {
        super(request);
        if(this.getLogged()) {
            this.customer = (List<Customer>) session.getAttribute("customer");
            this.accountOrders = (List<OrderDetails>) session.getAttribute("accountOrders");
            Collections.reverse(accountOrders);

        }
    }

    public List<OrderDetails> getAccountOrders() { return accountOrders; }
    public List<Customer> getCustomer() {return customer; }

}

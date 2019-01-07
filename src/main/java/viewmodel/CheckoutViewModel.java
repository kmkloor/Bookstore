package viewmodel;

import business.customer.Customer;
import business.customer.CustomerForm;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class CheckoutViewModel extends BaseViewModel {

    private CustomerForm customerForm;
    private Boolean hasTransactionError;
    private Boolean hasValidationError;

    public CheckoutViewModel(HttpServletRequest request) {
        super(request);
        if(this.getLogged()){
            List<Customer> customerList = (List<Customer>) session.getAttribute("customer");
            Customer customer = customerList.get(0);
            CustomerForm customerForm = new CustomerForm(customer);
            session.setAttribute("customerForm", customerForm);
        }
        CustomerForm sessionForm = (CustomerForm) session.getAttribute("customerForm");

        customerForm = (sessionForm == null) ? new CustomerForm() : sessionForm;

        hasValidationError = (Boolean) session.getAttribute("validationError");
        session.setAttribute("validationError", null);

        hasTransactionError = (Boolean) session.getAttribute("transactionError");
        request.getSession().setAttribute("transactionError", null);
    }

    public CustomerForm getCustomerForm() {
        return customerForm;
    }

    public boolean getHasValidationError() {
        return hasValidationError != null && hasValidationError;
    }

    public boolean getHasTransactionError() {
        return hasTransactionError != null && hasTransactionError;
    }
}

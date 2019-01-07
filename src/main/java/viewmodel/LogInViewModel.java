package viewmodel;

import javax.servlet.http.HttpServletRequest;

public class LogInViewModel extends BaseViewModel {

    private Boolean noCustomer;

    public LogInViewModel(HttpServletRequest request) {
        super(request);

        noCustomer = (Boolean) session.getAttribute("noCustomer");
        session.setAttribute("noCustomer", null);

    }
    public boolean getNoCustomer() {
        return noCustomer != null && noCustomer;
    }

}

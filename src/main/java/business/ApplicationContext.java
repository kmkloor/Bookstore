
package business;

import business.category.CategoryDao;
import business.category.CategoryDaoJdbc;
import business.book.BookDao;
import business.book.BookDaoJdbc;
import business.customer.CustomerDao;
import business.customer.CustomerDaoJdbc;
import business.order.*;


public class ApplicationContext {

    private CategoryDao categoryDao;
    private BookDao bookDao;
    private CustomerDao customerDao;
    private LineItemDao lineItemDao;
    private OrderDao orderDao;
    private OrderService orderService;


    public static ApplicationContext INSTANCE = new ApplicationContext();

    private ApplicationContext() {
        categoryDao = new CategoryDaoJdbc();
        bookDao = new BookDaoJdbc();
        customerDao = new CustomerDaoJdbc();
        orderDao = new OrderDaoJdbc();
        lineItemDao = new LineItemDaoJdbc();
        orderService = new DefaultOrderService();
        DefaultOrderService service = (DefaultOrderService) orderService;
        service.setBookDao(bookDao);
        service.setCustomerDao(customerDao);
        service.setOrderDao(orderDao);
        service.setLineItemDao(lineItemDao);
    }

    public CategoryDao getCategoryDao() {
        return categoryDao;
    }

    public BookDao getBookDao() {
        return bookDao;
    }

    public CustomerDao getCustomerDao() {
        return customerDao;
    }

    public LineItemDao getLineItemDao() {
        return lineItemDao;
    }

    public OrderDao getOrderDao() {
        return orderDao;
    }

    public OrderService getOrderService() {
        orderService = new DefaultOrderService();

        DefaultOrderService service = (DefaultOrderService) orderService;
        service.setBookDao(bookDao);
        service.setCustomerDao(customerDao);
        service.setOrderDao(orderDao);
        service.setLineItemDao(lineItemDao);
        return orderService;
    }

}

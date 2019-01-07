package viewmodel;

import business.ApplicationContext;
import business.book.Book;
import business.book.BookDao;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class HomepageViewModel extends BaseViewModel{

    private List<Book> randomBooks;

    public HomepageViewModel(HttpServletRequest request) {
        super(request);
        BookDao bookDao = ApplicationContext.INSTANCE.getBookDao();
        randomBooks = chooseRandom(bookDao.allBooks(), 3);
    }

    public List<Book> chooseRandom(List<Book> allBooks, int n) {
        List<Book> copy = new ArrayList<>(allBooks);
        Collections.shuffle(copy);
        return copy.subList(0, n);
    }


    public List<Book> getRandomBooks() { return randomBooks; }

}

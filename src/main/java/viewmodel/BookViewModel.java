package viewmodel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import business.category.Category;
import business.category.CategoryDao;
import business.book.Book;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import business.ApplicationContext;

import business.book.BookDao;



public class BookViewModel extends BaseViewModel{

    private List<Category> selectedCategories;
    private List<Book> selectedBooks;

    public BookViewModel(HttpServletRequest request) {
        super(request);
        String bookTitle = request.getParameter("book");
        CategoryDao categoryDao = ApplicationContext.INSTANCE.getCategoryDao();
        BookDao bookDao = ApplicationContext.INSTANCE.getBookDao();
        selectedBooks = new ArrayList<Book>();
        selectedCategories = new ArrayList<Category>();
        if(!bookTitle.isEmpty()) {
            findBooks(bookTitle, bookDao, categoryDao);
        }

    }

    private void findBooks(String bookTitle, BookDao bookDao, CategoryDao categoryDao){
        selectedBooks = new ArrayList<Book>();
        selectedCategories = new ArrayList<Category>();
        for (Book book: bookDao.allBooks()){
            if (Pattern.compile(Pattern.quote(bookTitle), Pattern.CASE_INSENSITIVE).matcher(book.getTitle()).find()){
                selectedBooks.add(book);
                Category check = categoryDao.findByCategoryId(book.getCategoryId());
                if (!hasCategory(check)) {
                    selectedCategories.add(check);
                }
            }
        }

    }


    private boolean hasCategory (Category check) {
        for (Category category : selectedCategories) {
            if (category.getCategoryId() == check.getCategoryId()) {
                return true;
            }
        }
        return false;
    }

    public List<Category> getSelectedCategories() { return selectedCategories; }
    public List<Book> getSelectedBooks() { return selectedBooks; }
    public boolean matchesExist() {
        if (selectedBooks.size() > 0) {
            return true;
        }
        else return false;
    }
}

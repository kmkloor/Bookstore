package viewmodel;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import business.category.Category;
import business.category.CategoryDao;
import business.book.Book;
import java.util.List;
import business.ApplicationContext;

import business.book.BookDao;



public class CategoryViewModel extends BaseViewModel{

    private Category selectedCategory;
    private List<Book> selectedCategoryBooks;

    public CategoryViewModel(HttpServletRequest request) {
        super(request);
		HttpSession session = request.getSession();
        String categoryName = request.getParameter("category");
        CategoryDao categoryDao = ApplicationContext.INSTANCE.getCategoryDao();
        BookDao bookDao = ApplicationContext.INSTANCE.getBookDao();
        selectedCategory = recallSelectedCategory(session);
        if (isValidName(categoryName, categoryDao)){
            selectedCategory = categoryDao.findByName(categoryName);
            selectedCategoryBooks = bookDao.findByCategoryId(selectedCategory.getCategoryId());
			rememberSelectedCategory(session, selectedCategory);
        }
        else if (isAll(categoryName) || selectedCategory == null || isAll(selectedCategory.getName())){
            Category all = new Category (0, "All");
            selectedCategory = all;
            selectedCategoryBooks = bookDao.allBooks();
            rememberSelectedCategory(session, selectedCategory);
        }
        else {
                selectedCategoryBooks = bookDao.findByCategoryId(selectedCategory.getCategoryId());
            }

    }


    public boolean isValidName(String cat, CategoryDao catDao){
        if (cat == null || catDao.findByName(cat) == null) {
            return false;
        }
        return true;
    }

    public boolean isAll(String cat){
        if (cat != null && cat.equalsIgnoreCase("all")) {
            return true;
        }
        return false;
    }
	private Category recallSelectedCategory(HttpSession session) {
        return (Category) session.getAttribute("selectedCategory");
    }
    private void rememberSelectedCategory(HttpSession session, Category selectedCategory) {
        session.setAttribute("selectedCategory", selectedCategory);
    }
    public Category getSelectedCategory() { return selectedCategory; }
    public List<Book> getSelectedCategoryBooks() { return selectedCategoryBooks; }
}

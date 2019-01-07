
package business.category;

public class Category {

    private long categoryId;
    private String name;

    public Category(long categoryId, String name) {
        this.categoryId = categoryId;
        this.name = capitalizeFirstLetter(name);
    }

    public long getCategoryId() {
        return categoryId;
    }

    public String getName() {
        return name;
    }

    public String capitalizeFirstLetter(String original) {
        if (original == null || original.length() == 0) {
            return original;
        }
        return original.substring(0, 1).toUpperCase() + original.substring(1);
    }
    @Override
    public String toString() {
        return "Category{" +
                "categoryId=" + categoryId +
                ", name='" + name + '\'' +
                '}';
    }
}

package business.book;

public class Book {

	public long bookId;
	public String title;
    public String author;
    public int price;
	public boolean ispublic;
	public long categoryId;
	
	public Book(long bookId, String title,String author,int price,boolean ispublic,long categoryId)
    {  	this.bookId = bookId;
		this.title = title;
		this.author = author;
		this.price = price;
		this.ispublic = ispublic;
		this.categoryId = categoryId;
    }
	
	//*get 
	
	public long getBookId()
	{
		return bookId;
	}
	
	public String getTitle()
	{
		return title;
	}
	
    public String getAuthor()
	{
		return author;
	}
	
    public int getPrice()
	{
		return price;
	}
	
	public boolean getIsPublic() { return ispublic; }
	
	public long getCategoryId()
	{
		return categoryId;
	}
	
	//* set
	
	public void setBookId(long bookId)
	{
		this.bookId = bookId;
	}
	
	public void setTitle(String title)
	{
		this.title = title;
	}
	
    public void setAuthor(String author)
	{
		this.author = author;
	}
	
    public void setPrice(int price)
	{
		this.price = price;
	}
	
	public void setIsPublic(boolean ispublic) { this.ispublic = ispublic; }
	
	public void setCategoryId(long categoryId)
	{
		this.categoryId = categoryId;
	}
	
	    @Override
    public String toString() {
        return "Book{" +
                "bookId=" + bookId +
                ", title='" + title + '\'' +
				", author='" + author + '\'' +
				", price='" + price + '\'' +
				", is public='" + ispublic + '\'' +
				", categoryId='" + categoryId + '\'' +
                '}';
    }
	
	
	
	
}

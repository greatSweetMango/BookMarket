package dao;
import java.util.ArrayList;
import dto.Book;
public class BookRepository {
    ArrayList<Book>listOfBooks=new ArrayList<Book>();
    private static BookRepository instance = new BookRepository();
    public static BookRepository getInstance(){
		return instance;
	} 
    public BookRepository(){
        
        Book book1=new Book("Num1","여성과 광기",28000);
        book1.setDescription("전 세계 3백만 부 판매, 페미니즘의 고전");
        book1.setCategory("인문 에세이");
        book1.setPublisher("위고");
        book1.setAuthor("필리스 체슬러");
        book1.setTotalPages(580);
        book1.setUnitsInStock(1500);
        book1.setReleaseDate("2021/09/25");
        book1.setCondition("New");
        book1.setFilename("P1234.png");
        
        Book book2=new Book("Num2","너의 이름은",6300);
        book2.setDescription("키미노 나마에와?!");
        book2.setCategory("IT");
        book2.setPublisher("대원씨아이");
        book2.setAuthor("신카이 마코토 新海誠");
        book2.setTotalPages(238);
        book2.setUnitsInStock(2000);
        book2.setReleaseDate("2016/12/28");
        book2.setCondition("Refurbished");
        book2.setFilename("P1235.png");
        
        
        Book book3=new Book("Num3","북유럽 신화",27000);
        book3.setDescription("북유럽 신화의 다양한 판본 가운데 가장 쉽고, 재미있고, 매혹적인 작품!");
        book3.setCategory("세계의 신화와 전설");
        book3.setPublisher("나무의철학");
        book3.setAuthor("닐 게이먼 (Neil gaiman)");
        book3.setTotalPages(312);
        book3.setUnitsInStock(3000);
        book3.setReleaseDate("2020/05/01");
        book3.setCondition("Old");
        book3.setFilename("P1236.png");
        
        listOfBooks.add(book1);
        listOfBooks.add(book2);
        listOfBooks.add(book3);
    }
    public ArrayList<Book> getAllBooks(){
        return listOfBooks;
    }
    public Book getBookById(String bookId)
    {
        Book bookByid=null;
        
        for(int i=0;i<listOfBooks.size();i++)
        {
            Book book=listOfBooks.get(i);
            if(book!=null&&book.getBookId()!=null&&book.getBookId().equals(bookId))
            {
                bookByid=book;
                break;
            }
        }
        return bookByid;
    }
    
    public void addBook(Book book) {
		listOfBooks.add(book);
	}
}
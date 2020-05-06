package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import test.DB;

public class BookDAO {
	private static List<Book> bookFrom(ResultSet result) throws SQLException {
			ArrayList<Book> list = new ArrayList<Book>();
			while (result.next()) {
				Book book = new Book();
				book.setId(result.getInt("id"));
				book.setTitle(result.getString("title"));
				book.setAuthor(result.getString("author"));
				book.setCategoryId(result.getInt("categoryId"));
				book.setCategoryName(result.getString("categoryName"));
				book.setPublisher(result.getString("publisher"));
				list.add(book);
			}
			
			return list;
	}
	
	public static List<Book> findAll() throws Exception {
		String sql = "SELECT b.*, c.categoryName " + 
					 "FROM book b LEFT JOIN category c ON b.categoryId = c.id";
		try (Connection connection = DB.getConnection("student1");
			 PreparedStatement statement = connection.prepareStatement(sql);
			 ResultSet result = statement.executeQuery()) {
			return bookFrom(result);
		}
	}
	
	public static List<Book> findByName(String name) throws Exception {
		String sql = "SELECT u.*, d.departmentName " + 
					 "FROM book u LEFT JOIN department d ON u.departmentId = d.id " +
					 "WHERE u.name LIKE ?";

		try (Connection connection = DB.getConnection("student1");
			 PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, "%" + name + "%");
			ResultSet result = statement.executeQuery();
			List<Book> list = bookFrom(result);
			result.close();
			return list;
		}
	}

	public static Book findById(int id) throws Exception {
		String sql = "SELECT u.*, d.departmentName " + 
					 "FROM book u LEFT JOIN department d ON u.departmentId = d.id " +
					 "WHERE u.id = ?";

		try (Connection connection = DB.getConnection("student1");
			 PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setInt(1, id);
			ResultSet result = statement.executeQuery();
			List<Book> list = bookFrom(result);
			result.close();
			return list.get(0);
		}
	}
}


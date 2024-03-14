package com.DAO;

import java.util.*;
import com.entity.BookDetails;
import com.entity.Cart;

public interface cartDAO {

	public boolean addcart(Cart c);
	
	public List<Cart> getBookByUser(int userId);
	
	public boolean deleteBook(int cid, int bid, int uid);


	public void removeAllCartItems(int userId);
	
}

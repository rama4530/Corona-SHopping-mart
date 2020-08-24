package net.application.corona.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import net.application.corona.dao.ProductDaoJdbcImpl;
import net.application.corona.exception.ProductException;
import net.application.corona.model.Item;
import net.application.corona.model.Product;

/**
 * Servlet implementation class ShoppingCartController
 */
@WebServlet("/ShoppingCartController")
public class ShoppingCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShoppingCartController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		ProductDaoJdbcImpl product=new ProductDaoJdbcImpl();
		HttpSession session= request.getSession();
		if(action.equals("orderNow")) {
			if(session.getAttribute("cart")==null) {
				List<Item> cart=new ArrayList<>();
				try {
					cart.add(new Item(product.getById(Integer.parseInt(request.getParameter("id"))),1));
					session.setAttribute("cart",cart);
				} catch (NumberFormatException | ProductException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
				List<Item> cart=(List<Item>) session.getAttribute("cart");
				int index=isExisting(Integer.parseInt(request.getParameter("id")), cart);
				if(index==-1) {
					try {
						cart.add(new Item(product.getById(Integer.parseInt(request.getParameter("id"))),1));
					} catch (NumberFormatException | ProductException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}else {
					int quantity=cart.get(index).getQuantity()+1;
					cart.get(index).setQuantity(quantity);		
				}

				session.setAttribute("cart",cart); 

			}

			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}else if(action.equals("delete")){
			List<Item> cart=(List<Item>) session.getAttribute("cart");
			int index=isExisting(Integer.parseInt(request.getParameter("id")), cart);
			cart.remove(index);
			session.setAttribute("cart", cart);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
	}


	private  int isExisting(int id,List<Item> cart) {
		for(int i=0;i<cart.size();i++) {
			if(cart.get(i).getP().getId()==id) {
				return i;
			}
		}
		return -1;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

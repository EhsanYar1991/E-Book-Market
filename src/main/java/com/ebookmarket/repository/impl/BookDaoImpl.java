package com.ebookmarket.repository.impl;

import com.ebookmarket.model.Book;
import com.ebookmarket.repository.BookDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by at on 4/23/2017.
 */
@Transactional
@Repository
public class BookDaoImpl implements BookDao {

    @Autowired
    private SessionFactory sessionFactory;



    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void save(Book book) {

        Session session = sessionFactory.getCurrentSession();
        session.save(book);
        session.flush();
    }

    public Book find(long id) {
        Session session = sessionFactory.getCurrentSession();
        Book book = session.get(Book.class, id);
        session.flush();
        return book;
    }

    public List<Book> findAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Book");
        List<Book> bookList = (List<Book>) query.list();
        session.flush();
        return bookList;
    }

    public void delete(long id) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(find(id));
        session.flush();
    }

    public void update(Book book){
        Session session = sessionFactory.getCurrentSession();
        session.update(book);
        session.flush();
    }

    public void saveOrUpdate(Book book){
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(book);
        session.flush();
    }
}

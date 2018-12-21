package com.ebookmarket.repository;

import com.ebookmarket.model.Book;

import java.util.List;

/**
 * Created by at on 4/23/2017.
 */
public interface BookDao {

    void save(Book book);
    Book find(long id);
    List findAll();
    void delete(long id);
    void update(Book book);
    void saveOrUpdate (Book book);


}

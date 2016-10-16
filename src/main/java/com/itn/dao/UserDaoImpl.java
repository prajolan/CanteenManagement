/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itn.dao;

import com.itn.entities.Users;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Hp
 */
@Repository//Tells the compiler that this class is repositorty which means this resides in persistance layer
//@Transactional
public class UserDaoImpl extends AbstractDao<Long, Users> implements UserDao {

    @Override
    public void save(Users u) {
        persist(u);
    }

    @Override
    public Users findById(long id) {
        return getByKey(id);

    }

    @Override
    public Users findByUserName(String userName) {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("userName", userName));
        return (Users) crit.uniqueResult();//Type casting
    }

    @Override
    public void deleteById(long id) {
        Users use = getByKey(id);
        //delete(use);
        use.setDel(true);
    }

    @Override
    public List<Users> findAll() {
//        return (List<Users>)findAllEntity();
        //Query query=getSession().createQuery("SELECT u FROM Users u WHERE u.firstName LIKE 'Pra%'");
        Query query=getSession().createQuery("SELECT u FROM Users u WHERE u.del=false"); //Displaying undeleted users
        return query.list();

    }

    @Override
    public void deleteAll() {
        Query query = getSession().createQuery("DELETE u FROM Users u");
    }

}

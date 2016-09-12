/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.itn.dao;

import com.itn.util.State;
import com.itn.entities.FoodInventory;
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
public class FoodInventoryDaoImpl extends AbstractDao<Long, FoodInventory> implements FoodInventoryDao {

    @Override
    public void save(FoodInventory fi) {
        persist(fi);
    }

    @Override
    public FoodInventory findById(long id) {
        return getByKey(id);
    }

    @Override
    public FoodInventory findByFoodName(String foodName) {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("foodName", foodName));
        return (FoodInventory) crit.uniqueResult();//Type casting    
    }

    @Override
    public void deleteById(long id) {
        FoodInventory fid = getByKey(id);
//        delete(fid);
        fid.setState(State.INACTIVE.getState());
    }

    @Override
    public void deleteAll() {
        Query query = getSession().createQuery("DELETE u FROM FoodInventory u");
    }

    @Override
    public List<FoodInventory> findAll() {
        //Does the character have to be u?? or can it be something else too??
        Query query = getSession().createQuery("SELECT u FROM FoodInventory u WHERE u.state = 'Active'"); //to display all queries
        return query.list();
    }

}

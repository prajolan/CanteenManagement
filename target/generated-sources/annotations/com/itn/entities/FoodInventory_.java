package com.itn.entities;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(FoodInventory.class)
public abstract class FoodInventory_ {

	public static volatile SingularAttribute<FoodInventory, Date> date;
	public static volatile SingularAttribute<FoodInventory, String> foodName;
	public static volatile SingularAttribute<FoodInventory, Integer> price;
	public static volatile SingularAttribute<FoodInventory, Boolean> del;
	public static volatile SingularAttribute<FoodInventory, Long> id;

}


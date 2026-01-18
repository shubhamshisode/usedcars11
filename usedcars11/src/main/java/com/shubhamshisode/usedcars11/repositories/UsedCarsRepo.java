package com.shubhamshisode.usedcars11.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import com.shubhamshisode.usedcars11.entities.UsedCar;

@Repository
public interface UsedCarsRepo extends JpaRepository<UsedCar, Integer>{
	

    List<UsedCar> findByCarid(Integer carid);

    List<UsedCar> findByOwnernameContainingIgnoreCase(String ownername);

    List<UsedCar> findByFueltype(String fueltype);

    List<UsedCar> findByOwnernameContainingIgnoreCaseAndFueltype(
            String ownername, String fueltype);
}



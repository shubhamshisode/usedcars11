package com.shubhamshisode.usedcars11.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shubhamshisode.usedcars11.entities.UsedCar;
import com.shubhamshisode.usedcars11.repositories.UsedCarsRepo;

@Service
public class UsedCarServices {

    @Autowired
    private UsedCarsRepo carsRepo;
  


    public UsedCar addNewCar(UsedCar car) {
        return carsRepo.save(car);  
    }

   
    public List<UsedCar> getAllCars() 
    {
        return carsRepo.findAll();
    }
  

   
    public UsedCar getCarById(int carid) {
        Optional<UsedCar> car = carsRepo.findById(carid);
        return car.orElseThrow(() -> new RuntimeException("Car not found with id: " + carid));
    }

	public void updateCar(UsedCar car) {
	
		 carsRepo.save(car); 
	}
		
	

	public void deleteCar(int carid) {
	
		carsRepo.deleteById(carid);
		
	}

}




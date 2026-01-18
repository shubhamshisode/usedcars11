package com.shubhamshisode.usedcars11.services;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shubhamshisode.usedcars11.entities.Enquiry;
import com.shubhamshisode.usedcars11.repositories.EnquiryRepo;

@Service
public class EnquiryServices {
	
	@Autowired
	private EnquiryRepo enqRepo;
	
	  
    public void addNewEnquiry(Enquiry e) 
    {
        enqRepo.save(e);
        
    }

   
    public List<Enquiry> getAllEnquiries() {
        return enqRepo.findAll();
    }
    public void deleteEnquiryById(int id) {
        if (!enqRepo.existsById(id)) {
            throw new RuntimeException("Enquiry not found");
        }
        enqRepo.deleteById(id);
    }

}

package com.shubhamshisode.usedcars11.controllers;


import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.shubhamshisode.usedcars11.entities.Enquiry;
import com.shubhamshisode.usedcars11.entities.UsedCar;

import com.shubhamshisode.usedcars11.services.EnquiryServices;
import com.shubhamshisode.usedcars11.services.UsedCarServices;

@Controller
@CrossOrigin(origins = "*")
public class CarController {

    @Autowired
    private UsedCarServices carServices;

    @Autowired
    private EnquiryServices enqServices;

    
    
    @GetMapping("/")
    public String homePage(Model model) {
        List<UsedCar> list = carServices.getAllCars();
        model.addAttribute("carlist", list);
        return "index.jsp";   
    }
    
    

    @PostMapping("/login")
    public String login(String username, String password) {
        if ("admin".equals(username) && "1234".equals(password)) {
            return "AdminPanel.jsp";     
        } else {
            return "LoginFailed.jsp";    
        }
    }

    
    
    @GetMapping("/newcar")
    public String newCar() {
        return "NewCarEntry.html";  
    }

    @PostMapping("/savecar")
    public String saveCar(@ModelAttribute UsedCar car, Model model) {

        UsedCar savedCar = carServices.addNewCar(car);  

        model.addAttribute("car", savedCar);   
        model.addAttribute("status", "ACTIVE");

        return "NewCarAdded.jsp";   
    }
    
    


    @GetMapping("/newenq")
    public String newEnq() 
    {
        return "NewEnquiry.html";
    }
     @PostMapping("/saveenq")
    public String saveEnquiry(@ModelAttribute Enquiry e, Model model) {

       
        enqServices.addNewEnquiry(e);

     
        model.addAttribute("enquiry", e);

        
        return "NewEnquiryAdded.jsp";
    }

    
    
    @GetMapping("/enquiry-list")
    public String enquiryList(Model model) {

        List<Enquiry> enquiryList = enqServices.getAllEnquiries();
        model.addAttribute("enquiryList", enquiryList);

       
        return "EnquiryAllList.jsp";
    }
    @PostMapping("/delete-enquiry/{id}")
    @ResponseBody
    public ResponseEntity<String> deleteEnquiry(@PathVariable int id) {
        enqServices.deleteEnquiryById(id);
        return ResponseEntity.ok("Deleted successfully");
    }

    
    
    
    @GetMapping("/all-cars")
    public String allListCars(Model model) {

        List<UsedCar> carsList = carServices.getAllCars();

        System.out.println("========== DEBUG ==========");
        System.out.println("Cars count = " + carsList.size());

        for (UsedCar c : carsList) {
            System.out.println(c.getBrand() + " | " + c.getModel());
        }
        System.out.println("===========================");

        model.addAttribute("carList", carsList);
        return "view-cars.jsp";
    }
    
    
    @GetMapping("/modify-cars")
    public String modifyCars(
            @RequestParam(required=false) Integer carid,
            @RequestParam(required=false) String ownername,
            @RequestParam(required=false) String fueltype,
            Model model) {

        
        List<UsedCar> carList = carServices.getAllCars();

        
        if (carid != null) {
            carList = carList.stream()
                    .filter(c -> c.getCarid() == carid)
                    .collect(Collectors.toList());
        }

        if (ownername != null && !ownername.isEmpty()) {
            carList = carList.stream()
                    .filter(c -> c.getOwnername().toLowerCase().contains(ownername.toLowerCase()))
                    .collect(Collectors.toList());
        }

        if (fueltype != null && !fueltype.isEmpty()) {
            carList = carList.stream()
                    .filter(c -> c.getFueltype().equalsIgnoreCase(fueltype))
                    .collect(Collectors.toList());
        }

        model.addAttribute("carList", carList);
        return "ModifyCar.jsp"; // your JSP
    }
    
    @PostMapping("/delete-car")
    public String deleteCar(@RequestParam("carid") int carid, RedirectAttributes redirectAttributes) {
        try {
            carServices.deleteCar(carid);
            redirectAttributes.addFlashAttribute("success", "Car deleted successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Delete failed: " + e.getMessage());
        }
        return "redirect:/modify-cars";
    }



    @GetMapping("/edit-car")
    public String editCar(@RequestParam("carid") int carid, Model model) {
        UsedCar car = carServices.getCarById(carid);
        model.addAttribute("car", car);
        return "EditCar.jsp"; 
    }
    @PostMapping("/update-car")
    public String updateCar(UsedCar car, RedirectAttributes redirectAttributes) {
        try {
            carServices.updateCar(car);   
            redirectAttributes.addFlashAttribute("success", "Car updated successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Update failed: " + e.getMessage());
        }
        return "redirect:/modify-cars";
    }





}


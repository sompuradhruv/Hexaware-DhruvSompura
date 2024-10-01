package project1;

import java.util.ArrayList;

class User {
    private String name;
    private ArrayList<Vehicle> rentedVehicles;

    public User(String name) {
        this.name = name;
        this.rentedVehicles = new ArrayList<>();
    }

    public void rentVehicle(Vehicle vehicle) {
        if (!vehicle.isRented()) {
            vehicle.rentVehicle();
            rentedVehicles.add(vehicle);
        } else {
            System.out.println("This vehicle is already rented.");
        }
    }

    public void returnVehicle(Vehicle vehicle) {
        if (rentedVehicles.contains(vehicle)) {
            vehicle.returnVehicle();
            rentedVehicles.remove(vehicle);
        } else {
            System.out.println("You have not rented this vehicle.");
        }
    }

    public void viewRentedVehicles() {
        if (rentedVehicles.isEmpty()) {
            System.out.println("No vehicles rented.");
        } else {
            System.out.println("Rented Vehicles:");
            for (Vehicle v : rentedVehicles) {
                System.out.println(v.getName());
            }
        }
    }
}

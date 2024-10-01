package project1;

abstract class Vehicle {
    private String name;
    private double pricePerDay;
    private boolean isRented;

    public Vehicle(String name, double pricePerDay) {
        this.name = name;
        this.pricePerDay = pricePerDay;
        this.isRented = false;
    }

    // Getter methods for encapsulation
    public String getName() {
        return name;
    }

    public double getPricePerDay() {
        return pricePerDay;
    }

    public boolean isRented() {
        return isRented;
    }

    // Setter method to update rental status
    public void setRented(boolean rented) {
        this.isRented = rented;
    }

    // Abstract methods to be implemented by subclasses
    public abstract void rentVehicle();
    public abstract void returnVehicle();
}

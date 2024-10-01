package project1;

class Bike extends Vehicle {
    public Bike(String name, double pricePerDay) {
        super(name, pricePerDay);
    }

    @Override
    public void rentVehicle() {
        if (!isRented()) {
            setRented(true);
            System.out.println("Bike " + getName() + " rented for $" + getPricePerDay() + " per day.");
        } else {
            System.out.println("Bike " + getName() + " is already rented.");
        }
    }

    @Override
    public void returnVehicle() {
        if (isRented()) {
            setRented(false);
            System.out.println("Bike " + getName() + " returned.");
        } else {
            System.out.println("Bike " + getName() + " is not rented.");
        }
    }
}


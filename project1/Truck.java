package project1;

class Truck extends Vehicle {
    public Truck(String name, double pricePerDay) {
        super(name, pricePerDay);
    }

    @Override
    public void rentVehicle() {
        if (!isRented()) {
            setRented(true);
            System.out.println("Truck " + getName() + " rented for $" + getPricePerDay() + " per day.");
        } else {
            System.out.println("Truck " + getName() + " is already rented.");
        }
    }

    @Override
    public void returnVehicle() {
        if (isRented()) {
            setRented(false);
            System.out.println("Truck " + getName() + " returned.");
        } else {
            System.out.println("Truck " + getName() + " is not rented.");
        }
    }
}

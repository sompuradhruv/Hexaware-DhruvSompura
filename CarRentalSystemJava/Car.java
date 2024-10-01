package project1;

class Car extends Vehicle {
    public Car(String name, double pricePerDay) {
        super(name, pricePerDay);
    }

    @Override
    public void rentVehicle() {
        if (!isRented()) {
            setRented(true);
            System.out.println("Car " + getName() + " rented for $" + getPricePerDay() + " per day.");
        } else {
            System.out.println("Car " + getName() + " is already rented.");
        }
    }

    @Override
    public void returnVehicle() {
        if (isRented()) {
            setRented(false);
            System.out.println("Car " + getName() + " returned.");
        } else {
            System.out.println("Car " + getName() + " is not rented.");
        }
    }
}

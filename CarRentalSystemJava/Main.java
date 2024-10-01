package project1;

import java.util.Scanner;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        // Create some vehicles
        Vehicle car = new Car("Honda Civic", 50);
        Vehicle bike = new Bike("Yamaha", 15);
        Vehicle truck = new Truck("Volvo", 100);
        
        // Create a user
        User user = new User("Dhruv");

        int choice;
        do {
            System.out.println("\nVehicle Rental System");
            System.out.println("1. Rent a Car");
            System.out.println("2. Rent a Bike");
            System.out.println("3. Rent a Truck");
            System.out.println("4. Return a Car");
            System.out.println("5. Return a Bike");
            System.out.println("6. Return a Truck");
            System.out.println("7. View Rented Vehicles");
            System.out.println("8. Exit");
            System.out.print("Enter your choice: ");
            choice = scanner.nextInt();

            switch (choice) {
                case 1:
                    user.rentVehicle(car);
                    break;
                case 2:
                    user.rentVehicle(bike);
                    break;
                case 3:
                    user.rentVehicle(truck);
                    break;
                case 4:
                    user.returnVehicle(car);
                    break;
                case 5:
                    user.returnVehicle(bike);
                    break;
                case 6:
                    user.returnVehicle(truck);
                    break;
                case 7:
                    user.viewRentedVehicles();
                    break;
                case 8:
                    System.out.println("Exiting...");
                    break;
                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        } while (choice != 8);
        
        scanner.close();
    }
}

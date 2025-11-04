package utils;

public class DistanceCalculator {

    
    public static double calculateDistance(String origin, String destination) {
    
        double distanceKm = 5 + (Math.random() * 20);
        System.out.println("DEBUG (Fallback): Fake distance between " + origin + " and " + destination + " = " + distanceKm + " km");
        return distanceKm;
    }

    
    public static double calculateFare(double distance, double perKmRate) {
        double baseFare = 20; // optional base fare
        double total = baseFare + (distance * perKmRate);
        System.out.println("DEBUG (Fallback): Fare calculated = ₹" + total);
        return total;
    }
}

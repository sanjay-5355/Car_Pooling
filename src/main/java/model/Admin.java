package model;

public class Admin {

	    private int totalTravelers;
	    private int totalOwners;
	    private int totalRides;
	    private double totalEarnings;
	    
		public int getTotalTravelers() {
			return totalTravelers;
		}
		public void setTotalTravelers(int totalTravelers) {
			this.totalTravelers = totalTravelers;
		}
		public int getTotalOwners() {
			return totalOwners;
		}
		public void setTotalOwners(int totalOwners) {
			this.totalOwners = totalOwners;
		}
		public int getTotalRides() {
			return totalRides;
		}
		public void setTotalRides(int totalRides) {
			this.totalRides = totalRides;
		}
		public double getTotalEarnings() {
			return totalEarnings;
		}
		public void setTotalEarnings(double totalEarnings) {
			this.totalEarnings = totalEarnings;
		}
		 
		@Override
		public String toString() {
			return "Admin [totalTravelers=" + totalTravelers + ", totalOwners=" + totalOwners + ", totalRides="
					+ totalRides + ", totalEarnings=" + totalEarnings + "]";
		}
	    
	    

}

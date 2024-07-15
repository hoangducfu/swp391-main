package model;

public class ReportData {

    private String paymentDate;
    private double totalAmount;
    private int totalOrders;
    private int totalCanceledOrders;
    private int totalFailedOrders;
    private int totalProcessingOrders; // Thêm thuộc tính này

    public ReportData(String paymentDate, double totalAmount, int totalOrders, int totalCanceledOrders, int totalFailedOrders, int totalProcessingOrders) {
        this.paymentDate = paymentDate;
        this.totalAmount = totalAmount;
        this.totalOrders = totalOrders;
        this.totalCanceledOrders = totalCanceledOrders;
        this.totalFailedOrders = totalFailedOrders;
        this.totalProcessingOrders = totalProcessingOrders;
    }

    public ReportData(String paymentDate, double totalAmount) {
        this.paymentDate = paymentDate;
        this.totalAmount = totalAmount;
    }
    
    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public int getTotalOrders() {
        return totalOrders;
    }

    public void setTotalOrders(int totalOrders) {
        this.totalOrders = totalOrders;
    }

    public int getTotalCanceledOrders() {
        return totalCanceledOrders;
    }

    public void setTotalCanceledOrders(int totalCanceledOrders) {
        this.totalCanceledOrders = totalCanceledOrders;
    }

    public int getTotalFailedOrders() {
        return totalFailedOrders;
    }

    public void setTotalFailedOrders(int totalFailedOrders) {
        this.totalFailedOrders = totalFailedOrders;
    }

    public int getTotalProcessingOrders() {
        return totalProcessingOrders;
    }

    public void setTotalProcessingOrders(int totalProcessingOrders) {
        this.totalProcessingOrders = totalProcessingOrders;
    }

}

package dto;

public class Coffee {
    private String id;
    private String name;
    private String origin;
    private int unitPrice;
    private String description;
    private String filename;

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getOrigin() { return origin; }
    public void setOrigin(String origin) { this.origin = origin; }
    public int getUnitPrice() { return unitPrice; }
    public void setUnitPrice(int unitPrice) { this.unitPrice = unitPrice; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getFilename() { return filename; }
    public void setFilename(String filename) { this.filename = filename; }
}

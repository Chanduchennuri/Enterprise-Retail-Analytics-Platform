# Defined Entities (CDM)

Customer

Order

Order Item

Product

Address 

Category

Supplier

Inventory

Warehouse

Store

Delivaries 

Payment

Shipment

Return

# Entity/Table Definitions 

1. Customer
    //Represents a person who purchases products through any sales channel.

2. Order
   // Represents a purchase transaction initiated by a customer.

3. Order Item 
    // Represents order items (products) by a customer

4. Product
    // Represents an item available for sale.

5. Category
     // Represents product caategories of different kinds.

6. Supplier 
     // Represents product supplier.

7. Inventory
     // Represents the quantity of products available at a warehouse or store location.

8. Warehouse 
    // Represents an intermediate storage for products storage.

9. Store
    // Represents a physical retail location where
       customers can purchase products.

10. Delivaries (Remove ) ?? Delivaries == Shipment -X
    //Represents product/order Item Delivary Details.

11. Payment 
    // Represents financial settlement for the product.

12. Shipment
    //Represents product / order Shipment Details.

13. Return
    //Represents Product Returns if any.
    
14. Address
    //Represents physical location information for customers,stores, warehouses and deliveries.
 
# Entity/Table Definitions 2 
1. CUSTOMER

Represents a person who purchases products through any channel.

2. ADDRESS (Customer/Store/Warehouse)

Represents address information for customers, stores and warehouses.

3. ORDER

Represents a purchase transaction initiated by a customer.

4. ORDER ITEM

Represents items (products) in an order.

5. CATEGORY

Represents product categories.

6. PRODUCT

Represents an item available for sale.

7. SUPPLIER

Represents product supplier.

8. INVENTORY

Represents quantity of products available at a location.

9. WAREHOUSE

Represents an intermediate storage location.

10. STORE

Represents a physical retail location.

11. PAYMENT

Represents financial settlement for an order.

12. SHIPMENT

Represents shipment details for an order.

13. RETURN

Represents returned products for an order.

14. ADDRESS (Delivery Address)

Represents delivery address for shipments.

# Business Processes Listed in Diagram

1. Order to Cash (O2C)

Customer places an order → Payment → Shipment → Revenue

2. Procure to Pay (P2P)

Supplier → Inventory/Warehouse → Product Availability

3. Return to Refund (R2R)

Customer Return → Inventory Adjustment → Refund


# 3 RELATIONSHIPS
      Legend:
      (1:1)
      (0:1:1) 
      (1:M)
      (0:1:M)
      (M:M)
    
# 4 Create Initial Relationship Matrix

Entity A	Relationship	Entity B
Customer	Places	          Order
Order	    Contains	      Product
Product	    Belongs To	      Category
Supplier	Supplies	      Product
Warehouse	Stores	          Inventory
Customer	Makes	          Payment
Order	    Generates	      Shipment
Order	    May Have	      Return

# 5: Business Rules

A customer can place many orders.

A customer cannot cancel order at delivary date.

An order must belong to exactly one customer.

An order must have a delivary date.

An order must contain at least one product.

A product belongs to one category.

A payment must be associated with an order.

A shipment cannot exist without an order.

A return cannot exist without an order.

A return product must be with one customer.

---------------------------------------------

A customer may have multiple addresses.

An address may belong to one customer.

A product must belong to a category.

A category may contain many products.

A warehouse stores many products.

Inventory must be associated with a product.

Inventory must belong to a location.

A payment must have a status.

A shipment must have a status.

A supplier may provide multiple products.

An order item references exactly one product.

An order may generate one or more shipments.

A returned item must belong to an order.

A warehouse may receive products from many suppliers.

Products may exist in multiple warehouse locations.



# Design Initial

Customer
   |
   | Places
   |
Order
   |
   | Contains
   |
Order Item
   |
   | References
   |
Product
   |
   | 
   |
Category

Supplier
   |
Product

Warehouse
   |
Inventory

Order
   |
Payment

Order
   |
Shipment

Order
   |
Return


# 6. Cardinality
      Customer -->Order
         1 customer can place many orders (1:M)

       Order --> Order Item
           contains Multiple order items
             (1:M)

        Product --> Order Item
            can appear in Many order Items 
            (1:M)

        Catergory --> Product
             One catefory contains many products 
               (1:M)

        Supplier -->Product
            1 Supplier can supply multiple products
             (1:M)

        Warehouse --> Inventory 
             contains multiple inventory Records
              (1:M)

        Order --> Payement
            1 order have one payment
               (1:1)

        Order --> Shipment
             1 order will be shipped only once
             (1:1)

        Order --> Return 
             1 order can be returned only once (1:1)

               
        

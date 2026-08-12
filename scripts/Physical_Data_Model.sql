Table Customer{
  Customer_iD INTEGER [primary key, increment]
  First_Name varchar [NOT NULL]
  Last_Name varchar
  Email varchar
  Phone_Number integer [NOT null]
  Created_date date
  Updated_by date
  Status customer_status

  }


Enum customer_status {
  ACTIVE
  INACTIVE
  SUSPENDED
}

Table Address{
  Address_Id int [pk, increment, not null]
  Country varchar [not null]
  State varchar(20)
  City varchar(20)
  Home_Address varchar(20)
  Pin_Code int
}

Table Orders{
  Order_Id INTEGER [primary key, INCREMENT]
  Customer_Id int
  Order_Date datetime [default: `now()`]
  Order_Status Order_Status
  Total_Amount int
}

ENUM Order_Status{
  BILLED
  SHIPPED
  DELIVERED
  CANCELLED
}
Table OrderItems{
  Orderitem_ID INTEGER [primary key]
  Order_Id int
  Product_Id int 
  Qunatity int
  Unit_Price int
  Line_Amount int


}

Table Payment{
  PAYMENT_ID INTEGER [primary key]
  Order_Id int 
   Payment_Date date
   Payment_Method varchar
   Amount float
   Payment_Status varchar
}

Table Shipment{
  SHIPMENT_ID integer [pk]
  Order_Id int [ref: > Orders.Order_Id, not null]
  Shipment_Date date
  Carrier varchar
  Tracking_Number int
  Shipment_Status shipment_status

}

ENUM shipment_status{
  BOARDING 
  SHIPPED 
  WAREHOUSE_REACHED
}

Table Categories{
  Category_id int [PK]
  Category_Name varchar
  description text                       // Optional description
  parent_category_id int [ref: > Categories.Category_id, not null] // Self-referencing FK for hierarchy
  Is_active boolean [default: true]      // Flag to enable/disable category
  Created_at datetime [default: `now()`] // Audit field
  Updated_at datetime                    // Audit field
}
Table Product{
  Product_Id INT [PK]
  Category_ID int
  OrderItem_Id int
  Product_Name varchar
  Description varchar
  SKU bigint
  Supplier_ID int
  Created_Date date
  Status int

}

Table ProductDetail {
  Product_id int [pk, not null, ref: - Product.Product_Id, unique]
  Description text
  Dimensions varchar
  Warranty_period varchar
}

Table Warehouse{
  Warehouse_Id int [pk]
  Inventory_Id int [ref: > Inventory.Inventory_Id, not null]
  Warehouse_Name varchar 
  Address_Id int
  Description varchar(20)
  SKU int
  Status warehouse_status
}
ENUM warehouse_status{
  ACTIVE 
  INACTIVE
}

Table Inventory{
  Inventory_Id int [pk]
  Product_Id int
  Warehouse_Id int
  Qunatity_Available int
  Last_Updated Date
}

Table Supplier{
  Supplier_ID int [pk]
  Product_Id int
  Supplier_Name varchar
  Address varchar2
  Status supplier_status
  SKU int
}

/*Bridge/Junction tables */
Table Product_OrderItems{
  Product_id int [ref: > Product.Product_Id, not null]
  OrderItem_Id int [Ref: > OrderItems.Orderitem_ID, not null]
   Quantity int [not null, default: 1]
  Unit_price decimal
  Discount decimal
   indexes {
    (Product_id, OrderItem_Id) [pk]
  }
}

Table Product_Supplier{
  Supplier_ID int [ref: > Supplier.Supplier_ID, not null]
  Product_Id int [ref: > Product.Product_Id, not null]
  Supply_price decimal [not null]        // agreed purchase price
  Lead_time_days int                     // delivery lead time
  Min_order_qty int                      // minimum order quantity
  Contract_id varchar                    // reference to contract/agreement
  Is_primary boolean [default: false]    // flag for preferred supplier
  Effective_date datetime                // when this relationship starts
  Expiry_date datetime                   // when contract ends

   indexes {
    (Supplier_ID, Product_Id) [pk]
  }
}
ENUM supplier_status{
  ACTIVE 
  INACTIVE
}
Table Customer_Address{
  Customer_Id int [ref: > Customer.Customer_iD, NOT NULL]
  Address_Id int [ref: > Address.Address_Id, not null]
  Address_type address_type
}

ENUM address_type{
  HOME 
  WORK 
  BILLING
  SHIPPING
}

Table Warehouse_Address{
  Warehouse_Id int [ref: > Warehouse.Warehouse_Id, not null]
  Address_Id int [ref: > Address.Address_Id, not null]
  Address_type warehouse_address_type   // e.g., MAIN, BACKUP, SHIPPING
  Is_primary boolean [default: false]   // flag for the primary address
  Effective_date datetime               // when this address became valid
  Expiry_date datetime                  // when this address is no longer valid

  indexes {
    (Warehouse_Id, Address_Id) [pk]
  }
}

REF: Orders.Customer_Id > Customer.Customer_iD
REF: Product.Category_ID > Categories.Category_id
REF: OrderItems.Order_Id > Orders.Order_Id
REF: Product.Product_Id < Inventory.Inventory_Id

REF: Payment.Order_Id > Orders.Order_Id


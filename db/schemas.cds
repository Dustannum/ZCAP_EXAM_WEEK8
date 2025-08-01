namespace db.schema;

entity Order {
    key OrderNumber            : String(10);

        @mandatory
        @assert.format: '[A-Z]+'
        DocumentType           : String(4) default 'NB';

        @mandatory
        CompanyCode            : Integer;

        @mandatory
        Supplier               : String(10);

        @mandatory
        PurchasingOrganization : String(4);

        @mandatory
        PurchasingGroup        : String(3);

        @mandatory
        @readonly
        CreatedDate            : Date;

        @mandatory
        @readonly
        CreatedBy              : String default '49227';
        OrderItem              : Composition of many OrderItem
                                     on OrderItem.OrderNumber = $self;

        @mandatory
        @readonly
        Sent                   : Boolean default false;
}

type Unit : String(2) enum {
    PC;
    KG;
    GR;
    MG
}

entity OrderItem {
    key OrderNumber         : Association to one Order;
    key OrderItemNumber     : Integer;
        MaterialNumber      : String(40);

        @readonly
        MaterialDescription : String;
        Quantity            : Double;
        Unit                : Unit;
        NetPrice            : Double;
        Plant               : String(4);
}

entity Material {
    key MaterialNumber      : String(40);
    key Language            : String(2);
        MaterialDescription : String
}

entity Vendor {
    key Supplier            : String(10);
        SupplierDescription : String;

        @readonly
        CountryRegion       : String(3)
}

entity Units {
    key Unit : String(2)
}

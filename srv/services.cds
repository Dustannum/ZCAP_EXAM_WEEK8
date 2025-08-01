using db.schema from '../db/schemas';

service MainService {
            @odata.draft.enabled
    entity Order     as projection on schema.Order
        actions {
            @(
                cds.odata.bindingparameter.name: '_it',
                Common.SideEffects             : {TargetProperties: ['_it/Sent']}
            )
            action SendtoSAPGUI();
        };

    entity OrderItem as projection on schema.OrderItem;

    entity Material  as projection on schema.Material;

    entity Vendor    as projection on schema.Vendor;

    entity Units     as projection on schema.Units;

    action CreateMaterial(Material: String(40) @mandatory, MaterialDescription: String @UI.MultiLineText );
    action CreateVendor(Supplier: String(10) @mandatory, SupplierDescription: String @UI.MultiLineText );

}

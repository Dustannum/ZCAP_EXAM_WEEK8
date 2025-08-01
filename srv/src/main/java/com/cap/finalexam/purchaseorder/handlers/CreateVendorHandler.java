package com.cap.finalexam.purchaseorder.handlers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sap.cds.ql.Insert;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.mainservice.Vendor;
import cds.gen.mainservice.CreateVendorContext;
import cds.gen.mainservice.Vendor_;

@Component
@ServiceName("MainService")
public class CreateVendorHandler implements EventHandler {
    
    @Autowired
    private PersistenceService db;

    @Before(event = CreateVendorContext.CDS_NAME, entity = Vendor_.CDS_NAME)
    public void checkVendorExistence(CreateVendorContext context) {

    }

    @On(event = CreateVendorContext.CDS_NAME, entity = Vendor_.CDS_NAME)
    public void onCreateVendor(CreateVendorContext context) {
        Vendor newVendor = Vendor.create();
        newVendor.setSupplier(context.getSupplier());
        newVendor.setSupplierDescription(context.getSupplierDescription());
        newVendor.setCountryRegion("ID");  
        db.run(Insert.into(Vendor_.CDS_NAME).entry(newVendor));
        context.setCompleted();
    }
}

package com.cap.finalexam.purchaseorder.handlers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sap.cds.Result;
import com.sap.cds.ql.Insert;
import com.sap.cds.ql.Select;
import com.sap.cds.ql.cqn.CqnSelect;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.mainservice.Material;
import cds.gen.mainservice.CreateMaterialContext;
import cds.gen.mainservice.Material_;

@Component
@ServiceName("MainService")
public class CreateMaterialHandler implements EventHandler {
    
    @Autowired
    private PersistenceService db;

    @Before(event = CreateMaterialContext.CDS_NAME, entity = Material_.CDS_NAME)
    public void checkMaterialExistence(CreateMaterialContext context) {
        CqnSelect select = Select.from(Material_.CDS_NAME).columns(c -> c.get("Material"));
        Result materials = db.run(select);
/*         context.getCqn().entries().forEach(entry -> {
            if (Result.contains(context.getMaterial())) {

            }
        }); */
    }

    @On(event = CreateMaterialContext.CDS_NAME, entity = Material_.CDS_NAME)
    public void onCreateMaterial(CreateMaterialContext context) {
        Material newMaterial = Material.create();
        newMaterial.setMaterialNumber(context.getMaterial());
        newMaterial.setMaterialDescription(context.getMaterialDescription());
        newMaterial.setLanguage("EN");
        db.run(Insert.into(Material_.CDS_NAME).entry(newMaterial));
        context.setCompleted();
    }
}

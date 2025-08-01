package com.cap.finalexam.purchaseorder.handlers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sap.cds.services.draft.DraftNewEventContext;
import com.sap.cds.ql.Select;
import com.sap.cds.ql.cqn.CqnSelect;
import com.sap.cds.services.ServiceException;
import com.sap.cds.services.cds.CdsCreateEventContext;
import com.sap.cds.services.cds.CqnService;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.After;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.mainservice.Material_;
import cds.gen.mainservice.OrderItem;
import cds.gen.mainservice.OrderItem_;

@Component
@ServiceName("MainService")
public class CreateOrderItemHandler implements EventHandler {

    @Autowired
    private PersistenceService db;

    @Before
    public void generateOrderItemNumber(DraftNewEventContext context, OrderItem orderItem) {

    }

    @Before(event = CqnService.EVENT_CREATE, entity = OrderItem_.CDS_NAME)
    public void checkQuantity(CdsCreateEventContext context) {
        context.getCqn().entries().forEach(entry -> {
            if (Integer.parseInt(entry.get("Quantity").toString()) <= 0) {
                throw new ServiceException("Quantity must be > 0");
            }
        });
    }

    @Before(event = CqnService.EVENT_CREATE, entity = OrderItem_.CDS_NAME)
    public void checkNetPrice(CdsCreateEventContext context) {
        context.getCqn().entries().forEach(entry -> {
            if (Integer.parseInt(entry.get("NetPrice").toString()) <= 0) {
                throw new ServiceException("Net Price must be > 0");
            }
        });
    }

    @After(event = CqnService.EVENT_CREATE, entity = OrderItem_.CDS_NAME)
    public void fillMaterialDescription(CdsCreateEventContext context, OrderItem orderItem) {
        CqnSelect select = Select.from(Material_.CDS_NAME).columns(c -> c.get("MaterialDescription"));
        String matDesc = db.run(select).toString();
        orderItem.setMaterialDescription(matDesc);
    }
}

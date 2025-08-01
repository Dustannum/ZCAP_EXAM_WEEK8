package com.cap.finalexam.purchaseorder.handlers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sap.cds.ql.Update;
import com.sap.cds.ql.cqn.CqnUpdate;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.mainservice.Order;
import cds.gen.mainservice.OrderSendtoSAPGUIContext;
import cds.gen.mainservice.Order_;

@Component
@ServiceName("MainService")
public class SendtoSAPGUIHandler implements EventHandler {
    
    @Autowired
    private PersistenceService db;

    @On(event=OrderSendtoSAPGUIContext.CDS_NAME, entity = Order_.CDS_NAME)
    public void onSendtoSAPGUI(OrderSendtoSAPGUIContext context) {
        Order order = db.run(context.getCqn()).single(Order.class);
        order.setSent(true);

        CqnUpdate update = Update.entity(Order_.CDS_NAME).entry(order);
        db.run(update);

        context.setCompleted();
    }
}

package com.cap.finalexam.purchaseorder.handlers;

import java.time.LocalDate;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.sap.cds.ql.Select;
import com.sap.cds.ql.cqn.CqnSelect;
import com.sap.cds.services.draft.DraftNewEventContext;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.mainservice.Order;
import cds.gen.mainservice.Order_;

@Component
@ServiceName("MainService")
public class CreateOrderHandler implements EventHandler {

    @Autowired
    private PersistenceService db;

    @Before
    public void generateOrderNumber(DraftNewEventContext context, Order order) {
        CqnSelect select = Select.from(Order_.CDS_NAME).columns(c -> c.get("OrderNumber")).orderBy(o -> o.get("OrderNumber").desc());
        Optional<Order> lastOrder = db.run(select).first(Order.class);
        if (lastOrder.isPresent()) {
            String num_last = lastOrder.get().getOrderNumber();
            Long num_int = Long.parseLong(num_last);
            order.setOrderNumber(String.valueOf(num_int + 1));
        } else {
            order.setOrderNumber("4500000001");
        }
    }

    @Before
    public void setCreatedDate(DraftNewEventContext context, Order order) {
        order.setCreatedDate(LocalDate.now());
    }
}

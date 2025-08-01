sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'orderitem/test/integration/FirstJourney',
		'orderitem/test/integration/pages/OrderItemList',
		'orderitem/test/integration/pages/OrderItemObjectPage'
    ],
    function(JourneyRunner, opaJourney, OrderItemList, OrderItemObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('orderitem') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheOrderItemList: OrderItemList,
					onTheOrderItemObjectPage: OrderItemObjectPage
                }
            },
            opaJourney.run
        );
    }
);
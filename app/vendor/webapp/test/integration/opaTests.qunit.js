sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'vendor/test/integration/FirstJourney',
		'vendor/test/integration/pages/VendorList',
		'vendor/test/integration/pages/VendorObjectPage'
    ],
    function(JourneyRunner, opaJourney, VendorList, VendorObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('vendor') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheVendorList: VendorList,
					onTheVendorObjectPage: VendorObjectPage
                }
            },
            opaJourney.run
        );
    }
);
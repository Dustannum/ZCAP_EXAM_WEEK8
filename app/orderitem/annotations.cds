using MainService as service from '../../srv/services';
annotate service.OrderItem with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Ordernumberordernumber}',
                Value : OrderNumber_OrderNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Orderitemnumber}',
                Value : OrderItemNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Quantity}',
                Value : Quantity,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Unit}',
                Value : Unit,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Netprice}',
                Value : NetPrice,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Plant}',
                Value : Plant,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : '{i18n>GeneralInformation}',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Material}',
            ID : 'Material',
            Target : '@UI.FieldGroup#Material',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Ordernumberordernumber}',
            Value : OrderNumber_OrderNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Orderitemnumber}',
            Value : OrderItemNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Materialnumber}',
            Value : MaterialNumber,
        },
    ],
    UI.SelectionFields : [
        OrderNumber_OrderNumber,
    ],
    UI.FieldGroup #Material : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : MaterialNumber,
                Label : '{i18n>Materialnumber}',
            },
            {
                $Type : 'UI.DataField',
                Value : MaterialDescription,
                Label : '{i18n>Materialdescription}',
            },
        ],
    },
    UI.UpdateHidden : true,
    UI.DeleteHidden : true,
    UI.SelectionPresentationVariant #table : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
    },
);

annotate service.OrderItem with {
    OrderNumber @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Order',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : OrderNumber_OrderNumber,
                    ValueListProperty : 'OrderNumber',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'DocumentType',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'CompanyCode',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Supplier',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'PurchasingOrganization',
                },
            ],
        },
        Common.Label : '{i18n>Ordernumberordernumber}',
    )
};


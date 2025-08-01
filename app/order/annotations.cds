using MainService as service from '../../srv/services';
annotate service.Order with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Ordernumber}',
                Value : OrderNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Documenttype}',
                Value : DocumentType,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Companycode}',
                Value : CompanyCode,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Supplier}',
                Value : Supplier,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Purchasingorganization}',
                Value : PurchasingOrganization,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Purchasinggroup}',
                Value : PurchasingGroup,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Createddate}',
                Value : CreatedDate,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Createdby}',
                Value : CreatedBy,
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
            Label : '{i18n>Orderitems}',
            ID : 'OrderItems',
            Target : 'OrderItem/@UI.LineItem#OrderItems',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Ordernumber}',
            Value : OrderNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Documenttype}',
            Value : DocumentType,
        },
        {
            $Type : 'UI.DataField',
            Value : CreatedDate,
            Label : '{i18n>Createddate}',
        },
        {
            $Type : 'UI.DataField',
            Value : Sent,
            Label : '{i18n>Sent}',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'MainService.SendtoSAPGUI',
            Label : '{i18n>Sendtosapgui}',
        },
    ],
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
    UI.SelectionFields : [
        OrderNumber,
        CreatedDate,
        Sent,
    ],
    UI.HeaderInfo : {
        TypeImageUrl : 'sap-icon://customer-order-entry',
        TypeName : '',
        TypeNamePlural : '',
    },
);

annotate service.Order with {
    OrderNumber @Common.Label : '{i18n>Ordernumber}'
};

annotate service.Order with {
    CreatedDate @Common.Label : '{i18n>Createddate}'
};

annotate service.Order with {
    Sent @Common.Label : '{i18n>Sent}'
};

annotate service.OrderItem with @(
    UI.LineItem #OrderItems : [
        {
            $Type : 'UI.DataField',
            Value : OrderItemNumber,
            Label : '{i18n>Orderitemnumber}',
        },
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
        {
            $Type : 'UI.DataField',
            Value : Quantity,
            Label : '{i18n>Quantity}',
        },
        {
            $Type : 'UI.DataField',
            Value : Unit,
            Label : '{i18n>Unit}',
        },
        {
            $Type : 'UI.DataField',
            Value : NetPrice,
            Label : '{i18n>Netprice}',
        },
        {
            $Type : 'UI.DataField',
            Value : Plant,
            Label : '{i18n>Plant}',
        },
    ]
);


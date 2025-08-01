using MainService as service from '../../srv/services';
annotate service.Vendor with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Supplier}',
                Value : Supplier,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Supplierdescription}',
                Value : SupplierDescription,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Countryregion}',
                Value : CountryRegion,
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
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Supplier}',
            Value : Supplier,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Supplierdescription}',
            Value : SupplierDescription,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Countryregion}',
            Value : CountryRegion,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'MainService.CreateVendor',
            Label : '{i18n>Createvendor}',
        },
    ],
    UI.SelectionFields : [
        CountryRegion,
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
                {
                    $Type : 'UI.SelectOptionType',
                    PropertyName : CountryRegion,
                    Ranges : [
                        {
                            Sign : #I,
                            Option : #EQ,
                            Low : 'ID',
                        },
                    ],
                },
            ],
        },
    },
);

annotate service.Vendor with {
    CountryRegion @Common.Label : '{i18n>Countryregion}'
};


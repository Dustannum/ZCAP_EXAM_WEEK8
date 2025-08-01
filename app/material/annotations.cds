using MainService as service from '../../srv/services';
annotate service.Material with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Materialnumber}',
                Value : MaterialNumber,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Language}',
                Value : Language,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Materialdescription}',
                Value : MaterialDescription,
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
            Label : '{i18n>Materialnumber}',
            Value : MaterialNumber,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Materialdescription}',
            Value : MaterialDescription,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'MainService.CreateMaterial',
            Label : '{i18n>Creatematerial}',
        },
    ],
    UI.SelectionFields : [
        Language,
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
                    PropertyName : Language,
                    Ranges : [
                        {
                            Sign : #I,
                            Option : #EQ,
                            Low : 'EN',
                        },
                    ],
                },
            ],
        },
    },
);

annotate service.Material with {
    Language @Common.Label : '{i18n>Language}'
};


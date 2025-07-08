using ProcessorService as service from '../../srv/processor/processor-service';
using from '../../srv/services';

annotate CatalogService.Books with @(
    UI.SelectionFields : [
        author.ID,
        author.name,
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : author.name,
        },
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : author.name,
        },
        TypeImageUrl : 'sap-icon://alert',
    },
    UI.Facets : [
        {
            $Type : 'UI.CollectionFacet',
            Label : '{i18n>Overview}',
            ID : 'i18nOverview',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>GeneralInformation}',
                    ID : 'GeneralInformation',
                    Target : '@UI.FieldGroup#GeneralInformation',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : '{i18n>Details}',
                    ID : 'i18nDetails',
                    Target : '@UI.FieldGroup#i18nDetails',
                },
            ],
        },
    ],
    UI.FieldGroup #i18nDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : stock,
                Label : 'stock',
            },
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : 'title',
            },
            {
                $Type : 'UI.DataField',
                Value : author.name,
            },
        ],
    },
    UI.FieldGroup #Actions : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
    UI.FieldGroup #GeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : author.ID,
                Label : '{i18n>Authorid}',
            },
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : '{i18n>Id}',
            },
            {
                $Type : 'UI.DataField',
                Value : stock,
                Label : 'stock',
            },
            {
                $Type : 'UI.DataField',
                Value : title,
                Label : 'title',
            },
            {
                $Type : 'UI.DataField',
                Value : author.name,
            },
        ],
    },
);

annotate CatalogService.Authors with {
    ID @Common.Label : 'author/ID'
};

annotate CatalogService.Authors with {
    name @(
        Common.Label : '{i18n>Name1}',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Authors',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : name,
                    ValueListProperty : 'name',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};


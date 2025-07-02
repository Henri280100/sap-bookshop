using {sap.capire as sap} from '../db/schema';

service CatalogService {
    entity Books   as projection on sap.Books;
    entity Authors @readonly  as projection on sap.Authors;
    entity Orders @insertonly as projection on sap.Orders;
}

annotate CatalogService.Books with @odata.draft.enabled;
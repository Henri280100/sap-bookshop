namespace sap.capire;

using sap.capire.Books from '../schema';

using {
    managed,
    Country
} from '@sap/cds/common';


entity Orders : managed {
    key ID      : UUID;
        book    : Association to Books;
        country : Country;
        amount  : Integer;

}

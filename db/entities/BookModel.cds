namespace sap.capire;

using sap.capire.Authors from '../schema';

entity Books {
    key ID     : Integer;
        title  : localized String;
        author : Association to Authors;
        stock  : Integer;
}

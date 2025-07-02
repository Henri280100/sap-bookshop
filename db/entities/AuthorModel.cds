namespace sap.capire;

using sap.capire.Books from '../schema';

entity Authors {
    key ID    : Integer;
        name  : String;
        books : Association to many Books
                    on books.author = $self;
}

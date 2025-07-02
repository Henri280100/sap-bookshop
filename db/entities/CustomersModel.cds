namespace sap.capire;

using {
    managed,
    cuid,
} from '@sap/cds/common';
using sap.capire.Incidents from '../schema';


/**
 * Customers entitled to create support Incidents.
*/
entity Customers : cuid, managed {
    firstName : String;
    lastName  : String;
    email     : EMailAddress;
    phone     : PhoneNumber;
    incidents : Association to many Incidents
                    on incidents.customer = $self;
    name      : String = (
        firstName || ' ' || lastName
    ) stored;
}

type EMailAddress : String;
type PhoneNumber  : String;
type City         : String;

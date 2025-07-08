namespace sap.capire;

using {
    sap.capire.Customers,
    sap.capire.Urgency,
    sap.capire.Status,
    sap.capire.Conversations,
} from '../schema';

using {
    managed,
} from '@sap/cds/common';


/**
 * Incidents created by Customers.
*/
@odata.draft.enabled
entity Incidents : managed {
    key ID            : UUID;
        customer      : Association to Customers;
        title         : String @title: 'Title';
        urgency       : Association to Urgency;
        status        : Association to Status;
        conversations : Composition of many Conversations
                            on conversations.incidents = $self;
}

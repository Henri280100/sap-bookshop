namespace sap.capire;

using {
    managed,
    cuid,
} from '@sap/cds/common';

using sap.capire.Incidents from '../schema';


entity Conversations : cuid, managed {
    incidents : Association to Incidents;
    timestamp : DateTime;
    author    : String @cds.on.insert: $user;
    message   : String;
}

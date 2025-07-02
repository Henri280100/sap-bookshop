using {sap.capire as capire} from '../../db/schema';


service ProcessorService {
  entity Incidents     as projection on capire.Incidents;
  entity Customers     as projection on capire.Customers;
  entity Conversations as projection on capire.Conversations;
  entity Urgency       as projection on capire.Urgency;
  entity Status        as projection on capire.Status;
}

annotate ProcessorService.Incidents with @odata.draft.enabled;
// annotate ProcessorService.Customers with @odata.draft.enabled;


extend projection ProcessorService.Customers with {
  firstName || ' ' || lastName as name: String
}
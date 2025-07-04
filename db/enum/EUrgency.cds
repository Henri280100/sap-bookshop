using {sap.common.CodeList} from '@sap/cds/common';

namespace sap.capire;

entity Urgency : CodeList {
    key code : UrgencyCode;
    Criticality: CriticalityLevel;
}

type CriticalityLevel : Integer enum {
    Negative = 1;
    Critical = 2;
    Positive = 3;
}

type UrgencyCode : String enum {
    high = 'H';
    medium = 'M';
    low = 'L';
};

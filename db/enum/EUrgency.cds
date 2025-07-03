using {sap.common.CodeList} from '@sap/cds/common';

namespace sap.capire;


entity Urgency : CodeList {
    key code : UrgencyCode;

}

type UrgencyCode : String enum {
    high = 'H';
    medium = 'M';
    low = 'L';
};

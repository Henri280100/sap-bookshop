using {sap.common.CodeList} from '@sap/cds/common';

namespace sap.capire;

entity Status : CodeList {
    key code        : StatusCode;
        criticality : Integer;
}

type StatusCode : String enum {
    new = 'N';
    assigned = 'A';
    in_process = 'I';
    on_hold = 'H';
    resolved = 'R';
    closed = 'C';
}

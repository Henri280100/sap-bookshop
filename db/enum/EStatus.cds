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

// enum Status : CodeList {
//     key code        : String enum {
//             new = 'N';
//             assigned = 'A';
//             in_process = 'I';
//             on_hold = 'H';
//             resolved = 'R';
//             closed = 'C';
//         };
//         criticality : Integer;
// }

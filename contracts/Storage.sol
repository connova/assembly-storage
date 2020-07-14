pragma solidity >0.5.0;

contract Storage {
    bytes4  bytes4data = 0xaabbccdd;
    uint72  uintdata = 0x123456;
    bool    booldata = true;
    address addrdata = 0xdC962cEAb6C926E3a9B133c46c7258c0E371b82b;

    event Variables(
        bytes4 _a,
        uint72 _b,
        bool _c,
        address _d
    );

    function getData() public payable returns (bytes4 a,uint64 b,bool c,address d) {
            //bytes4 a;
            //uint72 b;
            //bool c;
            //address d;
        assembly {
        // return the values of bytes4data, uintdata, booldata, addrdata
            a := sload(bytes4data_slot)
            b := sload(uintdata_slot)
            c := sload(booldata_slot)
            d := sload(addrdata_slot)
        }
        emit Variables(a, b, c, d);
        return(a, b, c, d);
    }
}
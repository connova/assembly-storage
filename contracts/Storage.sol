pragma solidity >0.5.0;

contract Storage {
    bytes4  bytes4data = 0xaabbccdd;
    uint72  uintdata = 0x123456;
    bool    booldata = true;
    address addrdata = 0xdC962cEAb6C926E3a9B133c46c7258c0E371b82b;

    function getData() public view returns (bytes4 a,uint64 b,bool c,address d) {
        assembly {
        // return the values of bytes4data, uintdata, booldata, addrdata
           let loada := sload(bytes4data_slot)
           let loadb := sload(uintdata_slot)
           let loadc := sload(booldata_slot)
           let loadd := sload(addrdata_slot)

            a := shl(224, and(loada, 0xffffffff))
            b := shr(shl(3, uintdata_offset), loada)
            c := loadc
            d := loadd
        }
    }
}
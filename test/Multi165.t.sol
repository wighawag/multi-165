// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/Multi165.sol";

import "forge-std/console2.sol";

library Util {
    function consumeGasAndThrow(uint256 x) internal view returns(bool result) {
        uint256 r;
        uint256 numI = (x - 7000) / 2219;
        for (uint256 i = 0; i < numI; i++) {
            r = Util.getStorage(bytes32(i)).value;
        }
        if (r == 0) {
            revert();
        }
        return r != 0;
    }

    struct Uint256Slot {
        uint256 value;
    }

    function getStorage(bytes32 slot) internal pure returns (Uint256Slot storage r) {
        assembly {
            r.slot := slot
        }
    }
}

contract OutOfGasMock is IERC165 {
    function supportsInterface(bytes4) external view returns (bool) {
        Util.consumeGasAndThrow(30000000);
        revert();
    }
}

contract Mock is IERC165 {

    mapping(bytes4 => bool) _interfaceIdsSupported;
    constructor(bytes4[] memory interfaceIds) {
        for (uint256 i = 0; i < interfaceIds.length; i ++) {
            _interfaceIdsSupported[interfaceIds[i]] = true;
        }
    }
    function supportsInterface(bytes4 interfaceId) external view returns (bool result) {
        return _interfaceIdsSupported[interfaceId];
    }
}

contract HeavyMock is IERC165 {

    mapping(bytes4 => bool) _interfaceIdsSupported;
    constructor(bytes4[] memory interfaceIds) {
        for (uint256 i = 0; i < interfaceIds.length; i ++) {
            _interfaceIdsSupported[interfaceIds[i]] = true;
        }
    }
    function supportsInterface(bytes4 interfaceId) external view returns (bool result) {
        Util.consumeGasAndThrow(33620);
        return _interfaceIdsSupported[interfaceId];
    }
}

contract Multi165Test is Test {
    Multi165 multi165;
    function setUp() public {
        multi165 = new Multi165();
    }

    // function testOutOfGas() public {
    //     IERC165[] memory contracts = new IERC165[](1);
    //     contracts[0] = new OutOfGasMock();
    //     uint256 gas = gasleft();
    //     bool[] memory result = multi165.supportsInterface(contracts, 0xdddddddd);
    //     console.log(gas - gasleft());
    //     assertFalse(result[0]);
    // }

    // function testOne() public {
    //     IERC165[] memory contracts = new IERC165[](1);
    //     bytes4[] memory ids = new bytes4[](1);
    //     ids[0] = 0xdddddddd;
    //     contracts[0] = new Mock(ids);
    //     bool[] memory result = multi165.supportsInterface(contracts, 0xdddddddd);
    //     assertTrue(result[0]);
    // }

    function testLowGas() public {
        IERC165[] memory contracts = new IERC165[](1);
        bytes4[] memory ids = new bytes4[](1);
        ids[0] = 0xdddddddd;
        contracts[0] = new HeavyMock(ids);
        bool[] memory result = multi165.supportsInterface{gas:80000}(contracts, 0xdddddddd);
        console2.log(result[0]);
        assertFalse(result[0]);
    }

    // function test() public {
    //     IERC165[] memory contracts = new IERC165[](7);
    //     contracts[0] = new OutOfGasMock();
    //     contracts[1] = new OutOfGasMock();
    //     contracts[2] = new OutOfGasMock();
    //     contracts[3] = IERC165(address(1));
    //     contracts[4] = IERC165(address(0));

    //     bytes4[] memory ids = new bytes4[](1);
    //     ids[0] = 0xdddddddd;
    //     contracts[5] = new Mock(ids);
        
    //     contracts[6] = new Mock(new bytes4[](0));
        
    //     bool[] memory result = multi165.supportsInterface(contracts, 0xdddddddd);
        
    //     assertFalse(result[0]);
    //     assertFalse(result[1]);
    //     assertFalse(result[2]);
    //     assertFalse(result[3]);
    //     assertFalse(result[4]);
    //     assertTrue(result[5]);
    //     assertFalse(result[6]);
    // }


    // function testContracts() public {
    //     IERC165[] memory contracts = new IERC165[](7);
    //     contracts[0] = new OutOfGasMock();
    //     contracts[1] = new OutOfGasMock();
    //     contracts[2] = new OutOfGasMock();
        
    //     bytes4[] memory ids = new bytes4[](1);
    //     ids[0] = 0xdddddddd;
    //     contracts[5] = new Mock(ids);
        
    //     contracts[6] = new Mock(new bytes4[](0));

    //     contracts[3] = contracts[5];
    //     contracts[4] = contracts[6];

        
    //     bool[] memory result = multi165.supportsInterface(contracts, 0xdddddddd);
        
    //     assertFalse(result[0]);
    //     assertFalse(result[1]);
    //     assertFalse(result[2]);
    //     assertTrue(result[3]);
    //     assertFalse(result[4]);
    //     assertTrue(result[5]);
    //     assertFalse(result[6]);
    // }

    // function testMultiInterfaces() public {
    //     IERC165[] memory contracts = new IERC165[](8);
    //     contracts[0] = new OutOfGasMock();
    //     contracts[1] = new OutOfGasMock();
    //     contracts[2] = new OutOfGasMock();
    //     contracts[3] = IERC165(address(1));
    //     contracts[4] = IERC165(address(0));

    //     bytes4[] memory ids = new bytes4[](1);
    //     ids[0] = 0xdddddddd;
    //     contracts[5] = new Mock(ids);
        
    //     contracts[6] = new Mock(new bytes4[](0));

    //     ids = new bytes4[](3);
    //     ids[0] = 0xdddddddd;
    //     ids[1] = 0xdddddde1;
    //     ids[2] = 0xdddddde2;
    //     contracts[7] = new Mock(ids);
        
    //     ids = new bytes4[](2);
    //     ids[0] = 0xdddddddd;
    //     ids[1] = 0xdddddde1;
    //     bool[] memory result = multi165.supportsMultipleInterfaces(contracts, ids);
        
    //     assertFalse(result[0]);
    //     assertFalse(result[1]);
    //     assertFalse(result[2]);
    //     assertFalse(result[3]);
    //     assertFalse(result[4]);
    //     assertFalse(result[5]);
    //     assertFalse(result[6]);
    //     assertTrue(result[7]);
    // }
    
}

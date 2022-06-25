// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import "forge-std/Script.sol";
import "src/Multi165.sol";

import "forge-std/console2.sol";

contract Execute is Script{

    function run() external {

        IERC165[] memory contracts = new IERC165[](1);
        contracts[0] = IERC165(address(0x00b8c77482e45f1f44de1745f52c74426c631bdd52));

        bool[] memory result = new bool[](contracts.length);
        bytes memory callData = new bytes(36);
        assembly {            
            mstore(add(callData, 32), 0x01ffc9a700000000000000000000000000000000000000000000000000000000)
            mstore(add(callData, 36), 0x80ac58cd0000000000000000000000000000000000000000000000000000000)
        }
        for(uint256 i = 0; i < contracts.length; i++) {
            (bool success, bytes memory returndata) = address(contracts[i]).staticcall{gas: 31000}(callData);
            console2.log(success);
            console2.log(returndata.length);
            console2.logBytes(returndata);
            if (success && returndata.length > 0) {
                bytes32 data;
                assembly {
                        data := mload(add(returndata, 32))
                }
                result[i] = uint256(data) != 0;
            }
        }
    }   
}


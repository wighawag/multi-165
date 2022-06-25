// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import "forge-std/Script.sol";
import "src/Multi165.sol";

import "forge-std/console2.sol";

contract Execute is Script{

    function run() external {
        Multi165 multi = new Multi165();
        IERC165[] memory addresses = new IERC165[](1);
        addresses[0] = IERC165(address(0x00b8c77482e45f1f44de1745f52c74426c631bdd52));
        // bool[] memory result = multi.supportsInterface(addresses, 0x80ac58cd);
        // for (uint256 i = 0;  i < result.length; i++) {
        //     console2.log(result[i]);
        // }

        try multi.supportsInterface(addresses, 0x80ac58cd) returns (bool[] memory result) {
            for (uint256 i = 0;  i < result.length; i++) {
                console2.log(result[i]);
            }
        } catch {
            console2.log("failure");
        }
        
    }   
}
// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "forge-std/Script.sol";
import "src/Multi165.sol";

contract Multi165Deploy is Script{

    function run() external {
        vm.startBroadcast();
        new Multi165();
        vm.stopBroadcast();
    }   
}
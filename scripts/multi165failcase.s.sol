 // SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "forge-std/Script.sol";
import "src/Multi165.sol";

import "forge-std/console2.sol";

contract Execute is Script{

    function run() external {

        IERC165[] memory contracts = new IERC165[](1);
        contracts[0] = IERC165(address(0x00b8c77482e45f1f44de1745f52c74426c631bdd52));

        bool[] memory result = new bool[](contracts.length);
        for(uint256 i = 0; i < contracts.length; i++) {
            // if (!Address.isContract(address(contracts[i]))) {
            //     continue;
            // }
            try contracts[i].supportsInterface{gas: 30000}(0x80ac58cd) returns (bool a) {
                result[i] = a;
            } catch {
                console2.log("failure");
                // ensure there was enough gas ( >= 30,000) given to the `supportsInterface` call
                // Note that `{gas: 30000}` do not ensure that, it only protect the caller to not spend more than 30,000.
                // assert(gasleft() > 476); // 30,000 / 63
            }
        }
    }   
}


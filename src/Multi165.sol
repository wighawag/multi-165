// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IERC165 {function supportsInterface(bytes4 interfaceId) external view returns (bool);}


library Address {
    function isContract(address account) internal view returns (bool) {
        uint256 size;
        assembly {
            size := extcodesize(account)
        }
        return size > 0;
    }
}

contract Multi165 {

    function supportsInterface(IERC165[] calldata contracts, bytes4 interfaceId) public view returns (bool[] memory result) {
        result = new bool[](contracts.length);
        for(uint256 i = 0; i < contracts.length; i++) {
            if (!Address.isContract(address(contracts[i]))) {
                result[i] = false;
                continue;
            }
            try contracts[i].supportsInterface{gas: 31000}(interfaceId) returns (bool a) {
                result[i] = a;
            } catch {
                result[i] = false;
            }
        }
    }

    function supportsMultipleInterfaces(IERC165[] calldata contracts, bytes4[] calldata interfaceIds) public view returns (bool[] memory result) {
        result = new bool[](contracts.length);
        uint256 numI = contracts.length;
        for(uint256 i = 0; i < numI; i++) {
            if (!Address.isContract(address(contracts[i]))) {
                result[i] = false;
                continue;
            }

            result[i] = true;
            uint256 numJ = interfaceIds.length;
            for (uint256 j = 0; j < numJ; j ++) {
                bytes4 interfaceId = interfaceIds[j];
                try contracts[i].supportsInterface{gas: 31000}(interfaceId) returns (bool a) {
                    if (!a) {
                        result[i] = false;
                        break;
                    }
                } catch {
                    result[i] = false;
                    break;
                }
            }
        }
    }
}
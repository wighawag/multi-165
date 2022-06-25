// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract SafeMulticall {

    struct Call {
        address target;
        bytes callData;
        uint256 gas;
    }

    struct Result {
        bool success;
        bytes returnData;
    }

    // TODO add blockNumber / blockHash in the result ?
    function aggregateSameCallAcrossManyContracts(address[] calldata contracts, bytes calldata callData, uint256 gasLimit) public view returns (Result[] memory results) {
        results = new Result[](contracts.length);
        for(uint256 i = 0; i < contracts.length; i++) {
            (bool success, bytes memory returndata) = address(contracts[i]).staticcall{gas: gasLimit}(callData);
            // ensure there was enough gas ( >= gasLimit) given to the `supportsInterface` call
            // Note that `{gas: gasLimit}` do not ensure that, it only protect the caller to not spend more than gasLimit
            assert(gasleft() > gasLimit / 63);
            results[i].success = success;
            results[i].returnData = returndata;
        }
    }

    function aggregate(Call[] calldata calls) public view returns (Result[] memory results) {
        results = new Result[](calls.length);
        for(uint256 i = 0; i < calls.length; i++) {
            uint256 gasLimit = calls[i].gas;
            (bool success, bytes memory returndata) = address(calls[i].target).staticcall{gas: gasLimit}(calls[i].callData);
            // ensure there was enough gas ( >= gasLimit) given to the `supportsInterface` call
            // Note that `{gas: gasLimit}` do not ensure that, it only protect the caller to not spend more than gasLimit
            assert(gasleft() > gasLimit / 63);
            results[i].success = success;
            results[i].returnData = returndata;
        }
    }
}
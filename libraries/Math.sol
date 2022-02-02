// SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

library Math {
    // prevent divide by 0 error
    function divide(uint256 a, uint256 b) internal pure returns(uint256) {
        require(b > 0);
        uint256 c = a / b;
        return c;
    }
}
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

import "../libraries/SafeMath.sol";
// import "../libraries/Math.sol";

contract MyContract {
    using SafeMath for uint256;
    uint256 public value;

    function calculate(uint _value1, uint _value2) public {
        //value = _value1 / _value2;
        //value = Math.divide(_value1, _value2);
        value = _value1.div(_value2);
    }
}
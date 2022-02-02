// SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

contract ERC20Token {
    string public name;
    mapping(address => uint256) public balances;

    constructor(string memory _name) {
        name = _name;
    }

    function mint() virtual public {
        balances[tx.origin]++;
        // NOT msg.sender - msg.sender is the other contract!!
    }
}

// inheritance
contract MyToken is ERC20Token {
    
    address[] public owners;
    uint256 public ownerCount = 0;

    string public symbol;

    // Still pass name to inherited constructor but add new symbol input
    constructor(
        string memory _name, 
        string memory _symbol
    ) 
        ERC20Token(_name) 
    {
        symbol = _symbol;
    }

    // override 
    function mint() public override {
        super.mint(); // run inherited mint function
        ownerCount++;
        owners.push(msg.sender);
    }

    // Override name manually
    // string public name = "My Token";
}





contract EtherContract {

    address payable public wallet;
    address public token;

    constructor(address payable _wallet, address _token) {
        wallet = _wallet;
        token = _token;
    }

    // fallback/default function - external can only be called outside contract
    // function() external payable {
    //     buyToken();
    // }

    // payable keyword declares that ether can be sent to function
    function buyToken() public payable {
        ERC20Token(address(token)).mint();
        wallet.transfer(msg.value);

        // call event
        // emit Purchase(msg.sender, 1);
    }

    // Event
    // event Purchase(
    //     address _buyer,
    //     uint256 _amount
    // );
}
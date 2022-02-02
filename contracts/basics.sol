// SPDX-License-Identifier: MIT

// Declare solidity version: > 0.4.24;
pragma solidity ^0.8.1;

contract MyContract {
    
    address owner;

    modifier onlyOwner() {
        require(msg.sender == owner); // tells us the account address who called the function
        _;
    }

    // Make sure current time is beyond a certain opening time
    uint256 openingTime = 1643771053;
    modifier onlyWhileOpen {
        require(block.timestamp >= openingTime);
        _;
    }

    constructor() {
        owner = msg.sender;
    }
  
    uint256 public peopleCount = 0;
    mapping(uint => Person) public people;

    // Data struct
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }

    function addPerson(
        string memory _firstName,
        string memory _lastName
    )
        //onlyOwner
        onlyWhileOpen
        public
    {
        // people.push(Person(_firstName, _lastName));
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
    }

    function incrementCount() internal {
        peopleCount += 1;
    }
    // function getMostRecent() public view returns(Person memory) {
    //     return people[peopleCount-1];
    // }
    
    // Array of structs
    // Person[] public people;

    // Public function to change value
    // // Can't use when stringValue is set to constant
    // function set(string memory _value) public {
    //     stringValue = _value;
    // }

    // types
    // string public stringValue = "myValue";
    // bool public myBool = true;
    // int public myInt = 1;
    // uint public myUint = 1;
    // uint8 public myUint8 = 8;
    // uint256 public myUint256 = 8888; // default number of bits

    // enum - data structure
    // enum State { Waiting, Read, Active }
    // State public state;

    // constructor() public {
    //     state = State.Waiting;
    // }

    // function activate() public {
    //     state = State.Active;
    // }

    // function isActive() public view returns(bool) {
    //     return state == State.Active;
    // }
}
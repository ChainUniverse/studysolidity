// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleContract {
    address public owner;
    uint256 public value;
    string public message;
    
    event ValueUpdated(uint256 newValue, address updatedBy);
    event MessageUpdated(string newMessage, address updatedBy);
    
    constructor() {
        owner = msg.sender;
        value = 0;
        message = "Hello, World!";
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
    
    function setValue(uint256 _value) public {
        value = _value;
        emit ValueUpdated(_value, msg.sender);
    }
    
    function setMessage(string memory _message) public {
        message = _message;
        emit MessageUpdated(_message, msg.sender);
    }
    
    function getValue() public view returns (uint256) {
        return value;
    }
    
    function getMessage() public view returns (string memory) {
        return message;
    }
    
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner cannot be zero address");
        owner = newOwner;
    }
}
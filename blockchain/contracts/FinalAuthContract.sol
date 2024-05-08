// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FinalAuthContract {
    
    struct User {
        string username;
        string email;
        bytes32 hashedPassword;
    }

    mapping(string => User) private users;

    function register(string memory _username,string memory _email, string memory _password) public {
        bytes32 hashedPassword = keccak256(abi.encodePacked(_password));
        users[_username] = User(_username,_email,hashedPassword);
    }

    function login(string memory _username, string memory _password) public view returns (bool) {
        User memory user = users[_username];
        return (user.hashedPassword == keccak256(abi.encodePacked(_password)));
    }

}
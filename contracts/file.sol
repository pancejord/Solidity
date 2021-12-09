// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
contract File {

    struct testOne{
      address setBy;
      string comments;
      string fileName;
      bytes32 checkSum;
      uint timeStamp;
      bool isSet;
    }

    mapping (bytes32 => testOne) public myMap;


    event NewEvent(bytes32 _checkSum, string _filename, address indexed _setBy);

    function addEntry(bytes32 _checkSum, string memory _comments, string memory _filename) public{
     require (!myMap[_checkSum].isSet);
     myMap[_checkSum].isSet = true;
     myMap[_checkSum].comments = _comments;
     myMap[_checkSum].fileName = _filename;
     (myMap[_checkSum].timeStamp = block.timestamp);
     (myMap[_checkSum].setBy = msg.sender);

     emit NewEvent(_checkSum, _filename, msg.sender);
    }

     function viewSet(bytes32 _checkSum) public view returns(string memory, uint, string memory, address){
     require(!myMap[_checkSum].isSet);
     return (myMap[_checkSum].fileName,  myMap[_checkSum].timeStamp,  myMap[_checkSum].comments,  myMap[_checkSum].setBy);
     }


    }

   
    





    






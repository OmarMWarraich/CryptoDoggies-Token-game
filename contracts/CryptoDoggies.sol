// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract CryptoDoggies {
  
  // State variables & Math Operators
  uint age = 10;
  uint maxAge = age * 5;
  uint minAge = age - 5;
  uint ultraAge = age ** 2;
  uint modAge = age % 2;

  string name = "Doug";
  string name2 = "Karl";

  // Structs - Defining Doggies
  struct Doggy {
    string name;
    uint age;
    bytes5 dna;
  }

  // Array - Location of Doggies
  Doggy[] doggies;

  // Mapping - Store Doggy ID to Owner - Count of Doggies per Owner

  mapping (uint256 => address) private doggyIdToOwner;
  mapping (address => uint256) private ownerDoggyCount;
  
  // Events -

  event DoggyCreated(
    uint256 _id,
    string _name,
    uint _age,
    bytes5 _dna
  );

  Doggy doggy1 = Doggy({
    name: name,
    age: age,
    dna: bytes5(0x1234567890)
  });

  Doggy doggy2 = Doggy({
    name: name2,
    age: maxAge,
    dna: bytes5(0x0000000000)
  });

  // Function - 
  function newDoggyId() private view returns (uint256) {
    return doggies.length - 1;
  }

  function createDoggy(string memory _name, uint _age, bytes5 _dna) public {
    Doggy memory _doggy = Doggy({
      name: _name,
      age: _age,
      dna: _dna
    });

    doggies.push(_doggy);

    uint256 _newDoggyId = newDoggyId();

    doggyIdToOwner[_newDoggyId] = msg.sender;
    ownerDoggyCount[msg.sender] = ownerDoggyCount[msg.sender] + 1;

    emit DoggyCreated(_newDoggyId, _name, _age, _dna);
  }
}

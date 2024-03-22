// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract sendETH {
  // 1. pay the contract once its deployed
  constructor() payable { }

  // 2. directly sends to the contract
  receive() external payable { }
  // or
  // 3.
  fallback() external payable { }


  // 3 ways to send ETH
  // 1. if function call fails the transaction will fail
  function sendViaTransfer(address payable to) external payable{
    to.transfer(123);
  }

  // or
  // 2. returns boolean value to indicate if the transaction was successful or not
  function sendViaSend(address payable to) external payable{
    bool sent = to.send(123);
    require(sent, "tx failed");
  }

  // or
  // 3. forwards all gas, returns a boolean and data
  function sendViaCall(address payable to) external payable{
    (bool success, ) = to.call{value: 3000000000000}("");
    require(success, "call failed");
  }
}

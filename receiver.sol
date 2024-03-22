// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract receiveETH {
    event Log(uint amount, uint gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }
}
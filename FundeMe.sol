//Get funds from users
//withdraw funds
//set a minimum funding value in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract FundMe{
    uint256 public minimumUsd = 5;
    function fund() public payable {
        require(msg.value > 1e18, "did not send enough ETH"); //1e18 = 1 ETH = 1**18 wei
    //reverts actually undo any actions that have been done and send the remaining gas back
    }
}
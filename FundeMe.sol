//Get funds from users
//withdraw funds
//set a minimum funding value in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;
import {PriceConverter} from "PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint256; 
    uint256 public minimumUsd = 5e18;
    address[] public funders;
    mapping (address => uint256) public addressToAmountFunded;
    address public owner;

constructor(){
    owner = msg.sender;
}

    function fund() public payable {
        msg.value.getConversionRate();
        require(msg.value.getConversionRate() >= minimumUsd, "did not send enough ETH"); //1e18 = 1 ETH = 1**18 wei
    funders.push(msg.sender); 
    addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    //reverts actually undo any actions that have been done and send the remaining gas back
    } 
    function withdraw() public onlyOwner{
        // require(msg.sender == owner, "You cannot withdraw from other addresses!");
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;

        }
        funders = new address[](0);//resetting the array

        //transfer
        //send
        //call

        //msg.sender = address
        //payable(msg.sender) = payable address

        //transfer
        // payable (msg.sender).transfer(address(this).balance);
        //send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");
        //call
        (bool callSuccess,) =payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

    modifier onlyOwner(){ 
        require(msg.sender == owner, "Not authorized!");
        _;
        
    }
   
}
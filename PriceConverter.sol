

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter{
 function getPrice() internal  view returns (uint256){
        //Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306); // 0xcA143Ce32Fe7CD597c3EAbC66d021D4BDDd2938a
        (,int256 price,,,) = priceFeed.latestRoundData();
        //Price of ETH in terms of USD
        // 2000.00000000 (solidity does not have decimal places
        return uint256(price * 1e10);
        
    }
    function getConversionRate(uint ethAmount) internal  view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount)/ 1e10;
        return ethAmountInUsd;
    }

    function getVersion() internal view returns (uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }
}
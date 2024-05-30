// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {MissionChain} from "../src/MissionChain.sol";

contract MissionChainTest is Test {
    MissionChain public missionChain;

    function setUp() public {
        missionChain = new MissionChain();
    }

    function testSetMission() public {
        string memory companyName = "Company A";
        string memory missionCid = "CID123";

        missionChain.setMission(companyName, missionCid);

        (
            string memory actualCompanyName,
            string memory actualMissionCid
        ) = missionChain.getMission(address(this));

        assert(
            keccak256(abi.encodePacked(actualCompanyName)) ==
                keccak256(abi.encodePacked(companyName))
        );
        assert(
            keccak256(abi.encodePacked(actualMissionCid)) ==
                keccak256(abi.encodePacked(missionCid))
        );
    }
}

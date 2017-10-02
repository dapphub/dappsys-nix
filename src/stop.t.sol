/// stop.t.sol -- test for stop.sol

// Copyright (C) 2017  DappHub, LLC

// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND (express or implied).

pragma solidity ^0.4.13;

import "ds-test/test.sol";

import "./stop.sol";

contract User {

    TestThing thing;

    function User(TestThing thing_) public {
        thing = thing_;
    }

    function doToggle() public {
        thing.toggle();
    }

    function doStop() public {
        thing.stop();
    }

    function doStart() public {
        thing.start();
    }
}

contract TestThing is DSStop {

    bool public x;

    function toggle() public stoppable {
        x = x ? false : true;
    }
}

contract DSStopTest is DSTest {

    TestThing thing;
    User user;

    function setUp() public {
        thing = new TestThing();
        user = new User(thing);
    }

    function testSanity() public {
        thing.toggle();
        assertTrue(thing.x());
    }

    function testFailStop() public {
        thing.stop();
        thing.toggle();
    }

    function testFailStopUser() public {
        thing.stop();
        user.doToggle();
    }

    function testStart() public {
        thing.stop();
        thing.start();
        thing.toggle();
        assertTrue(thing.x());
    }

    function testStartUser() public {
        thing.stop();
        thing.start();
        user.doToggle();
        assertTrue(thing.x());
    }

    function testFailStopAuth() public {
        user.doStop();
    }

    function testFailStartAuth() public {
        user.doStart();
    }
}

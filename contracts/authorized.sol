/*
   Copyright 2016 Nexus Development

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/


pragma solidity ^0.4.2;

// import this as "auth.sol" and use "DSAuth"
import 'events.sol';
import 'authority.sol';

contract DSAuth {
    address      public  owner;
    DSAuthority  public  authority;

    function DSAuth() {
        owner = msg.sender;
    }

    function setOwner(address newOwner) auth {
        owner = newOwner;
    }

    function setAuthority(DSAuthority newAuthority) auth {
        authority = newAuthority;
    }

    modifier auth {
        if (!isAuthorized()) throw;
        _;
    }

    function isAuthorized() internal returns (bool) {
        if (msg.sender == owner) {
            return true;
        } else if (authority == 0) {
            return false;
        } else {
            return authority.canCall(msg.sender, this, msg.sig);
        }
    }
}

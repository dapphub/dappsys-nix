/*
   Copyright 2016 Nexus Development, LLC

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

pragma solidity ^0.4.8;

import "ds-token/token.sol";

contract DSVault is DSAuth {
    ERC20  public  token;

    function swap(ERC20 token_) auth {
        token = token_;
    }

    function push(address dst, uint wad) auth {
        assert(token.transfer(dst, wad));
    }
    function pull(address src, uint wad) auth {
        assert(token.transferFrom(src, this, wad));
    }

    function mint(uint wad) auth {
        DSToken(token).mint(wad);
    }
    function burn(uint wad) auth {
        DSToken(token).burn(wad);
    }

    function assert(bool x) {
        if (!x) throw;
    }
}




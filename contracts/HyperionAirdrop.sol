pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/ownership/Ownable.sol';
import './Hyperion.sol';

contract HyperionAirdrop is Ownable {
    address public token;

    constructor(address _token) public {
        token = _token;
    }

    function remainingSupply() public view onlyOwner returns (uint256) {
        return Hyperion(token).balanceOf(owner);
    }

    function balanceOf(address _who) public view onlyOwner returns (uint256) {
        return Hyperion(token).balanceOf(_who);
    }

    function transfer(address _to, uint256 _value) public onlyOwner returns (bool) {
        return Hyperion(token).transferFrom(owner, _to, _value);
    }

    function destroy() public onlyOwner {
        selfdestruct(owner);
    }
}

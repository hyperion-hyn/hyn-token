pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/math/SafeMath.sol';
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

    function decimalFactor() internal view returns (uint256) {
        uint8 decimals = Hyperion(token).decimals();
        return (10 ** uint256(decimals));
    }

    function transfer(address _to, uint256 _value) public onlyOwner returns (bool) {

        uint256 _number = SafeMath.mul(_value, decimalFactor());
        return Hyperion(token).transferFrom(owner, _to, _number);
    }

    function transfer(address[] _recipients, uint256[] _values) public onlyOwner returns (bool) {
        require(_recipients.length == _values.length);

        for(uint i = 0; i< _recipients.length; i++)
        {
            address _to = _recipients[i];
            uint256 _value = _values[i];

            require(transfer(_to, _value));
        }

        return true;
    }

    function destroy() public onlyOwner {
        selfdestruct(owner);
    }
}

pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol';
import 'openzeppelin-solidity/contracts/ownership/Ownable.sol';

contract Hyperion is StandardToken, Ownable {
    string  public constant name = "Hyperion Token";
    string  public constant symbol = "HYN";
    uint8   public constant decimals = 18;

    uint256 public constant INITIAL_SUPPLY = (10 * 1000 * 1000 * 1000) * (10 ** uint256(decimals));

    constructor() public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        emit Transfer(address(0), msg.sender, INITIAL_SUPPLY);
    }
}



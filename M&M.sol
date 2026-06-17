// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

/**
 * @title Token Menezes & Martins
 * @dev Token ERC20 com suprimento fixo para a Fundação Menezes & Martins.
 * * Informações Oficiais:
 * - Website: https://menezesemartins.size | https://menezesemartins.com.br
 * - X (Twitter): https://x.com/MenezeeMartins
 * - Governança: Diretoria Fundação Menezes & Martins
 * - Lastro/Garantia Pública: https://investidor10.com.br/wallet/public/2049552
 */
contract MenezesMartinsToken is ERC20, ERC20Permit {

    // O suprimento é fixo em 3.000.000.000 tokens.
    // Multiplicamos por 10^18 para accountar as 18 casas decimais padrão do ERC20.
    uint256 private constant INITIAL_SUPPLY = 3000000000 * 10**18;

    constructor() 
        ERC20("Menezes & Martins", "M&M") 
        ERC20Permit("Menezes & Martins") 
    {
        // Transfere todo o suprimento inicial para a carteira de quem implantar o contrato (Deployer)
        // A partir daí, a diretoria pode destinar os fundos para a pool de liquidez e governança.
        _mint(msg.sender, INITIAL_SUPPLY);
    }
}

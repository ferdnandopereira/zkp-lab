// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./Verificador.sol";

contract IdadeVerificador {

    HonkVerifier public verifier;

    constructor(address _verifier){
        verifier = HonkVerifier(_verifier);
    }
    // chamada da leitura (view) para verificar proof e public inputs
    // verifique a assinatura exata
    function verifyProof(bytes calldata proof, bytes32[] calldata publicInputs) external view returns (bool) {
        // assinatura do verificador pode variar
        return verifier.verify(proof, publicInputs);
    }
}
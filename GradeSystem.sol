// Licencia
// SPDX-License-Identifier: LGPL-3.0-only

// Versión solidity
pragma solidity 0.8.24;

// Contrato
contract SistemaNotas {

    // Variables
    int256 public nota = 5; // rango permitido: 0 - 10

    // Modifiers
    modifier validRange(int256 nota_) {
        if (nota_ < 0 || nota_ > 10) revert();
        _;
    }

    modifier notNegative(int256 value_) {
        if (value_ < 0) revert();
        _;
    }

    // Events
    event NotaActualizada(int256 notaAnterior, int256 notaNueva);
    event PuntosSumados(int256 puntos, int256 notaFinal);
    event PuntosRestados(int256 puntos, int256 notaFinal);

    // External functions
    // palabra (function) + nombre + argumentos + visibilidad + modificadores + valor devuelto
    function setNota(int256 nuevaNota_) public validRange(nuevaNota_) {
        int256 notaAnterior = nota;
        nota = nuevaNota_;

        emit NotaActualizada(notaAnterior, nota);
    }

    function sumarPuntos(int256 puntos_) public notNegative(puntos_) {
        int256 nuevaNota = sumar_logic(nota, puntos_);

        if (nuevaNota > 10) revert();

        int256 notaAnterior = nota;
        nota = nuevaNota;

        emit PuntosSumados(puntos_, nota);
        emit NotaActualizada(notaAnterior, nota);
    }

    function restarPuntos(int256 puntos_) public notNegative(puntos_) {
        int256 nuevaNota = restar_logic(nota, puntos_);

        if (nuevaNota < 0) revert();

        int256 notaAnterior = nota;
        nota = nuevaNota;

        emit PuntosRestados(puntos_, nota);
        emit NotaActualizada(notaAnterior, nota);
    }

    // Internal functions
    function sumar_logic(int256 a_, int256 b_) internal pure returns (int256) {
        return a_ + b_;
    }

    function restar_logic(int256 a_, int256 b_) internal pure returns (int256) {
        return a_ - b_;
    }
}

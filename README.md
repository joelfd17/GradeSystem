🎓 Grade System Smart Contract (SistemaNotas)
- A simple and educational Solidity smart contract that simulates a grade management system.
- This project is designed for beginners who want to practice core Solidity concepts such as state variables, modifiers, events, and internal logic separation.

📌 Overview
- The SistemaNotas smart contract stores a single grade and allows controlled updates by adding or subtracting points.
All operations are validated to ensure the grade always stays within a valid range (0 to 10).
- This project does not include users, addresses, ETH transfers, or advanced patterns.
Its goal is to strengthen the fundamentals before moving on to more complex smart contracts.

🛠️ Built With
- Solidity 0.8.24
- Remix IDE (recommended for deployment and testing)

📦 Features
- ✅ Stores a grade on-chain
- ✅ Ensures the grade stays between 0 and 10
- ✅ Adds and subtracts points safely
- ✅ Uses modifiers for validation
- ✅ Emits events for every state change
- ✅ Separates logic using internal pure functions


📄 Smart Contract Explanation

🔹 State Variable
The contract contains a single state variable:
- int256 public nota = 5;
This variable represents the current grade.
It is initialized with a default value of 5 and can be read publicly.

🔹 Modifiers
Two modifiers are used to validate inputs:
- validRange: Ensures a grade is between 0 and 10
- notNegative: Prevents negative values when adding or subtracting points
Modifiers help keep the code clean and reusable while enforcing consistent rules.

🔹 Events
The contract emits events every time the grade changes:
- NotaActualizada
- PuntosSumados
- PuntosRestados
Events allow external applications (frontends, indexers) to track contract activity efficiently 📡.

🔹 Core Functions
- setNota
Sets the grade directly, ensuring it is within the valid range.
- sumarPuntos
Adds points to the current grade, reverting if the result exceeds 10.
- restarPuntos
Subtracts points from the grade, reverting if the result goes below 0.
Each function updates the state safely and emits the appropriate events.

🔹 Internal Logic
The contract uses internal pure functions to handle arithmetic operations:
- function sumar_logic(int256 a_, int256 b_) internal pure returns (int256)
- function restar_logic(int256 a_, int256 b_) internal pure returns (int256)
This separation improves readability and mirrors real-world smart contract design practices.


🚀 How to Use (Quick Start)
1. Open https://remix.ethereum.org
2. Create a new file called SistemaNotas.sol
3. Paste the contract code
4. Compile using Solidity 0.8.24
5. Deploy using Remix VM
6. Interact with the functions and observe the events

🎯 Learning Goals
This project helps you understand:
- How smart contracts manage state
- How modifiers protect contract logic
- How events communicate changes
- How to structure clean and readable Solidity code
It is an ideal stepping stone before learning:
- mapping
- msg.sender
- Access control
- ERC standards

🧠 Possible Improvements
- ✨ Add custom errors
- ✨ Implement a reset function
- ✨ Track grades per user using mapping
- ✨ Add access control
- ✨ Build a frontend to read events

📜 License
This project is licensed under the LGPL-3.0-only license.

💡 If you are learning Solidity, this project is a great foundation to build confidence before moving on to real-world smart contracts.
Happy coding! 🔥

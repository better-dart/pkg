import 'dart:convert';

class ABI {
  static String get(String name) {
    List<Map<String, Object>> abi;
    switch (name) {
      case "BasicToken":
        abi = [
          {
            "constant": true,
            "inputs": [],
            "name": "name",
            "outputs": [
              {"name": "", "type": "string"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "spender", "type": "address"},
              {"name": "value", "type": "uint256"}
            ],
            "name": "approve",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "totalSupply",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "sender", "type": "address"},
              {"name": "recipient", "type": "address"},
              {"name": "amount", "type": "uint256"}
            ],
            "name": "transferFrom",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "decimals",
            "outputs": [
              {"name": "", "type": "uint8"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "spender", "type": "address"},
              {"name": "addedValue", "type": "uint256"}
            ],
            "name": "increaseAllowance",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "tokenURI",
            "outputs": [
              {"name": "", "type": "string"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_to", "type": "address"},
              {"name": "_value", "type": "uint256"},
              {"name": "_data", "type": "bytes"}
            ],
            "name": "transferAndCall",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "account", "type": "address"}
            ],
            "name": "balanceOf",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {"constant": false, "inputs": [], "name": "renounceOwnership", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function"},
          {
            "constant": true,
            "inputs": [],
            "name": "owner",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "isOwner",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "symbol",
            "outputs": [
              {"name": "", "type": "string"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "spender", "type": "address"},
              {"name": "subtractedValue", "type": "uint256"}
            ],
            "name": "decreaseAllowance",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "recipient", "type": "address"},
              {"name": "amount", "type": "uint256"}
            ],
            "name": "transfer",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "owner", "type": "address"},
              {"name": "spender", "type": "address"}
            ],
            "name": "allowance",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "newOwner", "type": "address"}
            ],
            "name": "transferOwnership",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "inputs": [
              {"name": "name", "type": "string"},
              {"name": "symbol", "type": "string"},
              {"name": "initialSupply", "type": "uint256"},
              {"name": "tokenURI", "type": "string"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "constructor"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": false, "name": "tokenURI", "type": "string"}
            ],
            "name": "TokenURIChanged",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "previousOwner", "type": "address"},
              {"indexed": true, "name": "newOwner", "type": "address"}
            ],
            "name": "OwnershipTransferred",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "from", "type": "address"},
              {"indexed": true, "name": "to", "type": "address"},
              {"indexed": false, "name": "value", "type": "uint256"},
              {"indexed": false, "name": "data", "type": "bytes"}
            ],
            "name": "Transfer",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "from", "type": "address"},
              {"indexed": true, "name": "to", "type": "address"},
              {"indexed": false, "name": "value", "type": "uint256"}
            ],
            "name": "Transfer",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "owner", "type": "address"},
              {"indexed": true, "name": "spender", "type": "address"},
              {"indexed": false, "name": "value", "type": "uint256"}
            ],
            "name": "Approval",
            "type": "event"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "tokenURI", "type": "string"}
            ],
            "name": "setTokenURI",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          }
        ];
        break;
      case "Community":
        abi = [
          {
            "constant": true,
            "inputs": [],
            "name": "name",
            "outputs": [
              {"name": "", "type": "string"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "adminMask",
            "outputs": [
              {"name": "", "type": "bytes32"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "userMask",
            "outputs": [
              {"name": "", "type": "bytes32"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "entitiesList",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "inputs": [
              {"name": "_name", "type": "string"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "constructor"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_entitiesList", "type": "address"}
            ],
            "name": "setEntitiesList",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {"constant": false, "inputs": [], "name": "join", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function"},
          {
            "constant": false,
            "inputs": [
              {"name": "_account", "type": "address"},
              {"name": "_roles", "type": "bytes32"}
            ],
            "name": "addEntity",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_account", "type": "address"}
            ],
            "name": "removeEntity",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_account", "type": "address"},
              {"name": "_entityRoles", "type": "bytes32"}
            ],
            "name": "addEnitityRoles",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_account", "type": "address"},
              {"name": "_entityRoles", "type": "bytes32"}
            ],
            "name": "removeEnitityRoles",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_account", "type": "address"},
              {"name": "_entityRoles", "type": "bytes32"}
            ],
            "name": "hasRoles",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          }
        ];
        break;
      case "CommunityManager":
        abi = [
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"}
            ],
            "name": "init",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_wallet", "type": "address"}
            ],
            "name": "getNonce",
            "outputs": [
              {"name": "nonce", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"},
              {"name": "_module", "type": "address"}
            ],
            "name": "addModule",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_token", "type": "address"}
            ],
            "name": "recoverToken",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"},
              {"name": "_data", "type": "bytes"},
              {"name": "_nonce", "type": "uint256"},
              {"name": "_signatures", "type": "bytes"},
              {"name": "_gasPrice", "type": "uint256"},
              {"name": "_gasLimit", "type": "uint256"}
            ],
            "name": "execute",
            "outputs": [
              {"name": "success", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "", "type": "address"}
            ],
            "name": "relayer",
            "outputs": [
              {"name": "nonce", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "isOnlyOwnerModule",
            "outputs": [
              {"name": "", "type": "bytes4"}
            ],
            "payable": false,
            "stateMutability": "pure",
            "type": "function"
          },
          {
            "inputs": [
              {"name": "_registry", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "constructor"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "wallet", "type": "address"},
              {"indexed": true, "name": "success", "type": "bool"},
              {"indexed": false, "name": "signedHash", "type": "bytes32"}
            ],
            "name": "TransactionExecuted",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": false, "name": "name", "type": "bytes32"}
            ],
            "name": "ModuleCreated",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": false, "name": "wallet", "type": "address"}
            ],
            "name": "ModuleInitialised",
            "type": "event"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"},
              {"name": "_community", "type": "address"}
            ],
            "name": "joinCommunity",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          }
        ];
        break;
      case "TransferManager":
        abi = [
          {
            "constant": true,
            "inputs": [],
            "name": "securityWindow",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_wallet", "type": "address"}
            ],
            "name": "getNonce",
            "outputs": [
              {"name": "nonce", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_wallet", "type": "address"}
            ],
            "name": "getCurrentLimit",
            "outputs": [
              {"name": "_currentLimit", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"},
              {"name": "_module", "type": "address"}
            ],
            "name": "addModule",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_wallet", "type": "address"}
            ],
            "name": "getDailyUnspent",
            "outputs": [
              {"name": "_unspent", "type": "uint256"},
              {"name": "_periodEnd", "type": "uint64"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "securityPeriod",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "oldLimitManager",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "transferStorage",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_token", "type": "address"}
            ],
            "name": "recoverToken",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_wallet", "type": "address"}
            ],
            "name": "getPendingLimit",
            "outputs": [
              {"name": "_pendingLimit", "type": "uint256"},
              {"name": "_changeAfter", "type": "uint64"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"},
              {"name": "_data", "type": "bytes"},
              {"name": "_nonce", "type": "uint256"},
              {"name": "_signatures", "type": "bytes"},
              {"name": "_gasPrice", "type": "uint256"},
              {"name": "_gasLimit", "type": "uint256"}
            ],
            "name": "execute",
            "outputs": [
              {"name": "success", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "priceProvider",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "", "type": "address"}
            ],
            "name": "relayer",
            "outputs": [
              {"name": "nonce", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "isOnlyOwnerModule",
            "outputs": [
              {"name": "", "type": "bytes4"}
            ],
            "payable": false,
            "stateMutability": "pure",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "guardianStorage",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "defaultLimit",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "inputs": [
              {"name": "_registry", "type": "address"},
              {"name": "_transferStorage", "type": "address"},
              {"name": "_guardianStorage", "type": "address"},
              {"name": "_priceProvider", "type": "address"},
              {"name": "_securityPeriod", "type": "uint256"},
              {"name": "_securityWindow", "type": "uint256"},
              {"name": "_defaultLimit", "type": "uint256"},
              {"name": "_oldLimitManager", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "constructor"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "wallet", "type": "address"},
              {"indexed": true, "name": "target", "type": "address"},
              {"indexed": false, "name": "whitelistAfter", "type": "uint64"}
            ],
            "name": "AddedToWhitelist",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "wallet", "type": "address"},
              {"indexed": true, "name": "target", "type": "address"}
            ],
            "name": "RemovedFromWhitelist",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "wallet", "type": "address"},
              {"indexed": true, "name": "id", "type": "bytes32"},
              {"indexed": true, "name": "executeAfter", "type": "uint256"},
              {"indexed": false, "name": "token", "type": "address"},
              {"indexed": false, "name": "to", "type": "address"},
              {"indexed": false, "name": "amount", "type": "uint256"},
              {"indexed": false, "name": "data", "type": "bytes"}
            ],
            "name": "PendingTransferCreated",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "wallet", "type": "address"},
              {"indexed": true, "name": "id", "type": "bytes32"}
            ],
            "name": "PendingTransferExecuted",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "wallet", "type": "address"},
              {"indexed": true, "name": "id", "type": "bytes32"}
            ],
            "name": "PendingTransferCanceled",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "wallet", "type": "address"},
              {"indexed": true, "name": "newLimit", "type": "uint256"},
              {"indexed": true, "name": "startAfter", "type": "uint64"}
            ],
            "name": "LimitChanged",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "wallet", "type": "address"},
              {"indexed": true, "name": "token", "type": "address"},
              {"indexed": true, "name": "amount", "type": "uint256"},
              {"indexed": false, "name": "to", "type": "address"},
              {"indexed": false, "name": "data", "type": "bytes"}
            ],
            "name": "Transfer",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "wallet", "type": "address"},
              {"indexed": true, "name": "token", "type": "address"},
              {"indexed": false, "name": "amount", "type": "uint256"},
              {"indexed": false, "name": "spender", "type": "address"}
            ],
            "name": "Approved",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "wallet", "type": "address"},
              {"indexed": true, "name": "to", "type": "address"},
              {"indexed": false, "name": "amount", "type": "uint256"},
              {"indexed": false, "name": "data", "type": "bytes"}
            ],
            "name": "CalledContract",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "wallet", "type": "address"},
              {"indexed": true, "name": "success", "type": "bool"},
              {"indexed": false, "name": "signedHash", "type": "bytes32"}
            ],
            "name": "TransactionExecuted",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": false, "name": "name", "type": "bytes32"}
            ],
            "name": "ModuleCreated",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": false, "name": "wallet", "type": "address"}
            ],
            "name": "ModuleInitialised",
            "type": "event"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"}
            ],
            "name": "init",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"},
              {"name": "_token", "type": "address"},
              {"name": "_to", "type": "address"},
              {"name": "_amount", "type": "uint256"},
              {"name": "_data", "type": "bytes"}
            ],
            "name": "transferToken",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"},
              {"name": "_token", "type": "address"},
              {"name": "_to", "type": "address"},
              {"name": "_amount", "type": "uint256"},
              {"name": "_fee", "type": "uint256"},
              {"name": "_data", "type": "bytes"}
            ],
            "name": "transferTokenWithFee",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"},
              {"name": "_token", "type": "address"},
              {"name": "_spender", "type": "address"},
              {"name": "_amount", "type": "uint256"}
            ],
            "name": "approveToken",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"},
              {"name": "_contract", "type": "address"},
              {"name": "_value", "type": "uint256"},
              {"name": "_data", "type": "bytes"}
            ],
            "name": "callContract",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"},
              {"name": "_token", "type": "address"},
              {"name": "_contract", "type": "address"},
              {"name": "_amount", "type": "uint256"},
              {"name": "_data", "type": "bytes"}
            ],
            "name": "approveTokenAndCallContract",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"},
              {"name": "_target", "type": "address"}
            ],
            "name": "addToWhitelist",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"},
              {"name": "_target", "type": "address"}
            ],
            "name": "removeFromWhitelist",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"},
              {"name": "_token", "type": "address"},
              {"name": "_to", "type": "address"},
              {"name": "_amount", "type": "uint256"},
              {"name": "_data", "type": "bytes"},
              {"name": "_block", "type": "uint256"}
            ],
            "name": "executePendingTransfer",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"},
              {"name": "_id", "type": "bytes32"}
            ],
            "name": "cancelPendingTransfer",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"},
              {"name": "_newLimit", "type": "uint256"}
            ],
            "name": "changeLimit",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"}
            ],
            "name": "disableLimit",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_wallet", "type": "address"},
              {"name": "_target", "type": "address"}
            ],
            "name": "isWhitelisted",
            "outputs": [
              {"name": "_isWhitelisted", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_wallet", "type": "address"},
              {"name": "_id", "type": "bytes32"}
            ],
            "name": "getPendingTransfer",
            "outputs": [
              {"name": "_executeAfter", "type": "uint64"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_data", "type": "bytes"},
              {"name": "_signature", "type": "bytes"}
            ],
            "name": "isValidSignature",
            "outputs": [
              {"name": "", "type": "bytes4"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_msgHash", "type": "bytes32"},
              {"name": "_signature", "type": "bytes"}
            ],
            "name": "isValidSignature",
            "outputs": [
              {"name": "", "type": "bytes4"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          }
        ];
        break;
      case "DAIPointsManager":
        abi = [
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"}
            ],
            "name": "init",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_wallet", "type": "address"}
            ],
            "name": "getNonce",
            "outputs": [
              {"name": "nonce", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_manager", "type": "address"}
            ],
            "name": "addManager",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_manager", "type": "address"}
            ],
            "name": "revokeManager",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"},
              {"name": "_module", "type": "address"}
            ],
            "name": "addModule",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "owner",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_token", "type": "address"}
            ],
            "name": "recoverToken",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_newOwner", "type": "address"}
            ],
            "name": "changeOwner",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"},
              {"name": "_data", "type": "bytes"},
              {"name": "_nonce", "type": "uint256"},
              {"name": "_signatures", "type": "bytes"},
              {"name": "_gasPrice", "type": "uint256"},
              {"name": "_gasLimit", "type": "uint256"}
            ],
            "name": "execute",
            "outputs": [
              {"name": "success", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "daiPoints",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "", "type": "address"}
            ],
            "name": "relayer",
            "outputs": [
              {"name": "nonce", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "isOnlyOwnerModule",
            "outputs": [
              {"name": "", "type": "bytes4"}
            ],
            "payable": false,
            "stateMutability": "pure",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "dai",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "", "type": "address"}
            ],
            "name": "managers",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "inputs": [
              {"name": "_registry", "type": "address"},
              {"name": "_dai", "type": "address"},
              {"name": "_daiPoints", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "constructor"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "_manager", "type": "address"}
            ],
            "name": "ManagerAdded",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "_manager", "type": "address"}
            ],
            "name": "ManagerRevoked",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "_newOwner", "type": "address"}
            ],
            "name": "OwnerChanged",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "wallet", "type": "address"},
              {"indexed": true, "name": "success", "type": "bool"},
              {"indexed": false, "name": "signedHash", "type": "bytes32"}
            ],
            "name": "TransactionExecuted",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": false, "name": "name", "type": "bytes32"}
            ],
            "name": "ModuleCreated",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": false, "name": "wallet", "type": "address"}
            ],
            "name": "ModuleInitialised",
            "type": "event"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"},
              {"name": "_amount", "type": "uint256"}
            ],
            "name": "getDAIPoints",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_wallet", "type": "address"},
              {"name": "_amount", "type": "uint256"},
              {"name": "_recipient", "type": "address"}
            ],
            "name": "getDAIPointsToAddress",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_dai", "type": "address"}
            ],
            "name": "setDaiAddress",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_daiPoints", "type": "address"}
            ],
            "name": "setDaiPointsAddress",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          }
        ];
        break;
      case "DAIPointsToken":
        abi = [
          {
            "constant": true,
            "inputs": [],
            "name": "name",
            "outputs": [
              {"name": "", "type": "string"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "spender", "type": "address"},
              {"name": "value", "type": "uint256"}
            ],
            "name": "approve",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "totalSupply",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "sender", "type": "address"},
              {"name": "recipient", "type": "address"},
              {"name": "amount", "type": "uint256"}
            ],
            "name": "transferFrom",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "daiToDaipConversionRate",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "DECIMALS",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "decimals",
            "outputs": [
              {"name": "", "type": "uint8"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "spender", "type": "address"},
              {"name": "addedValue", "type": "uint256"}
            ],
            "name": "increaseAllowance",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_to", "type": "address"},
              {"name": "_value", "type": "uint256"},
              {"name": "_data", "type": "bytes"}
            ],
            "name": "transferAndCall",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "account", "type": "address"},
              {"name": "amount", "type": "uint256"}
            ],
            "name": "mint",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "amount", "type": "uint256"}
            ],
            "name": "burn",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "account", "type": "address"}
            ],
            "name": "balanceOf",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {"constant": false, "inputs": [], "name": "renounceOwnership", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function"},
          {
            "constant": false,
            "inputs": [
              {"name": "account", "type": "address"},
              {"name": "amount", "type": "uint256"}
            ],
            "name": "burnFrom",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "owner",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "isOwner",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "symbol",
            "outputs": [
              {"name": "", "type": "string"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "account", "type": "address"}
            ],
            "name": "addMinter",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {"constant": false, "inputs": [], "name": "renounceMinter", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function"},
          {
            "constant": false,
            "inputs": [
              {"name": "spender", "type": "address"},
              {"name": "subtractedValue", "type": "uint256"}
            ],
            "name": "decreaseAllowance",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "account", "type": "address"}
            ],
            "name": "isMinter",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "owner", "type": "address"},
              {"name": "spender", "type": "address"}
            ],
            "name": "allowance",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "fee",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "bridge",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "newOwner", "type": "address"}
            ],
            "name": "transferOwnership",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "dai",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "inputs": [
              {"name": "_dai", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "constructor"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "previousOwner", "type": "address"},
              {"indexed": true, "name": "newOwner", "type": "address"}
            ],
            "name": "OwnershipTransferred",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "account", "type": "address"}
            ],
            "name": "MinterAdded",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "account", "type": "address"}
            ],
            "name": "MinterRemoved",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": false, "name": "success", "type": "bool"},
              {"indexed": false, "name": "data", "type": "bytes"}
            ],
            "name": "ContractFallback",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "from", "type": "address"},
              {"indexed": true, "name": "to", "type": "address"},
              {"indexed": false, "name": "value", "type": "uint256"},
              {"indexed": false, "name": "data", "type": "bytes"}
            ],
            "name": "Transfer",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "from", "type": "address"},
              {"indexed": true, "name": "to", "type": "address"},
              {"indexed": false, "name": "value", "type": "uint256"}
            ],
            "name": "Transfer",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "owner", "type": "address"},
              {"indexed": true, "name": "spender", "type": "address"},
              {"indexed": false, "name": "value", "type": "uint256"}
            ],
            "name": "Approval",
            "type": "event"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_address", "type": "address"}
            ],
            "name": "setDAI",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_fee", "type": "uint256"}
            ],
            "name": "setFee",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_address", "type": "address"}
            ],
            "name": "setBridge",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_rate", "type": "uint256"}
            ],
            "name": "setConversionRate",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_amount", "type": "uint256"}
            ],
            "name": "getDAIPoints",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_amount", "type": "uint256"},
              {"name": "_recipient", "type": "address"}
            ],
            "name": "getDAIPointsToAddress",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_recipient", "type": "address"},
              {"name": "_amount", "type": "uint256"}
            ],
            "name": "transfer",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_winner", "type": "address"}
            ],
            "name": "reward",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          }
        ];
        break;
      case "Wrapper":
        abi = [
          {"constant": false, "inputs": [], "name": "renounceOwnership", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function"},
          {
            "constant": true,
            "inputs": [],
            "name": "owner",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "isOwner",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "newOwner", "type": "address"}
            ],
            "name": "transferOwnership",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "previousOwner", "type": "address"},
              {"indexed": true, "name": "newOwner", "type": "address"}
            ],
            "name": "OwnershipTransferred",
            "type": "event"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_token", "type": "address"},
              {"name": "_recipient", "type": "address"},
              {"name": "_amount", "type": "uint256"},
              {"name": "_feeRecipient", "type": "address"},
              {"name": "_feeAmount", "type": "uint256"}
            ],
            "name": "transferWithFee",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_token", "type": "address"},
              {"name": "_recipient", "type": "address"},
              {"name": "_amount", "type": "uint256"},
              {"name": "_feeRecipient", "type": "address"},
              {"name": "_feeAmount", "type": "uint256"},
              {"name": "_data", "type": "bytes"}
            ],
            "name": "transferAndCallWithFee",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          }
        ];
        break;
      case "UniswapV2Router01":
        abi = [
          {
            "inputs": [
              {"internalType": "address", "name": "_factory", "type": "address"},
              {"internalType": "address", "name": "_WETH", "type": "address"}
            ],
            "stateMutability": "nonpayable",
            "type": "constructor"
          },
          {
            "inputs": [],
            "name": "WETH",
            "outputs": [
              {"internalType": "address", "name": "", "type": "address"}
            ],
            "stateMutability": "view",
            "type": "function"
          },
          {
            "inputs": [
              {"internalType": "address", "name": "tokenA", "type": "address"},
              {"internalType": "address", "name": "tokenB", "type": "address"},
              {"internalType": "uint256", "name": "amountADesired", "type": "uint256"},
              {"internalType": "uint256", "name": "amountBDesired", "type": "uint256"},
              {"internalType": "uint256", "name": "amountAMin", "type": "uint256"},
              {"internalType": "uint256", "name": "amountBMin", "type": "uint256"},
              {"internalType": "address", "name": "to", "type": "address"},
              {"internalType": "uint256", "name": "deadline", "type": "uint256"}
            ],
            "name": "addLiquidity",
            "outputs": [
              {"internalType": "uint256", "name": "amountA", "type": "uint256"},
              {"internalType": "uint256", "name": "amountB", "type": "uint256"},
              {"internalType": "uint256", "name": "liquidity", "type": "uint256"}
            ],
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "inputs": [
              {"internalType": "address", "name": "token", "type": "address"},
              {"internalType": "uint256", "name": "amountTokenDesired", "type": "uint256"},
              {"internalType": "uint256", "name": "amountTokenMin", "type": "uint256"},
              {"internalType": "uint256", "name": "amountETHMin", "type": "uint256"},
              {"internalType": "address", "name": "to", "type": "address"},
              {"internalType": "uint256", "name": "deadline", "type": "uint256"}
            ],
            "name": "addLiquidityETH",
            "outputs": [
              {"internalType": "uint256", "name": "amountToken", "type": "uint256"},
              {"internalType": "uint256", "name": "amountETH", "type": "uint256"},
              {"internalType": "uint256", "name": "liquidity", "type": "uint256"}
            ],
            "stateMutability": "payable",
            "type": "function"
          },
          {
            "inputs": [],
            "name": "factory",
            "outputs": [
              {"internalType": "address", "name": "", "type": "address"}
            ],
            "stateMutability": "view",
            "type": "function"
          },
          {
            "inputs": [
              {"internalType": "uint256", "name": "amountOut", "type": "uint256"},
              {"internalType": "uint256", "name": "reserveIn", "type": "uint256"},
              {"internalType": "uint256", "name": "reserveOut", "type": "uint256"}
            ],
            "name": "getAmountIn",
            "outputs": [
              {"internalType": "uint256", "name": "amountIn", "type": "uint256"}
            ],
            "stateMutability": "pure",
            "type": "function"
          },
          {
            "inputs": [
              {"internalType": "uint256", "name": "amountIn", "type": "uint256"},
              {"internalType": "uint256", "name": "reserveIn", "type": "uint256"},
              {"internalType": "uint256", "name": "reserveOut", "type": "uint256"}
            ],
            "name": "getAmountOut",
            "outputs": [
              {"internalType": "uint256", "name": "amountOut", "type": "uint256"}
            ],
            "stateMutability": "pure",
            "type": "function"
          },
          {
            "inputs": [
              {"internalType": "uint256", "name": "amountOut", "type": "uint256"},
              {"internalType": "address[]", "name": "path", "type": "address[]"}
            ],
            "name": "getAmountsIn",
            "outputs": [
              {"internalType": "uint256[]", "name": "amounts", "type": "uint256[]"}
            ],
            "stateMutability": "view",
            "type": "function"
          },
          {
            "inputs": [
              {"internalType": "uint256", "name": "amountIn", "type": "uint256"},
              {"internalType": "address[]", "name": "path", "type": "address[]"}
            ],
            "name": "getAmountsOut",
            "outputs": [
              {"internalType": "uint256[]", "name": "amounts", "type": "uint256[]"}
            ],
            "stateMutability": "view",
            "type": "function"
          },
          {
            "inputs": [
              {"internalType": "uint256", "name": "amountA", "type": "uint256"},
              {"internalType": "uint256", "name": "reserveA", "type": "uint256"},
              {"internalType": "uint256", "name": "reserveB", "type": "uint256"}
            ],
            "name": "quote",
            "outputs": [
              {"internalType": "uint256", "name": "amountB", "type": "uint256"}
            ],
            "stateMutability": "pure",
            "type": "function"
          },
          {
            "inputs": [
              {"internalType": "address", "name": "tokenA", "type": "address"},
              {"internalType": "address", "name": "tokenB", "type": "address"},
              {"internalType": "uint256", "name": "liquidity", "type": "uint256"},
              {"internalType": "uint256", "name": "amountAMin", "type": "uint256"},
              {"internalType": "uint256", "name": "amountBMin", "type": "uint256"},
              {"internalType": "address", "name": "to", "type": "address"},
              {"internalType": "uint256", "name": "deadline", "type": "uint256"}
            ],
            "name": "removeLiquidity",
            "outputs": [
              {"internalType": "uint256", "name": "amountA", "type": "uint256"},
              {"internalType": "uint256", "name": "amountB", "type": "uint256"}
            ],
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "inputs": [
              {"internalType": "address", "name": "token", "type": "address"},
              {"internalType": "uint256", "name": "liquidity", "type": "uint256"},
              {"internalType": "uint256", "name": "amountTokenMin", "type": "uint256"},
              {"internalType": "uint256", "name": "amountETHMin", "type": "uint256"},
              {"internalType": "address", "name": "to", "type": "address"},
              {"internalType": "uint256", "name": "deadline", "type": "uint256"}
            ],
            "name": "removeLiquidityETH",
            "outputs": [
              {"internalType": "uint256", "name": "amountToken", "type": "uint256"},
              {"internalType": "uint256", "name": "amountETH", "type": "uint256"}
            ],
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "inputs": [
              {"internalType": "address", "name": "token", "type": "address"},
              {"internalType": "uint256", "name": "liquidity", "type": "uint256"},
              {"internalType": "uint256", "name": "amountTokenMin", "type": "uint256"},
              {"internalType": "uint256", "name": "amountETHMin", "type": "uint256"},
              {"internalType": "address", "name": "to", "type": "address"},
              {"internalType": "uint256", "name": "deadline", "type": "uint256"},
              {"internalType": "bool", "name": "approveMax", "type": "bool"},
              {"internalType": "uint8", "name": "v", "type": "uint8"},
              {"internalType": "bytes32", "name": "r", "type": "bytes32"},
              {"internalType": "bytes32", "name": "s", "type": "bytes32"}
            ],
            "name": "removeLiquidityETHWithPermit",
            "outputs": [
              {"internalType": "uint256", "name": "amountToken", "type": "uint256"},
              {"internalType": "uint256", "name": "amountETH", "type": "uint256"}
            ],
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "inputs": [
              {"internalType": "address", "name": "tokenA", "type": "address"},
              {"internalType": "address", "name": "tokenB", "type": "address"},
              {"internalType": "uint256", "name": "liquidity", "type": "uint256"},
              {"internalType": "uint256", "name": "amountAMin", "type": "uint256"},
              {"internalType": "uint256", "name": "amountBMin", "type": "uint256"},
              {"internalType": "address", "name": "to", "type": "address"},
              {"internalType": "uint256", "name": "deadline", "type": "uint256"},
              {"internalType": "bool", "name": "approveMax", "type": "bool"},
              {"internalType": "uint8", "name": "v", "type": "uint8"},
              {"internalType": "bytes32", "name": "r", "type": "bytes32"},
              {"internalType": "bytes32", "name": "s", "type": "bytes32"}
            ],
            "name": "removeLiquidityWithPermit",
            "outputs": [
              {"internalType": "uint256", "name": "amountA", "type": "uint256"},
              {"internalType": "uint256", "name": "amountB", "type": "uint256"}
            ],
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "inputs": [
              {"internalType": "uint256", "name": "amountOut", "type": "uint256"},
              {"internalType": "address[]", "name": "path", "type": "address[]"},
              {"internalType": "address", "name": "to", "type": "address"},
              {"internalType": "uint256", "name": "deadline", "type": "uint256"}
            ],
            "name": "swapETHForExactTokens",
            "outputs": [
              {"internalType": "uint256[]", "name": "amounts", "type": "uint256[]"}
            ],
            "stateMutability": "payable",
            "type": "function"
          },
          {
            "inputs": [
              {"internalType": "uint256", "name": "amountOutMin", "type": "uint256"},
              {"internalType": "address[]", "name": "path", "type": "address[]"},
              {"internalType": "address", "name": "to", "type": "address"},
              {"internalType": "uint256", "name": "deadline", "type": "uint256"}
            ],
            "name": "swapExactETHForTokens",
            "outputs": [
              {"internalType": "uint256[]", "name": "amounts", "type": "uint256[]"}
            ],
            "stateMutability": "payable",
            "type": "function"
          },
          {
            "inputs": [
              {"internalType": "uint256", "name": "amountIn", "type": "uint256"},
              {"internalType": "uint256", "name": "amountOutMin", "type": "uint256"},
              {"internalType": "address[]", "name": "path", "type": "address[]"},
              {"internalType": "address", "name": "to", "type": "address"},
              {"internalType": "uint256", "name": "deadline", "type": "uint256"}
            ],
            "name": "swapExactTokensForETH",
            "outputs": [
              {"internalType": "uint256[]", "name": "amounts", "type": "uint256[]"}
            ],
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "inputs": [
              {"internalType": "uint256", "name": "amountIn", "type": "uint256"},
              {"internalType": "uint256", "name": "amountOutMin", "type": "uint256"},
              {"internalType": "address[]", "name": "path", "type": "address[]"},
              {"internalType": "address", "name": "to", "type": "address"},
              {"internalType": "uint256", "name": "deadline", "type": "uint256"}
            ],
            "name": "swapExactTokensForTokens",
            "outputs": [
              {"internalType": "uint256[]", "name": "amounts", "type": "uint256[]"}
            ],
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "inputs": [
              {"internalType": "uint256", "name": "amountOut", "type": "uint256"},
              {"internalType": "uint256", "name": "amountInMax", "type": "uint256"},
              {"internalType": "address[]", "name": "path", "type": "address[]"},
              {"internalType": "address", "name": "to", "type": "address"},
              {"internalType": "uint256", "name": "deadline", "type": "uint256"}
            ],
            "name": "swapTokensForExactETH",
            "outputs": [
              {"internalType": "uint256[]", "name": "amounts", "type": "uint256[]"}
            ],
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "inputs": [
              {"internalType": "uint256", "name": "amountOut", "type": "uint256"},
              {"internalType": "uint256", "name": "amountInMax", "type": "uint256"},
              {"internalType": "address[]", "name": "path", "type": "address[]"},
              {"internalType": "address", "name": "to", "type": "address"},
              {"internalType": "uint256", "name": "deadline", "type": "uint256"}
            ],
            "name": "swapTokensForExactTokens",
            "outputs": [
              {"internalType": "uint256[]", "name": "amounts", "type": "uint256[]"}
            ],
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {"stateMutability": "payable", "type": "receive"}
        ];
        break;
      case "MarketMaker":
        abi = [
          {
            "constant": true,
            "inputs": [],
            "name": "reserveRatio",
            "outputs": [
              {"name": "", "type": "uint32"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_supply", "type": "uint256"},
              {"name": "_reserveBalance", "type": "uint256"},
              {"name": "_totalRatio", "type": "uint32"},
              {"name": "_amount", "type": "uint256"}
            ],
            "name": "calculateFundCost",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_supply", "type": "uint256"},
              {"name": "_reserveBalance", "type": "uint256"},
              {"name": "_reserveRatio", "type": "uint32"},
              {"name": "_depositAmount", "type": "uint256"}
            ],
            "name": "calculatePurchaseReturn",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "mintedReward",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_supply", "type": "uint256"},
              {"name": "_reserveBalance", "type": "uint256"},
              {"name": "_reserveRatio", "type": "uint32"},
              {"name": "_sellAmount", "type": "uint256"}
            ],
            "name": "calculateSaleReturn",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "version",
            "outputs": [
              {"name": "", "type": "uint16"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_fromConnectorBalance", "type": "uint256"},
              {"name": "_fromConnectorWeight", "type": "uint32"},
              {"name": "_toConnectorBalance", "type": "uint256"},
              {"name": "_toConnectorWeight", "type": "uint32"},
              {"name": "_amount", "type": "uint256"}
            ],
            "name": "calculateCrossConnectorReturn",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {"constant": false, "inputs": [], "name": "renounceOwnership", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function"},
          {
            "constant": true,
            "inputs": [
              {"name": "_fromReserveBalance", "type": "uint256"},
              {"name": "_fromReserveRatio", "type": "uint32"},
              {"name": "_toReserveBalance", "type": "uint256"},
              {"name": "_toReserveRatio", "type": "uint32"},
              {"name": "_amount", "type": "uint256"}
            ],
            "name": "calculateCrossReserveReturn",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "", "type": "address"}
            ],
            "name": "reserveTokens",
            "outputs": [
              {"name": "reserveBalance", "type": "uint256"},
              {"name": "reserveRatio", "type": "uint32"},
              {"name": "supply", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "owner",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "isOwner",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_supply", "type": "uint256"},
              {"name": "_reserveBalance", "type": "uint256"},
              {"name": "_totalRatio", "type": "uint32"},
              {"name": "_amount", "type": "uint256"}
            ],
            "name": "calculateLiquidateReturn",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "newMintedReward",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "newOwner", "type": "address"}
            ],
            "name": "transferOwnership",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "inputs": [
              {"name": "_token", "type": "address"},
              {"name": "_nom", "type": "uint256"},
              {"name": "_denom", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "constructor"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "caller", "type": "address"},
              {"indexed": false, "name": "nom", "type": "uint256"},
              {"indexed": false, "name": "denom", "type": "uint256"}
            ],
            "name": "ReserveRatioUpdated",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "caller", "type": "address"},
              {"indexed": true, "name": "reserveToken", "type": "address"},
              {"indexed": false, "name": "amount", "type": "uint256"},
              {"indexed": false, "name": "returnAmount", "type": "uint256"},
              {"indexed": false, "name": "totalSupply", "type": "uint256"},
              {"indexed": false, "name": "reserveBalance", "type": "uint256"}
            ],
            "name": "BalancesUpdated",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "caller", "type": "address"},
              {"indexed": true, "name": "reserveToken", "type": "address"},
              {"indexed": false, "name": "oldReserveRatio", "type": "uint256"},
              {"indexed": false, "name": "oldSupply", "type": "uint256"},
              {"indexed": false, "name": "mint", "type": "uint256"}
            ],
            "name": "RewardMinted",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "previousOwner", "type": "address"},
              {"indexed": true, "name": "newOwner", "type": "address"}
            ],
            "name": "OwnershipTransferred",
            "type": "event"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_reserve", "type": "address"},
              {"name": "_supply", "type": "uint256"},
              {"name": "_reserveBalance", "type": "uint256"},
              {"name": "_reserveRatio", "type": "uint32"}
            ],
            "name": "initializeReserveToken",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_nom", "type": "uint256"},
              {"name": "_denom", "type": "uint256"}
            ],
            "name": "setMintedReward",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "getMintedReward",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "getNewMintedReward",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_reserve", "type": "address"}
            ],
            "name": "calculateNewReserveRatio",
            "outputs": [
              {"name": "", "type": "uint32"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_reserve", "type": "address"}
            ],
            "name": "calculateMintReward",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_reserve", "type": "address"}
            ],
            "name": "mintReward",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_reserve", "type": "address"},
              {"name": "_reserveAmount", "type": "uint256"}
            ],
            "name": "buyReturn",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_reserve", "type": "address"},
              {"name": "_tokenAmount", "type": "uint256"}
            ],
            "name": "sellReturn",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_reserve", "type": "address"},
              {"name": "_reserveAmount", "type": "uint256"}
            ],
            "name": "buy",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_reserve", "type": "address"},
              {"name": "_tokenAmount", "type": "uint256"}
            ],
            "name": "sell",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_reserve", "type": "address"}
            ],
            "name": "currentPrice",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          }
        ];
        break;
      case "Reserve":
        abi = [
          {
            "constant": true,
            "inputs": [],
            "name": "marketMaker",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {"constant": false, "inputs": [], "name": "renounceOwnership", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function"},
          {
            "constant": true,
            "inputs": [],
            "name": "owner",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "isOwner",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "lastMinted",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "rewardInterval",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "newOwner", "type": "address"}
            ],
            "name": "transferOwnership",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "inputs": [
              {"name": "_dai", "type": "address"},
              {"name": "_token", "type": "address"},
              {"name": "_marketMaker", "type": "address"},
              {"name": "_rewardInterval", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "constructor"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "caller", "type": "address"},
              {"indexed": true, "name": "token", "type": "address"},
              {"indexed": true, "name": "reserveToken", "type": "address"},
              {"indexed": false, "name": "reserveAmount", "type": "uint256"},
              {"indexed": false, "name": "minReturn", "type": "uint256"},
              {"indexed": false, "name": "actualReturn", "type": "uint256"}
            ],
            "name": "TokenPurchased",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "caller", "type": "address"},
              {"indexed": true, "name": "token", "type": "address"},
              {"indexed": true, "name": "reserveToken", "type": "address"},
              {"indexed": false, "name": "tokenAmount", "type": "uint256"},
              {"indexed": false, "name": "minReturn", "type": "uint256"},
              {"indexed": false, "name": "actualReturn", "type": "uint256"}
            ],
            "name": "TokenSold",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "caller", "type": "address"},
              {"indexed": true, "name": "rewardCollector", "type": "address"},
              {"indexed": true, "name": "token", "type": "address"},
              {"indexed": false, "name": "reserve", "type": "address"},
              {"indexed": false, "name": "mintedTokens", "type": "uint256"}
            ],
            "name": "RewardMinted",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "previousOwner", "type": "address"},
              {"indexed": true, "name": "newOwner", "type": "address"}
            ],
            "name": "OwnershipTransferred",
            "type": "event"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_marketMaker", "type": "address"}
            ],
            "name": "setMarketMaker",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_rewardInterval", "type": "uint256"}
            ],
            "name": "setRewardInterval",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_nom", "type": "uint256"},
              {"name": "_denom", "type": "uint256"}
            ],
            "name": "setMintedReward",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_reserve", "type": "address"},
              {"name": "_reserveAmount", "type": "uint256"},
              {"name": "_minReturn", "type": "uint256"}
            ],
            "name": "buy",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_reserve", "type": "address"},
              {"name": "_tokenAmount", "type": "uint256"},
              {"name": "_minReturn", "type": "uint256"}
            ],
            "name": "sell",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_reserve", "type": "address"}
            ],
            "name": "currentPrice",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_reserve", "type": "address"}
            ],
            "name": "mintReward",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {"constant": false, "inputs": [], "name": "transferReserve", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function"},
          {
            "constant": false,
            "inputs": [
              {"name": "_dest", "type": "address"}
            ],
            "name": "transferMarketMaker",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          }
        ];
        break;
      case "Seedbed":
        abi = [
          {
            "constant": true,
            "inputs": [],
            "name": "name",
            "outputs": [
              {"name": "", "type": "string"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "totalSupply",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "decimals",
            "outputs": [
              {"name": "", "type": "uint8"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "cap",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {"constant": false, "inputs": [], "name": "unpause", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function"},
          {
            "constant": true,
            "inputs": [
              {"name": "account", "type": "address"}
            ],
            "name": "isPauser",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "paused",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {"constant": false, "inputs": [], "name": "renouncePauser", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function"},
          {
            "constant": true,
            "inputs": [
              {"name": "account", "type": "address"}
            ],
            "name": "balanceOf",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {"constant": false, "inputs": [], "name": "renounceOwnership", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function"},
          {
            "constant": false,
            "inputs": [
              {"name": "account", "type": "address"}
            ],
            "name": "addPauser",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {"constant": false, "inputs": [], "name": "pause", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function"},
          {
            "constant": true,
            "inputs": [],
            "name": "owner",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "isOwner",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "symbol",
            "outputs": [
              {"name": "", "type": "string"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "account", "type": "address"}
            ],
            "name": "addMinter",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {"constant": false, "inputs": [], "name": "renounceMinter", "outputs": [], "payable": false, "stateMutability": "nonpayable", "type": "function"},
          {
            "constant": true,
            "inputs": [
              {"name": "account", "type": "address"}
            ],
            "name": "isMinter",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "owner", "type": "address"},
              {"name": "spender", "type": "address"}
            ],
            "name": "allowance",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "newOwner", "type": "address"}
            ],
            "name": "transferOwnership",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "inputs": [
              {"name": "_name", "type": "string"},
              {"name": "_symbol", "type": "string"},
              {"name": "_cap", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "constructor"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "account", "type": "address"}
            ],
            "name": "MinterAdded",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "account", "type": "address"}
            ],
            "name": "MinterRemoved",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "previousOwner", "type": "address"},
              {"indexed": true, "name": "newOwner", "type": "address"}
            ],
            "name": "OwnershipTransferred",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": false, "name": "account", "type": "address"}
            ],
            "name": "Paused",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": false, "name": "account", "type": "address"}
            ],
            "name": "Unpaused",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "account", "type": "address"}
            ],
            "name": "PauserAdded",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "account", "type": "address"}
            ],
            "name": "PauserRemoved",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "from", "type": "address"},
              {"indexed": true, "name": "to", "type": "address"},
              {"indexed": false, "name": "value", "type": "uint256"}
            ],
            "name": "Transfer",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "owner", "type": "address"},
              {"indexed": true, "name": "spender", "type": "address"},
              {"indexed": false, "name": "value", "type": "uint256"}
            ],
            "name": "Approval",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "from", "type": "address"},
              {"indexed": true, "name": "to", "type": "address"},
              {"indexed": false, "name": "value", "type": "uint256"},
              {"indexed": false, "name": "data", "type": "bytes"}
            ],
            "name": "Transfer",
            "type": "event"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "to", "type": "address"},
              {"name": "value", "type": "uint256"}
            ],
            "name": "transfer",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "spender", "type": "address"},
              {"name": "value", "type": "uint256"}
            ],
            "name": "approve",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "from", "type": "address"},
              {"name": "to", "type": "address"},
              {"name": "value", "type": "uint256"}
            ],
            "name": "transferFrom",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "to", "type": "address"},
              {"name": "value", "type": "uint256"},
              {"name": "data", "type": "bytes"}
            ],
            "name": "transferAndCall",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "to", "type": "address"},
              {"name": "value", "type": "uint256"}
            ],
            "name": "mint",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "value", "type": "uint256"}
            ],
            "name": "burn",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "from", "type": "address"},
              {"name": "value", "type": "uint256"}
            ],
            "name": "burnFrom",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "spender", "type": "address"},
              {"name": "addedValue", "type": "uint256"}
            ],
            "name": "increaseAllowance",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "spender", "type": "address"},
              {"name": "subtractedValue", "type": "uint256"}
            ],
            "name": "decreaseAllowance",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          }
        ];
        break;
      case "HomeMultiAMBErc20ToErc677":
        abi = [
          {
            "constant": false,
            "inputs": [
              {"name": "token", "type": "address"},
              {"name": "_value", "type": "uint256"}
            ],
            "name": "relayTokens",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_token", "type": "address"},
              {"name": "_maxPerTx", "type": "uint256"}
            ],
            "name": "setExecutionMaxPerTx",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_token", "type": "address"}
            ],
            "name": "maxPerTx",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_addr", "type": "address"}
            ],
            "name": "isRewardAddress",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_messageId", "type": "bytes32"}
            ],
            "name": "fixFailedMessage",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_bridgeContract", "type": "address"}
            ],
            "name": "setBridgeContract",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_token", "type": "address"},
              {"name": "_amount", "type": "uint256"}
            ],
            "name": "withinLimit",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_addr", "type": "address"}
            ],
            "name": "removeRewardAddress",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_token", "type": "address"}
            ],
            "name": "executionMaxPerTx",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_token", "type": "address"}
            ],
            "name": "isTokenRegistered",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_token", "type": "address"},
              {"name": "_dailyLimit", "type": "uint256"}
            ],
            "name": "setDailyLimit",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "isInitialized",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_token", "type": "address"},
              {"name": "_amount", "type": "uint256"}
            ],
            "name": "withinExecutionLimit",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "getCurrentDay",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_token", "type": "address"}
            ],
            "name": "executionDailyLimit",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "getBridgeMode",
            "outputs": [
              {"name": "_data", "type": "bytes4"}
            ],
            "payable": false,
            "stateMutability": "pure",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_feeType", "type": "bytes32"},
              {"name": "_token", "type": "address"},
              {"name": "_fee", "type": "uint256"}
            ],
            "name": "setFee",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_messageId", "type": "bytes32"}
            ],
            "name": "messageFixed",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_feeType", "type": "bytes32"},
              {"name": "_token", "type": "address"}
            ],
            "name": "getFee",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_token", "type": "address"},
              {"name": "_to", "type": "address"}
            ],
            "name": "claimTokens",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_address", "type": "address"}
            ],
            "name": "getNextRewardAddress",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_mediatorContract", "type": "address"}
            ],
            "name": "setMediatorContractOnOtherSide",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_feeType", "type": "bytes32"},
              {"name": "_token", "type": "address"},
              {"name": "_value", "type": "uint256"}
            ],
            "name": "calculateFee",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "rewardAddressCount",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_token", "type": "address"}
            ],
            "name": "maxAvailablePerTx",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_token", "type": "address"},
              {"name": "_dailyLimit", "type": "uint256"}
            ],
            "name": "setExecutionDailyLimit",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "mediatorContractOnOtherSide",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "owner",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_messageId", "type": "bytes32"}
            ],
            "name": "requestFailedMessageFix",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "getBridgeInterfacesVersion",
            "outputs": [
              {"name": "major", "type": "uint64"},
              {"name": "minor", "type": "uint64"},
              {"name": "patch", "type": "uint64"}
            ],
            "payable": false,
            "stateMutability": "pure",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_token", "type": "address"}
            ],
            "name": "minPerTx",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_token", "type": "address"},
              {"name": "_day", "type": "uint256"}
            ],
            "name": "totalSpentPerDay",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "token", "type": "address"},
              {"name": "_receiver", "type": "address"},
              {"name": "_value", "type": "uint256"}
            ],
            "name": "relayTokens",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_addr", "type": "address"}
            ],
            "name": "addRewardAddress",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "requestGasLimit",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "F_ADDR",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "bridgeContract",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_token", "type": "address"},
              {"name": "_maxPerTx", "type": "uint256"}
            ],
            "name": "setMaxPerTx",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "rewardAddressList",
            "outputs": [
              {"name": "", "type": "address[]"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_token", "type": "address"},
              {"name": "_minPerTx", "type": "uint256"}
            ],
            "name": "setMinPerTx",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_token", "type": "address"},
              {"name": "_day", "type": "uint256"}
            ],
            "name": "totalExecutedPerDay",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "newOwner", "type": "address"}
            ],
            "name": "transferOwnership",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_requestGasLimit", "type": "uint256"}
            ],
            "name": "setRequestGasLimit",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "FOREIGN_TO_HOME_FEE",
            "outputs": [
              {"name": "", "type": "bytes32"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_token", "type": "address"}
            ],
            "name": "dailyLimit",
            "outputs": [
              {"name": "", "type": "uint256"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "HOME_TO_FOREIGN_FEE",
            "outputs": [
              {"name": "", "type": "bytes32"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "foreignToken", "type": "address"},
              {"indexed": true, "name": "homeToken", "type": "address"}
            ],
            "name": "NewTokenRegistered",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": false, "name": "feeType", "type": "bytes32"},
              {"indexed": true, "name": "token", "type": "address"},
              {"indexed": false, "name": "fee", "type": "uint256"}
            ],
            "name": "FeeUpdated",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": false, "name": "fee", "type": "uint256"},
              {"indexed": true, "name": "token", "type": "address"},
              {"indexed": true, "name": "messageId", "type": "bytes32"}
            ],
            "name": "FeeDistributed",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "messageId", "type": "bytes32"},
              {"indexed": false, "name": "token", "type": "address"},
              {"indexed": false, "name": "recipient", "type": "address"},
              {"indexed": false, "name": "value", "type": "uint256"}
            ],
            "name": "FailedMessageFixed",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "token", "type": "address"},
              {"indexed": true, "name": "recipient", "type": "address"},
              {"indexed": false, "name": "value", "type": "uint256"},
              {"indexed": true, "name": "messageId", "type": "bytes32"}
            ],
            "name": "TokensBridged",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "token", "type": "address"},
              {"indexed": false, "name": "newLimit", "type": "uint256"}
            ],
            "name": "DailyLimitChanged",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "token", "type": "address"},
              {"indexed": false, "name": "newLimit", "type": "uint256"}
            ],
            "name": "ExecutionDailyLimitChanged",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": false, "name": "previousOwner", "type": "address"},
              {"indexed": false, "name": "newOwner", "type": "address"}
            ],
            "name": "OwnershipTransferred",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "addr", "type": "address"}
            ],
            "name": "RewardAddressAdded",
            "type": "event"
          },
          {
            "anonymous": false,
            "inputs": [
              {"indexed": true, "name": "addr", "type": "address"}
            ],
            "name": "RewardAddressRemoved",
            "type": "event"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_bridgeContract", "type": "address"},
              {"name": "_mediatorContract", "type": "address"},
              {"name": "_dailyLimitMaxPerTxMinPerTxArray", "type": "uint256[3]"},
              {"name": "_executionDailyLimitExecutionMaxPerTxArray", "type": "uint256[2]"},
              {"name": "_requestGasLimit", "type": "uint256"},
              {"name": "_owner", "type": "address"},
              {"name": "_tokenImage", "type": "address"},
              {"name": "_rewardAddreses", "type": "address[]"},
              {"name": "_fees", "type": "uint256[2]"}
            ],
            "name": "initialize",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_tokenImage", "type": "address"}
            ],
            "name": "setTokenImage",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [],
            "name": "tokenImage",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_token", "type": "address"},
              {"name": "_name", "type": "string"},
              {"name": "_symbol", "type": "string"},
              {"name": "_decimals", "type": "uint8"},
              {"name": "_recipient", "type": "address"},
              {"name": "_value", "type": "uint256"}
            ],
            "name": "deployAndHandleBridgedTokens",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_token", "type": "address"},
              {"name": "_recipient", "type": "address"},
              {"name": "_value", "type": "uint256"}
            ],
            "name": "handleBridgedTokens",
            "outputs": [],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": false,
            "inputs": [
              {"name": "_from", "type": "address"},
              {"name": "_value", "type": "uint256"},
              {"name": "_data", "type": "bytes"}
            ],
            "name": "onTokenTransfer",
            "outputs": [
              {"name": "", "type": "bool"}
            ],
            "payable": false,
            "stateMutability": "nonpayable",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_foreignToken", "type": "address"}
            ],
            "name": "homeTokenAddress",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          },
          {
            "constant": true,
            "inputs": [
              {"name": "_homeToken", "type": "address"}
            ],
            "name": "foreignTokenAddress",
            "outputs": [
              {"name": "", "type": "address"}
            ],
            "payable": false,
            "stateMutability": "view",
            "type": "function"
          }
        ];
        break;
      default:
        throw 'ABI does not exists for $name';
    }

    return jsonEncode(abi);
  }
}

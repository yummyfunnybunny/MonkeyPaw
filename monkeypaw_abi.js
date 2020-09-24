var monkeyPawABI = [ 
  { "inputs": [], 
  "stateMutability": "nonpayable", 
  "type": "constructor" 
  }, 
  { 
    "anonymous": false, 
    "inputs": [ 
      { 
        "indexed": true, 
        "internalType": "bytes32", 
        "name": "id", 
        "type": "bytes32" 
      } 
    ], 
    "name": "ChainlinkCancelled", 
    "type": "event" 
  }, 
  { 
    "anonymous": false, 
    "inputs": [ 
      { 
        "indexed": true, 
        "internalType": "bytes32", 
        "name": "id", 
        "type": "bytes32" 
      } 
    ], 
    "name": "ChainlinkFulfilled", 
    "type": "event" 
  }, 
  { 
    "anonymous": false, 
    "inputs": [ 
      { 
        "indexed": true, 
        "internalType": "bytes32", 
        "name": "id", 
        "type": "bytes32" 
      } 
    ], 
    "name": "ChainlinkRequested", 
    "type": "event" 
  }, 
  { 
    "inputs": [ 
      { 
        "internalType": "bytes32", 
        "name": "_requestId", 
        "type": "bytes32" 
      }, 
      { 
        "internalType": "uint256", 
        "name": "_result", 
        "type": "uint256" 
      } 
    ], 
    "name": "fulfillGithubPullRequestResult", 
    "outputs": [], 
    "stateMutability": "nonpayable", 
    "type": "function" 
  }, 
  { 
    "inputs": [ 
      { 
        "internalType": "string", 
        "name": "_owner", 
        "type": "string" 
      }, 
      { 
        "internalType": "string", 
        "name": "_repo", 
        "type": "string" 
      }, 
      { 
        "internalType": "string", 
        "name": "_pullRequest", 
        "type": "string" 
      } 
    ], 
    "name": "requestGithubPullRequest", 
    "outputs": [], 
    "stateMutability": "nonpayable", 
    "type": "function" 
  }, 
  { 
    "inputs": [], 
    "name": "githubPRResult", 
    "outputs": [ 
      { 
        "internalType": "uint256", 
        "name": "", 
        "type": "uint256" 
      } 
    ], 
    "stateMutability": "view", 
    "type": "function" 
  } 
]
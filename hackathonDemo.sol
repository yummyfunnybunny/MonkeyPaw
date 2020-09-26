pragma solidity ^0.6.0;

import "https://github.com/smartcontractkit/chainlink/evm-contracts/src/v0.6/ChainlinkClient.sol";
import "./mergeToken.sol";

contract hackathonDemo is ChainlinkClient {
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    
    struct Deposit {
        address account;
        string issueOrPr;
        string owner;
        string repo;
        uint256 id;
    }
    
    mapping(uint256 => Deposit) public _deposits;
    mapping(address => uint256) public _pullRequestId;
    mapping(uint256 => uint256) public _prStatus;
    uint256 public _nextDepositId = 1;
    
    uint256 public githubPRResult;
    
    /// track last usage
    uint256 public _lastUsed = 1;
    
    pawToken _pawToken;
    
    
    constructor(address pawTokenAddress) public {
    	setPublicChainlinkToken();
    	oracle = 0xcb65E9b36eB788Ab0F94f06FB3906EcfAF4e055A; // oracle address
    	jobId = "65465182d5894725b548b9a271565c00"; //job id
    	fee = 1 * 10 ** 18; // 1 LINK
    	_pawToken = pawToken(pawTokenAddress);
    }
    
    /**
     * Make initial request
     */
    function requestGithubPullRequest(string memory _owner, string memory _repo, string memory _pullRequest) public {
    	Chainlink.Request memory req = buildChainlinkRequest(jobId, address(this), this.fulfillGithubPullRequestResult.selector);
        req.add("owner", _owner);
        req.add("repo", _repo);
        req.add("pnumber", _pullRequest);
    	sendChainlinkRequestTo(oracle, req, fee);
    }
    
    /**
     * Callback function
     */
    function fulfillGithubPullRequestResult(bytes32 _requestId, uint256 _result) public recordChainlinkFulfillment(_requestId) {
    	githubPRResult = _result;
    	_prStatus[_lastUsed] = _result;
    	_lastUsed++;
    }
    
    
    event DepositEvent(address account, string issueOrPr, string owner, string repo, uint256 id);

    // This registers the pull request
    function deposit(string calldata issueOrPr, string calldata owner, string calldata repo) external {
        _deposits[_nextDepositId] = Deposit(msg.sender, issueOrPr, owner, repo, _nextDepositId);
        _pullRequestId[msg.sender] = _nextDepositId;
        _prStatus[_nextDepositId] = 206;
        _nextDepositId++;
        emit DepositEvent(msg.sender, issueOrPr, owner, repo, _nextDepositId);
    }
    
    
    function cashOut(uint256 id) public {
        if (_prStatus[id] == 404) {
            mintMergeCoin(msg.sender, 5000000000000000000);
        }
    }
    
    function mintMergeCoin(address recipient, uint256 value) internal {
        _pawToken.mint(recipient, value);
    }
  
    
}

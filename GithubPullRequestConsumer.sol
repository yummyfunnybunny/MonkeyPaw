pragma solidity ^0.6.0;

import "https://github.com/smartcontractkit/chainlink/evm-contracts/src/v0.6/ChainlinkClient.sol";

contract GithubPullRequestConsumer is ChainlinkClient {
    address private oracle;
    bytes32 private jobId;
    uint256 private fee;
    
    uint256 public githubPRResult;
    
    constructor() public {
    	setPublicChainlinkToken();
    	oracle = 0xcb65E9b36eB788Ab0F94f06FB3906EcfAF4e055A; // oracle address
    	jobId = "65465182d5894725b548b9a271565c00"; //job id
    	fee = 1 * 10 ** 18; // 1 LINK
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
    }
}
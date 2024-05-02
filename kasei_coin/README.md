# kaseicoin_challenge

## Overview

- A blockchain coin called 'Kasei coin' was created using Remix IDE, MetaMask, and Ganache.
- 'KaseiCoinCrowdsale.sol' file has all the requirements for the challenge, and 'KaseiCoinCrowdsale_with_optional_features.sol' has extra optional functions using OpenZepplin's 'CappedCrowdsale', 'TimedCrowdsale', and RefundablePostDeliveryCrowdsale'.
- In the evaluation evidence and demonstration of functionality, only the 'KaseiCoinCrowdsale.sol' was used.

## Evaluation evidence (compiled contracts)

!['Compiled 1'](./Images/Compiled_1.png)
This is the successfully compiled smart contract of 'KaseiCoin'. <br>
Instead of 0.5.5 version, 0.5.17 version was used to compile <br>

<br>

!['Compiled 2'](./Images/Compiled_2.png)
This is the successfully compiled smart contract of 'KaseiCoinCrowdsale'. <br>
Instead of 0.5.5 version, 0.5.17 version was used to compile <br>

<br>

!['Compiled 3'](./Images/Compiled_3.png)
This is the successfully compiled smart contract of 'KaseiCoinCrowdsaleDeployer' <br>
Instead of 0.5.5 version, 0.5.17 version was used to compile <br>


<br>
<br>

## Demonstration of functionality

!['Image 1'](./Images/Image_1.png)
The above image shows that Remix IDE, Metamask, and Ganache are all connected together <br>
You can see on the Remix IDE account (0xC0b...82Db5), Metamask account 5 (0Xcb69..82Db5), and the fifth account on Ganache (0xCb...Db5) all have the same balance of 104.93 ETH with the matching address, which indicates that all three programs are connected together <br>
Therefore, now we are ready to deploy the contract <br>

<br>
<br>

!['Image 2'](./Images/Image_2.png)
We are deploying the 'KaseiCoinCrowdsaleDeployer' contract here <br>
I inserted 'Kasei' for the name, 'KST' for symbol, and the (0xC0b..82Db5) as the wallet account <br>

<br>
<br>

!['Image 3'](./Images/Image_3.png)
Paying for the deployment of contract <br>

<br>
<br>

!['Image 4'](./Images/Image_4.png)
The contract has been successfully deployed. You can now see the 'kasei_crowdsale_address' and 'kasei_token_address' <br>

<br>
<br>

!['Image 5'](./Images/Image_5.png)
We are now deploying the 'KaseiCoinCrowdsale' contract <br>
In the 'At address', the 'kasei_crowdsale_address' is entered <br>

<br>
<br>

!['Image 6'](./Images/Image_6.png)
Now the 'KaseiCrowdsale' contract is deployed. You can now see the functions like 'buyTokens', 'rate', 'token', 'wallet', and ' weiRaised'. Because we did not raise any tokens, 'weiRaised' is 0 <br>

<br>
<br>

!['Image 7'](./Images/Image_7.png)
Performing 'buyTokens' function here. You can see above that value of 5 Ethers were entered, and for the beneficiary, address of (0xC0b...82Db5) was selected. <br>

<br>
<br>

!['Image 8'](./Images/Image_8.png)
Paying for the transaction <br>

<br>
<br>

!['Image 9'](./Images/Image_9.png)
Tokens were successfully bought. 'weiRaised' has been increased. <br>

<br>
<br>

!['Image 10'](./Images/Image_10.png)
We can see the from the account 5 on Metamask (0xC0b...82Db5), Ether amount has been decreased since that account paied for the transaction. <br>
Also, the created blocks are shown on Ganache as well <br>

#### End of demonstration
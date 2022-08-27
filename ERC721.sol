// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract MyNFT is ERC721URIStorage, Ownable {

   

    constructor() ERC721("iecNFT", "IT") {}
     
    

    
    bool public paused;
     uint private tokenId;
    function mintItem(address _to, string memory tokenURI, uint _tokenId)
         public onlyOwner returns (uint256) {
           require(!paused);
             
              tokenId = _tokenId;
             _mint(_to, _tokenId);
             _setTokenURI(_tokenId, tokenURI);
             return _tokenId;

    }
    // to stop minting
    function pause(bool _state) public onlyOwner {
    paused = _state;
  }
    
    function totalSupply() public view returns (uint256) {
        return tokenId;
    }

}


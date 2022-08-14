// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract MyNFT is ERC721URIStorage, Ownable {

   

    constructor() ERC721("iecToken", "IT") {}
     
    

    
     uint private tokenId;
    function mintItem(address minter, string memory tokenURI, uint _tokenId)
         public onlyOwner returns (uint256) {

             
              tokenId = _tokenId;
             _mint(minter, _tokenId);
             _setTokenURI(_tokenId, tokenURI);
             return _tokenId;

    }
    
    function totalSupply() public view returns (uint256) {
        return tokenId;
    }

}

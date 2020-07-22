pragma solidity 0.5.16;

contract friendShipCertificate{
    uint256 _issueCertificateId;
    constructor() public{
        
      _issueCertificateId =1001;
    }
    struct IssueCertificate{
        uint256 _issueCertificateId;
        bytes32 _friend1Name;
        bytes32 _friend1Place;
        address _friend1Address;
        bytes32 _friend2Name;
        bytes32 _friend2Place;
        address _friend2Address;
        uint256 _yearsOfFriendship;
    }
    IssueCertificate[] public issueCertificate;
    mapping(uint256=>IssueCertificate) getByCertificateId;
   // uint256 _issueCertificateId;
   
   function issueFriendshipCertificate(bytes32 _friend1Name,bytes32 _friend1Place,
        address _friend1Address,
        bytes32 _friend2Name,
        bytes32 _friend2Place,
        address _friend2Address,
        uint256 _yearsOfFriendship) public{
            IssueCertificate memory _issue = IssueCertificate(_issueCertificateId++,_friend1Name,_friend1Place,_friend1Address,_friend2Name,_friend2Place, _friend2Address,_yearsOfFriendship);
            issueCertificate.push(_issue);
            getByCertificateId[_issueCertificateId]=_issue;
        }
    function verifyCertificate(uint256 verifyIssueCerficateId) public view returns(bytes32 _friend1Name,bytes32 _friend1Place,
        address _friend1Address,
        bytes32 _friend2Name,
        bytes32 _friend2Place,
        address _friend2Address,
        uint256 _yearsOfFriendship){
            
        for(uint i;i<issueCertificate.length;i++){
            if(issueCertificate[i]._issueCertificateId==verifyIssueCerficateId){
                return(issueCertificate[i]._friend1Name,
                issueCertificate[i]._friend1Place,
                issueCertificate[i]._friend1Address,issueCertificate[i]._friend2Name,
                issueCertificate[i]._friend2Place,issueCertificate[i]._friend2Address,
                issueCertificate[i]._yearsOfFriendship);
            }
        }
    }
   function getAllCertificate() public view returns(bytes32[] memory, bytes32[] memory,address[] memory,bytes32[] memory, bytes32[] memory,address[] memory,uint256[] memory)
   {
       bytes32[] memory _friend1Names = new bytes32[] (issueCertificate.length);
       bytes32[] memory _friend1Places = new bytes32[] (issueCertificate.length);
       address[] memory _friend1Addresses = new address[] (issueCertificate.length);
       bytes32[] memory _friend2Names = new bytes32[] (issueCertificate.length);
       bytes32[] memory _friend2Places = new bytes32[] (issueCertificate.length);
       address[] memory _friend2Addresses = new address[] (issueCertificate.length);
       uint256[] memory _yearsOfFriendships = new uint256[] (issueCertificate.length);
       for(uint i;i<issueCertificate.length;i++){
           
              ( _friend1Names[i]= issueCertificate[i]._friend1Name,
                _friend1Places[i] = issueCertificate[i]._friend1Place,
                _friend1Addresses[i] = issueCertificate[i]._friend1Address,
                _friend2Names[i] = issueCertificate[i]._friend2Name,
                _friend2Places[i] = issueCertificate[i]._friend2Place,
                _friend2Addresses[i] = issueCertificate[i]._friend2Address,
                _yearsOfFriendships[i] = issueCertificate[i]._yearsOfFriendship);
           }
           return(_friend1Names,_friend1Places,_friend1Addresses,_friend2Names,_friend2Places,_friend1Addresses,_yearsOfFriendships);
       }
       
   }

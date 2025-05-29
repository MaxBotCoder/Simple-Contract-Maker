//SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract DispenserTypeContract {
	address Admin;
	uint public PriceOfItem;
	
	constructor(address TheAdmin){
		Admin = TheAdmin;
	}
}

contract DataStorageTypeContract {
	address Admin;
	
	constructor(address TheAdmin){
		Admin = TheAdmin;
	}
}

contract DepositTypeContract {
	address Admin;
	
	constructor(address TheAdmin){
		Admin = TheAdmin;
	}
}

contract UserEndContract {
	event ErrorMessage(string ErrorInQuestion);
}

contract ContractMaker {

	address Administrator;
	bool HaveIMadeAContractYet = false;
	
	constructor(){
		creator = msg.sender;
	}
	
	DispenserTypeContract public DTC;
	DataStorageTypeContract public DSC;
	DepositTypeContract public DPC;
	UserEndContract public UserSideContract;
	
	mapping (address => uint) public ContractNumber;
	mapping (address => mapping(string => mapping(uint => DispenserTypeContract))) public DespenserContract;
	mapping (address => mapping(string => mapping(uint => DataStorageTypeContract))) public DataStorageContract;
	mapping (address => mapping(string => mapping(uint => UserSideContract))) public DepositContract; 
	
	struct CommandList {
	}
	
	CommandList public Commands;
	
	struct ContractModData {
		
	}
	
	mapping (address => mapping(string => mapping(uint => ContractModData))) public ContractModificationData; 	
	 
	function CreateContracts (string ContractType, string memory ContractName) public {
		require(msg.sender == Administrator, "You do not have permissions to this smart contract.");
		require(ContractType == "DispenserContract" || ContractType == "dispensercontract" || ContractType == "DataContract" || ContractType == "datacontract" || ContractType == "DepositContract" || ContractType == "depositcontract", "Invalid configuration.");
		if(ContractType == "DispenserContract" || ContractType == "dispensercontract") {
			ContractNumber[msg.sender] += 1;
			DespenserContract[msg.sender][ContractName][ContractNumber] = DTC = new DispenserTypeContract();
			HaveIMadeAContractYet = true;
		} else if (ContractType == "DataContract" || ContractType == "datacontract") {
		        ContractNumber[msg.sender] += 1;
		        DataStorageContract[msg.sender][ContractName][ContractNumber] = DSC = new DataStorageTypeContract();
			HaveIMadeAContractYet = true;
		} else if (ContractType == "DepostContract" || ContractType == "depositcontract") {
			ContractNumber[msg.sender] += 1;
			DepositContract[msg.sender][ContractName][ContractNumber] = DPC = new DepositTypeContract();
			HaveIMadeAContractYet = true;
		}
	}	
	
	function AdminControllPanel(string ContractType, string ContractName, uint ContractNumber) public {
		require(msg.sender == Administrator, "You do not have permissions to this smart contract.");
		if(ContractType == "DispenserContract" || ContractType == "dispensercontract"){
		} else if (ContractType == "DataContract" || ContractType == "datacontract") {
		} else if (ContractType == "DepostContract" || ContractType == "depositcontract") {
		}
	}
	
}


/**
 *    Explain what the following code is doing in the Yul ERC20 contract
 */

{
  function allowanceStorageOffset(account, spender) -> offset {
      # gets the the acc storage offset
        offset := accountToStorageOffset(account)  
        #  stores the offset in memory
        # memory will have the first 32 bytes as the offset
        mstore(0, offset)    
        # stores the spender in the next 32 bytes (20 = 32) 
        mstore(0x20, spender)
        # compute the keccak256 of the memory for the first 64 bytes
        #  keccak256 of memory from 0 for 40(64) bytes
        offset := keccak256(0, 0x40)
      }
{

/**
 *  The function allowanceStorageOffset is a function that computes the storage offset for
   the allowance mapping in the ERC20 contract. The function takes two parameters, account
   and spender, and returns the storage offset for the allowance mapping. To do so it 
   first computes the storage offset for the account using the accountToStorageOffset function.
   It then stores the storage offset in memory and the spender in the next 32 bytes of memory. 
   Finally, it computes the keccak256 hash of the memory for the first 64 bytes, which is the 
   storage offset for the allowance mapping.
 */
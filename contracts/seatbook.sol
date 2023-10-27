// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract TicketBooking 
{

    uint[20] totalSeat = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];

    mapping (address => uint[]) bookedSeat;

    mapping (uint => bool) seatBooked;

    //To book seats
    function bookSeats(uint[] memory seatNumbers)  public
    {
        require(seatNumbers.length > 0 && seatNumbers.length <= 4, "Invalid number of seats to book");
        require(bookedSeat[msg.sender].length <= 3,"You can't book more than 4 tickets");

        for(uint i = 0; i < seatNumbers.length; i++)
        {
            uint seatNumber = seatNumbers[i];
            require(seatBooked[seatNumber] != true,"Already Booked");
            require(seatNumber >= 1 && seatNumber <=20,"Please enter valid number");
            seatBooked[seatNumber] = true;
            bookedSeat[msg.sender].push() = seatNumbers[i];
        }
        
    }

    // To get available seats
    function showAvailableSeats() public view returns (uint[] memory)
    {
        uint[] memory availableSeats = new uint[](totalSeat.length);
        uint availableCount = 0;

        for (uint i = 0; i < totalSeat.length; i++)
        {
            if (!seatBooked[totalSeat[i]])
            {
                availableSeats[availableCount] = totalSeat[i];
                availableCount++;
            }
        }

        uint[] memory result = new uint[](availableCount);
        for (uint j = 0; j < availableCount; j++)
        {
            result[j] = availableSeats[j];
        }

        return result;
    }
    
    //To check availability of a seat
    function checkAvailability(uint seatNumber) public view returns (bool) 
    {
        require(seatNumber > 0 && seatNumber <= 20, "Invalid number of seats ");
        if(seatBooked[seatNumber]==true)
        {
            return false;
        }
        else 
        {
            return true;
        }
    }
    
    //To check tickets booked by the user
    function myTickets() public view returns (uint[] memory) 
    {
        return bookedSeat[msg.sender];
        }
}

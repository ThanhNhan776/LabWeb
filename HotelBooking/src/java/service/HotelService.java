/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.BookingDetailsDAO;
import dao.HotelDAO;
import entities.TblBookingDetails;
import entities.TblHotel;
import entities.TblRoom;
import java.util.Date;
import java.util.List;

/**
 *
 * @author NhanTT
 */
public class HotelService {

    public List<TblHotel> getHotelsWithAvailableRoom(String name, String location,
            Date checkinDate, Date checkoutDate, int amount) {
        HotelDAO hotelDAO = new HotelDAO();
        List<TblHotel> hotels = hotelDAO.getAllHotels(name, location);

        BookingDetailsDAO detailsDAO = new BookingDetailsDAO();
        List<TblBookingDetails> details = detailsDAO.getBookingDetailsInPeriod(checkinDate, checkoutDate);
        
        // remove unavailable rooms from hotels
        for (TblBookingDetails detail : details) {
            boolean isBreak = false;
            for (TblHotel hotel : hotels) {
                if (isBreak) break;
                for (TblRoom room : hotel.getTblRoomCollection()) {
                    if (room.equals(detail.getRoomId())) {
                        int roomAmount = room.getAmount();
                        room.setAmount(roomAmount - detail.getAmount());
                        isBreak = true;
                        break;
                    }
                }
            }
        }
        
        return hotels;
    }
}

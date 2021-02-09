package com.koreait.baraON.dao;

import com.koreait.baraON.dto.ReservationDto;

public interface ReservationDao {
	public int reserveInsert(ReservationDto reservationDto);
	public int reserveUpdate(ReservationDto reservationDto);
}

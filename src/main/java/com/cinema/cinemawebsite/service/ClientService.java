package com.cinema.cinemawebsite.service;

import com.cinema.cinemawebsite.entities.Client;
import com.cinema.cinemawebsite.entities.IShow;
import com.cinema.cinemawebsite.entities.Seat;
import com.cinema.cinemawebsite.entities.Ticket;
import com.cinema.cinemawebsite.model.dto.ClientDto;
import com.cinema.cinemawebsite.model.dto.ReservationInformationDto;
import com.cinema.cinemawebsite.model.dto.TicketDto;
import com.cinema.cinemawebsite.model.dto.TicketMap;
import com.cinema.cinemawebsite.repositories.ClientRepository;
import com.cinema.cinemawebsite.repositories.TicketRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.LinkedList;
import java.util.List;

@Service
public class ClientService {
    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private TicketRepository ticketRepository;
    @Autowired
    private IShowService iShowService;

    @Autowired
    private MovieService movieService;

    @Autowired
    private SeatService seatService;
    @Autowired
    private CinemaService cinemaService;


    public boolean addClient(ClientDto clientDto) {
        Date date = Date.valueOf(clientDto.getDateOfBirth());
        if(clientRepository.getClientByEmail(clientDto.getEmail()) != null){
            return false;
        }
        clientRepository.addClient(clientDto.getName(), clientDto.getSurname(), clientDto.getPhoneNumber(), clientDto.getEmail(), date, passwordEncoder.encode(clientDto.getPassword()));
        return true;
    }
    public Iterable<Client> getClients(){
        return clientRepository.findAll();
    }

    public boolean deleteClient(String email){
        if(clientRepository.getClientByEmail(email) == null){
            return false;
        }
        clientRepository.deleteClient(email);
        return true;
    }

    public String getPasswordByEmail(String email){
        return clientRepository.getPasswordByEmail(email);
    }

    public String getFullNameByEmail(String email){
        return clientRepository.getFullNameByEmail(email);
    }

    public Client getClientByEmail(String email){
        return clientRepository.getClientByEmail(email);
    }

    public List<TicketMap> getTicketMap(Integer idClient, String clientEmail){
        List<Ticket> clientTickets = getTicketsByClientId(idClient);
        List<ReservationInformationDto> reservationInformationDtos = new LinkedList<>();
        List<TicketDto> ticketDtos = new LinkedList<>();

        List<TicketMap> ticketMaps = new LinkedList<>();
        for(Ticket ticket : clientTickets){
            IShow iShow = iShowService.getIShowByID(ticket.getIdiShow());
            String title = movieService.getTitleByMovieShowId(iShow.getIdShow());
            Seat seat = seatService.getSeatById(ticket.getIdSeat());
            String locationFullName = cinemaService.getLocationFullNameByCinemaId(iShow.getIdCinema());
            ticketMaps.add(new TicketMap(   new TicketDto(seat.getSeatRow(), seat.getSeatNumber(), ticket.isDiscount()),
                                            new ReservationInformationDto(clientEmail, title, iShow.getShowDate(), iShow.getShowTime().getHours(), iShow.getShowTime().getMinutes(), iShow.getShowTime()),
                                            locationFullName,
                                            seat.getRoomNumber()));
        }
        return ticketMaps;
    }

    public List<Ticket> getTicketsByClientId(Integer idClient){
        return ticketRepository.getTicketsByClientID(idClient);
    }
}

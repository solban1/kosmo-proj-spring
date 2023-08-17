package com.bhs.server.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bhs.server.domain.Board;
import com.bhs.server.domain.Diner;
import com.bhs.server.repository.DinerRepository;

@Service
public class DinerService {
    @Autowired
    private DinerRepository repository;

    public List<Diner> list(String query) {
        // return repository.findByNameOrLocation(query);
        return repository.findByNameContaining(query); // 검증완료!
    }
}
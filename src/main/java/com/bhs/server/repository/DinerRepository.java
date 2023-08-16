package com.bhs.server.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import com.bhs.server.domain.Diner;
import com.bhs.server.domain.Member;

public interface DinerRepository extends JpaRepository<Diner, Integer> {
    List<Diner> findByNameContainingOrLocationContaining(String name, String location);
}
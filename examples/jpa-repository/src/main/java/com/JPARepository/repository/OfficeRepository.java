package com.JPARepository.repository;

import com.JPARepository.model.Office;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OfficeRepository extends JpaRepository<Office, Long> {
    // see https://www.baeldung.com/spring-data-sorting
    List<Office> findByOrderByOfficeNameDesc();
}

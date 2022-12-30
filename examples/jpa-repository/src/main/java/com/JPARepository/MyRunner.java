package com.JPARepository;

import com.JPARepository.model.Office;
import com.JPARepository.repository.OfficeRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Component;

@Component
public class MyRunner implements CommandLineRunner {

    private static final Logger logger = LoggerFactory.getLogger(MyRunner.class);

    @Autowired
    private OfficeRepository OfficeRepository;

    @Override
    public void run(String... args) throws Exception {
        OfficeRepository.save(new Office("A COMPNAY",  432000));
        OfficeRepository.save(new Office("B COMPANY", 1759000));
        OfficeRepository.save(new Office("C COMPANY", 1280000));
        OfficeRepository.save(new Office("D COMPANY", 1748000));
        OfficeRepository.save(new Office("E COMPANY", 3971000));
        OfficeRepository.save(new Office("F COMPANY", 8550000));
        OfficeRepository.save(new Office("G COMPANY",  464000));
        logger.info("# of offices: {}", OfficeRepository.count());

        logger.info("All offices unsorted:");
        var offices = OfficeRepository.findAll();
        logger.info("{}", offices);
        logger.info("------------------------");

        logger.info("All offices sorted by officeName in descending order");
        var sortedoffices = OfficeRepository.findAll(Sort.by(Sort.Direction.DESC, "officeName"));
        logger.info("{}", sortedoffices);
        logger.info("------------------------");

        // see https://www.baeldung.com/spring-data-sorting
        var sortedoffices1 = OfficeRepository.findByOrderByOfficeNameDesc();
        logger.info("{}", sortedoffices1);
        logger.info("------------------------");

        logger.info("Deleting all offices");
        OfficeRepository.deleteAllInBatch();

        logger.info("# of offices: {}", OfficeRepository.count());
    }

}

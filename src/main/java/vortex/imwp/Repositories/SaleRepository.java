package vortex.imwp.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import vortex.imwp.Models.Sale;

@Repository
public interface SaleRepository extends JpaRepository<Sale, Long> {
}
